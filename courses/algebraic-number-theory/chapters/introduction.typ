#import "../prelude.typ": *

The main goal of this course is to generalize the Legendre symbol and its reciprocity laws. #text(fill: red)[change the motivation for the course, this one is quite bad.]

#definition(title: "Legendre symbol")[
  Let $p$ be a prime and $a in ZZ$ an integer coprime with $p$. The #term[Legendre symbol] is defined as
  $
    (a / p) := cases(
      1 & "if" x^2 equiv a mod p "is solvable",
      -1 & "otherwise"
    )
  $
]

#new-theorem(kind: "properties", numbering: false)[
  - _(Euler)_ The Legendre symbol is multiplicative in $a$ and for $p > 2$ it holds $
    (a / p) = a^((p-1)/2) mod p.
  $
  - _(Gauss)_ It satisfies the following reciprocity law: if $a != b$ are odd primes then $
    (a / b) (b / a) = (-1)^((a-1)/2 (b-1)/2).
  $
  - In particular we have $
    ((-1) / p) = (-1)^((p-1)/2), wide (2 / p) = (-1)^((p^2-1)/8).
  $
]

By generalizing the symbol and its properties to any power studying the absolute Galois group turns out to be foundamental.

== Hilbert's reinterpretation

Hilbert generalized the Legendre symbol, originally defined for integers and more generally for rational numbers, to the completions of $QQ$: the $p$-adic fields $QQ_p$ and the real field $QQ_infinity = RR$.

#definition(title: "Hilbert symbol")[
  For any $p in PP union {infinity}$ let $a,b in QQ_p$. The #term[Hilbert symbol] is defined as
  $
    (a,b)_p := cases(
      1 & "if" a x^2 + b y^2 = 1 "is solvable in" QQ_p,
      -1 & "otherwise"
    )
  $
]

#lemma[
  The following are equivalent:
  1. The Hilbert symbol has value $(a,b)_p = 1$;
  2. The equation $z^2 - a x^2 - b y^2 = 0$ has a non-trivial solution;
  3. The element $a in QQ_p$ is the norm of an element in $QQ_p (sqrt(b))$;
  4. The element $b in QQ_p$ is the norm of an element in $QQ_p (sqrt(a))$.
] <lemma:hilbert-symbol-trivial>

Here the norm $N : QQ_p (sqrt(a)) -> QQ_p$ is the map
$
  cases(
    id_(QQ_p) & "if" a in QQ_p^2,
    x + y sqrt(a) |-> x - y sqrt(a) & "if" a in.not QQ_p^2
  )
$
In general if $L|K$ is a finite Galois extension with group $G$, the norm is defined as $N(x) = sum_(sigma in G) sigma x$ for each $x in L$.

#proof[
  We only prove $(2) <=> (3)$ since the rest is trivial. When $b in QQ_p^2$ both conditions are always true, from now on suppose $b in.not QQ_p^2$. If $(x,y,z)$ is a solution to the equation, so is $(1,y\/x,z\/x)$ and we get $a = (z\/x)^2 - b (y\/x)^2 = N(z\/x + sqrt(b) dot y\/x)$. Conversely, if $a = N(z + sqrt(b) dot y)$ for some $y,z in QQ_p$ then the touple $(1,y,z)$ is a solution to the equation.
]

#proposition[
  If $p != 2, infinity$ then for any $a,b in ZZ$ we have
  $
    (a,b)_p & = (-1)^((p-1)/2 v_p (a) v_p (b)) dot (a / p)^(v_p (b)) dot (b / p)^(-v_p (a)) \
    & = [overline((-1)^(v_p (a) v_p (b)) dot a^(v_p (b)) dot b^(- v_p (a)))]^((p-1)/2)
  $
  where $v_p (a) = max{n in NN : p^n | a}$ is the $p$-adic valuation of $a$ and $a |-> overline(a)$ is reduction modulo $p$.

  In particular if $p divides.not a$ it simplifies to $(a,b)_p = (a / p)^(v_p (b))$.
]

#lemma[
  Let $a,b,c in QQ_p^times$. We have:
  1. $(1,c)_p = 1$;
  2. $(-c,c)_p = 1$;
  3. $(a,c)_p = 1 ==> (a b, c)_p = (a,c)_p (b,c)_p$;
  4. $(c,c)_p = (-1,c)_p$.
] <lemma:hilbert-symbol-properties>

#proof[
  Let $N : QQ_p (sqrt(c)) -> QQ_p$ be the norm. We are going to repeatedly apply #ref(<lemma:hilbert-symbol-trivial>).
  1. We have $1 = N(1)$.
  2. If $c in QQ_p^(times 2)$ is a square, then $N = id_QQ_p$, so $-c = N(-c)$. Otherwise $-c = N(c)$.
  3. If $a$ and $b$ are norms we have $
    a = N(x), b = N(y) ==> a b = N(x y), a^(-1) = N(x^(-1)).
  $ Therefore if $(a,c)_p = 1$ (i.e. $a = N(x)$) then $b = N(y) <=> a b = N(x y)$.
  4. Notice that by definition of Hilbert's symbol it is invariant under multiplication of either argument by a square. Hence $
    (c,c)_p = (-c,c)_p (c,c)_p = (-c^2,c)_p = (-1,c)_p.
  $
]

#lemma[
  If $p > 2$ and $u,v in ZZ_p^times$ then $(u,v)_p = 1$.
] <lemma:hilbert-symbol-invertible-integers>

#proof[
  Let $overline(u) = u mod p$ and $overline(v) = v mod p$, we claim $1 - overline(u) x^2 - overline(v) y^2 = 0$ has a trivial solution in $FF_p$. Indeed, since $FF_p^times$ is cyclic of order $p-1$ it contains $(p-1)/2$ squares. Adding back $0$ we get
  $
    abs({x^2 : x in FF_p}) = (p+1)/2 ==> abs({overline(u) x^2 : x in FF_p}) = abs({1-overline(v) y^2 : y in FF_p}) = (p + 1)/2.
  $
  By a counting argument these two sets have an element in common, yielding the desired solution.

  We conclude by applying #ref(<prop:hensel-lemma>) to lift the roots we found to $ZZ_p$.
]

#proposition(title: "Hensel's lemma")[
  If we take a polynomial $f in ZZ_p [x]$ and a $p$-adic number $a_0 in ZZ_p$ such that
  $
    f(a_0) equiv 0 mod p, wide f'(a_0) equiv.not 0 mod p
  $
  then there exist a $p$-adic number $a in ZZ_p$ such that $f(a) = 0$ and $a equiv a_0 mod p$. In other words, under these conditions roots can be lifted from $FF_p$ to $ZZ_p$. 
] <prop:hensel-lemma>

#proposition[
  Let $p > 2$ and $a,b in QQ_p^times$. Write them as $a = p^alpha u, b = p^beta v$ with $u,v in ZZ_p$, we have
  $
    (a,b)_p = (-1)^(alpha beta (p-1)/2) (overline(u) / p)^(-beta) (overline(v) / p)^alpha.
  $
] <prop:hilbert-symbol-explicit-formula>

#proof[
  Since $(a,b)_p$ only depends on the classes $a,b mod QQ_p^(times 2)$ we may assume $alpha, beta in {0,1}$. By symmetry we only need to check 3 cases:
  - #boxed[$alpha = beta = 0$] Apply #ref(<lemma:hilbert-symbol-invertible-integers>).
  - #boxed[$alpha = 1, beta = 0$] We need to show $(p u,v)_p = (overline(v) / p)$. We have $
    (p u, v)_p =^#ref(<lemma:hilbert-symbol-invertible-integers>) (p u, v)_p dot (u^(-1),v)_p = (p,v)_p.
  $ If $v in QQ_p^(times 2)$ is a square, then $(p,v)_p=(p,1)_p=1=(overline(v) / p)$. Otherwise, the equation $z^2 - p x^2 - y^2 = 0$ has no non-trivial solutions in $FF_p$. By homogeneity it has no non-trivial solutions in $QQ_p$ either, that is $(p,v)_p = -1$. By #ref(<prop:hensel-lemma>) we also have $(overline(v) / p) = -1$ (if $overline(v)$ was a square in $FF_p^times$ it could be lifted to a square in $ZZ_p^times$).
  - #boxed[$alpha = beta = 1$] We need to show $(p u,p v)_p = (-1)^((p-1)/2) (overline(u) / p) (overline(v) / p)$. We have $
    (p u,p v)_p =^#ref(<lemma:hilbert-symbol-properties>) (p u, p v)_p (-p v, p v)_p = (-u v,p v)_p.
  $ Since $p divides.not u v$ we can apply the previous case and get $
    (- u v, p v)_p = ((- overline(u v)) / p) = ((-1) / p) (overline(u) / p) (overline(v) / p) = (-1)^((p-1)/2) (overline(u) / p) (overline(v) / p).
  $
]

#corollary[
  When $p > 2$ we have $(a,c)_p (b,c)_p = (a b,c)_p$ for every $a,b,c in QQ_p^times$.
]

#proof[
  Let $a = p^alpha u, b = p^beta v, c = p^gamma w$ with $u,v,w in ZZ_p^times$. We have
  $
    (a,c)_p (b,c)_p & = (-1)^(alpha gamma (p-1)/2) (overline(u) / p)^(-gamma) (overline(w) / p)^alpha dot (-1)^(beta gamma (p-1)/2) (overline(v) / p)^(-gamma) (overline(w) / p)^beta \
    & = (-1)^((alpha + beta) gamma (p-1)/2) (overline(u v) / p)^(- gamma) (overline(w) / p)^(alpha + beta) \
    & = (a b, c)_p
  $
]

#proposition[
  Let $a,b in QQ_2^times$ and write them as $a = 2^alpha u, b = 2^beta v$ with $u,v in ZZ_2^times$. Define
  $
    epsilon(u) := (u-1)/2 mod 2, wide omega(u) := (u^2-1)/8 mod 2.
  $
  The $2$-adic Hilbert symbol has value
  $
    (a,b)_2 = (-1)^(epsilon(u) epsilon(v) + alpha omega(v) + beta omega(u)).
  $
  It is a bimultiplicative function.
]

#theorem(title: "Hilbert's reciprocity law")[
  For any $a,b in QQ^times$ we have
  $
    product_p (a,b)_p = 1.
  $
]

#proof[
  Hilbert's symbol is trivial for all but finitely many $p$, hence the product is well defined. Using multiplicativity in both entries we reduce to the case where both $a$ and $b$ are either $-1$ or prime.
  - #boxed[$a = b = -1$] #exercise
  - #boxed[$a = b = q$] We reduce to $(q,q)_p = (-1, q)_p$. #exercise
  - #boxed[$a=2, b>2$] If $p in.not {2,b}$ then $(2,b)_p = 1$ by #ref(<prop:hilbert-symbol-explicit-formula>). Otherwise, $
    (2,b)_2 = (-1)^(omega(b)) = (2 / b) = (2, b)_b.
  $
  - #boxed[$a > b > 2$] If $p in.not {2,a,b}$ then $(a,b)_p = 1$. Othewise, $
    (a,b)_2 = (-1)^((a-1)/2 (b-1)/2), wide (a,b)_b = (overline(a) / b), wide (a,b)_a = (overline(b) / a),
  $ and by Gauss's reciprocity law we conclude.
]

Hilbert's reciprocity law incorporates Gauss's quadratic reciprocity. Indeed, if $a,b > 0$:
- $p divides.not 2 a b ==> (a,b)_p = 1$;
- $2 divides.not a b ==> (a,b)_2 = (-1)^((a-1)/2 (b-1)/2)$;
- $(a a', b) = (a, b) (a', b)$.
Taking $a,b$ as distinct primes recovers Gauss's law. Hilbert's and Gauss's reciprocity laws are in fact equivalent statements.

== Hilbert's 9th problem

Next, Hilbert proceeded to generalize the result to $n$-powers in arbitrary number fields.

Let's consider at first the finite extensions $K|QQ$ contatining the $n$-th roots of unity $mu_n subset K$. Denote by $cal(O)_K$ the ring of integers of $K$. If $frak(p) subset cal(O)_K$ is a prime ideal the goal is to define a generalized Hilbert symbol $(a,b)_frak(p) in mu_n$ such that Hilbert's reciprocity law holds, that is $product_frak(p) (a,b)_frak(p) = 1$ for every $a,b in K^times$.

#definition(title: "Generalized Hilbert symbol in the presence of roots of unity")[
  We set
  $
    (a,b)_frak(p) := [overline((-1)^(v_frak(p) (a) v_frak(p) (b)) dot a^(v_frak(p) (b)) dot b^(-v_frak(p) (a)))]^((q-1)/n)
  $
  where $dot |-> overline(dot)$ is reduction $mod frak(p)$ and $q = abs( cal(O)_K \/ frak(p))$.
]

In particular if $frak(p) divides.not a$ it simplifies to $(a,b)_frak(p) = overline(a^((q-1)/n))^(v_frak(p) (b))$. If $v_frak(p) (b) = 1$, the value $(a,b)_frak(p)$ does not depend on the choice of $b$, and it corresponds to the unique root of unity congruent to $a^((q-1)/n) mod frak(p)$.

#definition(title: "Generalized Legendre symbol")[
  If $frak(p) divides.not a$ pick any $b in K^times$ such that $v_frak(p) (b) = 1$, we set
  $
    (a / frak(p)) := (a,b)_frak(p).
  $
]

This generalizes the classical Legendre symbol, in fact
$
  (a / frak(p)) != 1 <==> x^n = a mod frak(p) "is solvable".
$

#new-theorem(kind: "properties", numbering: false)[
  - $(a,b)_frak(p) = 1 <==> b$ is a norm from $K_frak(p)(root(n, a))$;
  - $(a,b)_frak(p) = 1 <==> a$ is a norm from $K_frak(p)(root(n, b))$;
  - $overline((a,b)_frak(p))$ is multiplicative in both entries and anti-commutative.
]

When the roots of unity are not contained in the field $mu_n subset.not K_frak(p)$ the Hilbert symbol can still be defined but it won't depend on two elements $a,b in K^times$.
Suppose for a moment $mu_n subset K_frak(p), a in.not K_frak(p)^(times n)$. The extension $K_frak(p) (root(n,a))|K_frak(p)$ is Galois with cylic group, let $G_a := "Gal"(K_frak(p) (root(n,a))|K_frak(p)) tilde.eq ZZ\/n ZZ$. There is an isomorphism
$
  "Hom"(G_a, mu_n) ->^tilde ZZ\/n ZZ, wide sigma |-> sigma(root(n,a))/root(n,a) in mu_n
$
and therefore we can interpret $a$ as the generator of this group of characters.

In general we define the Hilbert symbol
$
  "Hom"("Gal"(overline(K)_frak(p)|K_frak(p)), ZZ\/n ZZ) times K_frak(p)^times -> ZZ\/n ZZ, wide [chi, b] |-> (chi,b)_frak(p).
$
In the case where $mu_n subset K_frak(p)$ the two symbols are effectively the same: let $chi_a : sigma |-> sigma(root(n,a))/root(n,a)$, we have $(chi_a,b)_frak(p) = (a,b)_frak(p)$.

Consider a character $chi in "Hom"("Gal"(overline(K)|K),ZZ\/n ZZ)$, we shall see it induces a map $chi_frak(p)$ via
// https://q.uiver.app/#r=typst&q=WzAsMyxbMCwwLCJcIkdhbFwiKG92ZXJsaW5lKEspX2ZyYWsocCl8S19mcmFrKHApKV5cImFiXCIiXSxbMSwwLCJcIkdhbFwiKG92ZXJsaW5lKEspfEspXlwiYWJcIiJdLFsxLDEsIlpaIFxcLyBuIl0sWzAsMSwiIiwwLHsic3R5bGUiOnsidGFpbCI6eyJuYW1lIjoiaG9vayIsInNpZGUiOiJ0b3AifX19XSxbMCwyLCJjaGlfZnJhayhwKSIsMix7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFsxLDIsImNoaSJdXQ==
#align(center, diagram({
	node((-2, 0), [$"Gal"(overline(K)_frak(p)|K_frak(p))^"ab"$])
	node((-1, 0), [$"Gal"(overline(K)|K)^"ab"$])
	node((-1, 1), [$ZZ \/ n$])
	edge((-2, 0), (-1, 0), "hook->")
	edge((-2, 0), (-1, 1), [$chi_frak(p)$], label-side: right, "-->")
	edge((-1, 0), (-1, 1), [$chi$], label-side: left, "->")
}))

#theorem(title: "Artin's reciprocity law")[
  Fix an element $b in K^times$, we have
  $
    sum_frak(p) (chi_frak(p),b) = 0.
  $
]

The generalized Hilbert symbol defines a reciprocity law $K_frak(p)^times -> "Gal"(overline(K)_frak(p)|K_frak(p))^"ab"$ which is "almost" an isomorphism.
In particular, for every $n$ we have an isomorphism of finite groups $K_frak(p)^times \/ n ->^tilde "Gal"(overline(K)_frak(p)|K_frak(p))^"ab" \/ n$. To define such a map we shall contruct its dual
$
  "Hom"("Gal"(overline(K)_frak(p)|K_frak(p))^"ab"\/n,ZZ\/n) & --> "Hom"(K_frak(p)^times\/n,ZZ\/n), \
  chi & arrow.bar.long [b |-> (chi,b)_frak(p)].
$