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
]

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
]

#proof[

]

#lemma[
  If $p > 2$ and $u,v in ZZ_p^times$ then $(u,v)_p = 1$.
]

#proof[

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
]

#proof[

]

#corollary[
  When $p > 2$ we have $(a,c)_p (b,c)_p = (a b,c)_p$ for every $a,b,c in QQ_p^times$.
]

#proof[

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

]

Hilbert's reciprocity law incorporates Gauss quadratic reciprocity. Indeed, it can be shown that if $a,b > 0$:
- $p divides.not 2 a b ==> (a,b)_p = 1$;
- $2 divides.not a b ==> (a,b)_2 = (-1)^((a-1)/2 (b-1)/2)$;
- $(a a', b) = (a, b) (a', b)$.
Taking $a,b$ as distinct primes recovers Gauss law (more is true: the two statements are in fact equivalent).

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
#align(center)[#commutative-diagram(
  node((0,0),$"Gal"(overline(K)_frak(p)|K_frak(p))^"ab"$, "Gal_p"),
  node((0,1),$"Gal"(overline(K)|K)^"ab"$, "Gal"),
  node((1,1),$ZZ\/n$, "Z_n"),
  arr("Gal_p", "Gal", "", "inj"),
  arr("Gal_p", "Z_n", $chi_frak(p)$, label-pos: right, "dashed"),
  arr("Gal", "Z_n", $chi$)
)]

#theorem(title: "Artin reciprocity law")[
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