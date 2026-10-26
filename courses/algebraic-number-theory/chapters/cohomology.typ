#import "../prelude.typ": *

== Construction of the cohomology

#definition(title: $G$ + "-modules")[
  Let $G$ be a group. A #term[$G$-module] is an abelian group $A$ equipped with a left action by $G$ denoted by $(sigma,a) |-> sigma a$. Equivalently, this is a left module over $ZZ[G]$.

  We say a $G$-module $A$ is #term[trivial] if $sigma a = a$ for every $a in A$. A #term[morphism of $G$-modules] is a homomorphism of abelian groups compatible with the $G$-action. These form a group denoted $"Hom"_G (dot,dot)$.
]

We denote by $A^G$ the submodule of $G$-invariant elements of $A$, that is
$
  A^G := {a in A : sigma a = a "for every" sigma in G}.
$

For every $G$-module $A$ we shall define abelian groups $H^i (G,A)$, indexed by $i > 0$, satisfying:
- $H^0 (G,A) = A^G$;
- Every $G$-morphism $A -> B$ induces a homomorphism $H^i (G,A) -> H^i (G,B)$, for every $i$;
- Given a short exact sequence of $G$-modules $0 -> A -> B -> C -> 0$ there is a long exact sequence $
  0 -> H^0(G,A) -> H^0(G,B) -> H^0(G,C) -> H^1(G,A) -> dots
$

#definition(title: "Group cohomology")[
  Given a $G$-module $A$, we define the $i$-th cohomology group of $G$
  with coefficients in $A$ as
  $
    H^i (G,A) := "Ext"_(ZZ[G])^i (ZZ,A).
  $
]

We now recall how the $"Ext"$ functor is constructed, aiming at computing some useful group cohomologies.

#definition(title: "Complexes of modules")[
  A #term[(cochain) complex of modules], denoted $A^bullet$, is a sequence of modules
  $
    dots --> A^i -->^(d^i) A^(i+1) -->^(d^(i+1)) A^(i+2) --> dots
  $
  such that every composition of maps vanishes, i.e. $d^(i+1) compose d^i = 0$ for every $i$.

  A #term[morphism of complexes] $phi : A^bullet -> B^bullet$ is a collection of homomorphisms $phi^i : A^i -> B^i$ such that all diagrams commute.

  A #term[short exact sequence of complexes] is a sequence of morphisms $0 -> A^bullet -> B^bullet -> C^bullet -> 0$ such that every short sequence $0 -> A^i -> B^i -> C^i -> 0$ is exact.
]

#definition(title: "Cohomology")[
  Let $A^bullet$ be a complex of modules with boundary maps $d^i$. We define the group of #term[$i$-cocycles] as $cal(Z)^i (A^bullet) := ker d^i$, the group of #term[$i$-coboundaries] as $cal(B)^i (A^bullet) := im d^(i+1)$ and the group of #term[$i$-cochains] (also called the #term[$i$-th cohomology group]) as the quotient $H^i (A^bullet) := cal(Z)^i (A^bullet) \/ cal(B)^i (A^bullet)$.
]

#proposition(title: "Long exact sequence in cohomology")[
  Let $0 -> A^bullet -> B^bullet -> C^bullet -> 0$ be a short exact sequence of complexes. There is a long exact sequence
  $
    dots -> H^i (A^bullet) -> H^i (B^bullet) -> H^i (C^bullet) -> H^(i+1)(A^bullet) -> dots
  $
]

#definition(title: "Projective modules")[
  A (left) $R$-module is #term[projective] if every surjective map $alpha : A ->> B$ induces a surjective map $alpha : "Hom"(P,A) ->> "Hom"(P,B)$. In other words, if the functor $"Hom"(P,dot)$ is right exact.
]

The ring $R$ as a module over itself is projective, and the direct sum of projective modules is still projective. In particular free $R$-modules are always projective.

#definition(title: "Projective resolutions")[
  Let $M$ be a $R$-module. A #term[projective resolution of $M$] is an exact sequence
  $
    dots --> P_2 --> P_1 --> P_0 --> M --> 0
  $
  where each $P_i$ is projective.
]

To write a projective resolution as a #emph[cochain] complex we can use the indexing $P^i = P_(-i)$.

#new-theorem(kind: "fact", numbering: false)[
  Projective resolutions exist for any $R$-module, and moreover we can always find #emph[free] resolutions for any $R$-module.
]

Let $A$ be a $G$-module, and let $P_bullet -> ZZ$ be any projective resolution of $ZZ$ as a trivial $G$-module. Applying the functor $"Hom"_G (dot,A)$ yields a cochain complex $"Hom"_G (P_bullet, A)$, whose $i$-th cohomology group is by definition $"Ext"_(ZZ[G])^i (ZZ, A)$. Thus,
$
  H^i (G,A) = "Ext"_(ZZ[G]) (ZZ, A) = H^i ("Hom"_G (P_bullet, A)).
$
In particular we have $H^0 (ZZ, A) = "Hom"_G (ZZ, A) = A^G$. Indeed, any $G$-morphism $phi : ZZ -> A$ is uniquely determined by $phi(1)$. Since $ZZ$ is trivial, we must have $phi(1) = phi(sigma 1) = sigma phi(1)$ for every $sigma in G$, that is $phi(1) in A^G$. Conversely, any choice of an element in $A^G$ defines such a morphism.

For group cohomology to be well-defined, and more generally for the $"Ext"$ functor to be so, we need to check that the cohomology groups we get do not depend on the choice of a projective resolution for $ZZ$.

#lemma[
  Let $P_bullet -> A$ be a projective resolution of $A$ and $B_bullet -> B -> 0$ an exact sequence. A morphism $alpha : A -> B$ can be lifted to a morphism of complexes via the diagram
  // https://q.uiver.app/#r=typst&q=WzAsMTIsWzAsMCwiZG90cyJdLFsxLDAsIlBfMiJdLFsyLDAsIlBfMSJdLFszLDAsIlBfMCJdLFs0LDAsIkEiXSxbNSwwLCIwIl0sWzAsMSwiZG90cyJdLFsxLDEsIkJfMiJdLFsyLDEsIkJfMSJdLFszLDEsIkJfMCJdLFs0LDEsIkIiXSxbNSwxLCIwIl0sWzAsMV0sWzEsMl0sWzIsM10sWzMsNF0sWzQsNV0sWzYsN10sWzcsOF0sWzgsOV0sWzksMTBdLFsxMCwxMV0sWzQsMTAsImFscGhhIl0sWzMsOSwiYWxwaGFfMCIsMCx7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFsyLDgsImFscGhhXzEiLDAseyJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJkYXNoZWQifX19XSxbMSw3LCJhbHBoYV8yIiwwLHsic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiZGFzaGVkIn19fV1d
#align(center, diagram({
	node((-3, -1), [$dots$])
	node((-2, -1), [$P_2$])
	node((-1, -1), [$P_1$])
	node((0, -1), [$P_0$])
	node((1, -1), [$A$])
	node((2, -1), [$0$])
	node((-3, 0), [$dots$])
	node((-2, 0), [$B_2$])
	node((-1, 0), [$B_1$])
	node((0, 0), [$B_0$])
	node((1, 0), [$B$])
	node((2, 0), [$0$])
	edge((-3, -1), (-2, -1), "->")
	edge((-2, -1), (-1, -1), "->")
	edge((-1, -1), (0, -1), "->")
	edge((0, -1), (1, -1), "->")
	edge((1, -1), (2, -1), "->")
	edge((-3, 0), (-2, 0), "->")
	edge((-2, 0), (-1, 0), "->")
	edge((-1, 0), (0, 0), "->")
	edge((0, 0), (1, 0), "->")
	edge((1, 0), (2, 0), "->")
	edge((1, -1), (1, 0), [$alpha$], label-side: left, "->")
	edge((0, -1), (0, 0), [$alpha_0$], label-side: left, "-->")
	edge((-1, -1), (-1, 0), [$alpha_1$], label-side: left, "-->")
	edge((-2, -1), (-2, 0), [$alpha_2$], label-side: left, "-->")
}))
  Moreover, the maps induced in cohomology $H^i (alpha_i) : H^i (P_bullet) -> H^i (B_bullet)$ are unique.
] <lemma:projective-resolution-lift>

#proof[
  Let $alpha_(-1) = alpha$ and $alpha_(-2) = 0$, we are going to construct $alpha_i$ by induction on $i$. Consider the diagram:
  // https://q.uiver.app/#r=typst&q=WzAsMTAsWzAsMCwiZG90cyJdLFsxLDAsIlBfKGkrMSkiXSxbMCwxLCJkb3RzIl0sWzEsMSwiQl8oaSsxKSJdLFsyLDEsIkJfaSJdLFsyLDAsIlBfaSJdLFszLDAsIlBfKGktMSkiXSxbMywxLCJCXyhpLTEpIl0sWzQsMCwiZG90cyJdLFs0LDEsImRvdHMiXSxbMCwxXSxbMiwzXSxbMSwzLCJhbHBoYV8oaSsxKSIsMix7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFsxLDQsInRpbGRlKGFscGhhKV8oaSsxKSIsMCx7ImN1cnZlIjoxfV0sWzMsNCwiYl8oaSsxKSIsMl0sWzEsNSwicF8oaSsxKSJdLFs1LDQsImFscGhhX2kiXSxbNSw2LCJwX2kiXSxbNiw3LCJhbHBoYV8oaS0xKSJdLFs0LDcsImJfaSIsMl0sWzYsOF0sWzcsOV1d
#align(center, diagram({
	node((-2, -1), [$dots$])
	node((-1, -1), [$P_(i+1)$])
	node((-2, 0), [$dots$])
	node((-1, 0), [$B_(i+1)$])
	node((0, 0), [$B_i$])
	node((0, -1), [$P_i$])
	node((1, -1), [$P_(i-1)$])
	node((1, 0), [$B_(i-1)$])
	node((2, -1), [$dots$])
	node((2, 0), [$dots$])
	edge((-2, -1), (-1, -1), "->")
	edge((-2, 0), (-1, 0), "->")
	edge((-1, -1), (-1, 0), [$alpha_(i+1)$], label-side: right, "-->")
	edge((-1, -1), (0, 0), [$tilde(alpha)_(i+1)$], label-side: left, "->", bend: -18deg)
	edge((-1, 0), (0, 0), [$b_(i+1)$], label-side: right, "->")
	edge((-1, -1), (0, -1), [$p_(i+1)$], label-side: left, "->")
	edge((0, -1), (0, 0), [$alpha_i$], label-side: left, "->")
	edge((0, -1), (1, -1), [$p_i$], label-side: left, "->")
	edge((1, -1), (1, 0), [$alpha_(i-1)$], label-side: left, "->")
	edge((0, 0), (1, 0), [$b_i$], label-side: right, "->")
	edge((1, -1), (2, -1), "->")
	edge((1, 0), (2, 0), "->")
}))
  Let $tilde(alpha)_(i+1) : P_(i+1) -> im alpha_i subset.eq B_i$ be the map $tilde(alpha)_(i+1) = alpha_i compose p_(i+1)$. Since $
  b_i compose tilde(alpha)_(i+1) = b_i compose alpha_i compose p_(i+1) = alpha_(i-1) compose p_i compose p_(i+1) = 0
  $
  we have $im tilde(alpha)_(i+1) subset.eq ker b_i = im b_(i+1)$ by exactness. Moreover, $P_(i+1)$ is projective and we can lift $tilde(alpha)_(i+1)$ to a map $alpha_(i+1) : P_(i+1) -> B_(i+1)$ through $tilde(alpha)_(i+1) = b_(i+1) compose alpha_(i+1)$. By definition of $alpha_(i+1)$ the diagram commutes.

  We proceed to show the uniqueness of $H^i (alpha_i)$. By induction we construct maps $gamma_i : P_i -> B_(i+1)$ such that if $(alpha_i), (beta_i)$ are two extensions of $alpha$ we have
  $
    alpha_i - beta_i = gamma_(i-1) compose p_i + b_(i+1) compose gamma_i,
  $
  that is $alpha_i$ and $beta_i$ are cochain-homotopic. This ensures they induce the same maps in cohomology.
]

#proposition(title: "Good definition of group cohomology")[
  The cohomology groups $H^i (G,A)$ do not depend on the choice of a projective resolution $P_bullet -> ZZ$.
]

#proof[
  Let $P_bullet -> A$ and $Q_bullet -> A$ be two projective resolutions of $A$. Apply #ref(<lemma:projective-resolution-lift>) to the following diagram:
  // https://q.uiver.app/#r=typst&q=WzAsMTgsWzAsMCwiZG90cyJdLFsxLDAsIlBfMiJdLFsyLDAsIlBfMSJdLFszLDAsIlBfMCJdLFs0LDAsIlpaIl0sWzUsMCwiMCJdLFswLDEsImRvdHMiXSxbMSwxLCJRXzIiXSxbMiwxLCJRXzEiXSxbMywxLCJRXzAiXSxbNCwxLCJaWiJdLFs1LDEsIjAiXSxbMCwyLCJkb3RzIl0sWzEsMiwiUF8yIl0sWzIsMiwiUF8xIl0sWzMsMiwiUF8wIl0sWzQsMiwiWloiXSxbNSwyLCIwIl0sWzAsMV0sWzEsMl0sWzIsM10sWzMsNF0sWzQsNV0sWzYsN10sWzcsOF0sWzgsOV0sWzksMTBdLFsxMCwxMV0sWzQsMTAsImlkIl0sWzMsOSwiYWxwaGFfMCIsMCx7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFsyLDgsImFscGhhXzEiLDAseyJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJkYXNoZWQifX19XSxbMSw3LCJhbHBoYV8yIiwwLHsic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiZGFzaGVkIn19fV0sWzEyLDEzXSxbMTMsMTRdLFsxNCwxNV0sWzE1LDE2XSxbMTYsMTddLFs3LDEzLCJhbHBoYSdfMiIsMCx7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFs4LDE0LCJhbHBoYSdfMSIsMCx7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFs5LDE1LCJhbHBoYSdfMCIsMCx7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFsxMCwxNiwiaWQiXSxbMywxNSwiaWQiLDIseyJsYWJlbF9wb3NpdGlvbiI6MzAsImN1cnZlIjoxfV0sWzIsMTQsImlkIiwyLHsibGFiZWxfcG9zaXRpb24iOjMwLCJjdXJ2ZSI6MX1dLFsxLDEzLCJpZCIsMix7ImxhYmVsX3Bvc2l0aW9uIjozMCwiY3VydmUiOjF9XV0=
#align(center, diagram({
	node((-3, -1), [$dots$])
	node((-2, -1), [$P_2$])
	node((-1, -1), [$P_1$])
	node((0, -1), [$P_0$])
	node((1, -1), [$ZZ$])
	node((2, -1), [$0$])
	node((-3, 0), [$dots$])
	node((-2, 0), [$Q_2$])
	node((-1, 0), [$Q_1$])
	node((0, 0), [$Q_0$])
	node((1, 0), [$ZZ$])
	node((2, 0), [$0$])
	node((-3, 1), [$dots$])
	node((-2, 1), [$P_2$])
	node((-1, 1), [$P_1$])
	node((0, 1), [$P_0$])
	node((1, 1), [$ZZ$])
	node((2, 1), [$0$])
	edge((-3, -1), (-2, -1), "->")
	edge((-2, -1), (-1, -1), "->")
	edge((-1, -1), (0, -1), "->")
	edge((0, -1), (1, -1), "->")
	edge((1, -1), (2, -1), "->")
	edge((-3, 0), (-2, 0), "->")
	edge((-2, 0), (-1, 0), "->")
	edge((-1, 0), (0, 0), "->")
	edge((0, 0), (1, 0), "->")
	edge((1, 0), (2, 0), "->")
	edge((1, -1), (1, 0), [$id$], label-side: left, "->")
	edge((0, -1), (0, 0), [$alpha_0$], label-side: left, "-->")
	edge((-1, -1), (-1, 0), [$alpha_1$], label-side: left, "-->")
	edge((-2, -1), (-2, 0), [$alpha_2$], label-side: left, "-->")
	edge((-3, 1), (-2, 1), "->")
	edge((-2, 1), (-1, 1), "->")
	edge((-1, 1), (0, 1), "->")
	edge((0, 1), (1, 1), "->")
	edge((1, 1), (2, 1), "->")
	edge((-2, 0), (-2, 1), [$alpha'_2$], label-side: left, "-->")
	edge((-1, 0), (-1, 1), [$alpha'_1$], label-side: left, "-->")
	edge((0, 0), (0, 1), [$alpha'_0$], label-side: left, "-->")
	edge((1, 0), (1, 1), [$id$], label-side: left, "->")
	edge((0, -1), (0, 1), [$id$], label-side: right, label-pos: 0.3, "->", bend: -18deg)
	edge((-1, -1), (-1, 1), [$id$], label-side: right, label-pos: 0.3, "->", bend: -18deg)
	edge((-2, -1), (-2, 1), [$id$], label-side: right, label-pos: 0.3, "->", bend: -18deg)
}))
  By uniqueness of the maps in cohomology we deduce $H^i (alpha'_i compose alpha_i) = id$ for every $i$. Similarly, by swapping the roles of $P_bullet$ and $Q_bullet$ we have $H^i (alpha_i compose alpha'_i) = id$. Thus, $H^i (alpha_i)$ and $H^i (alpha'_i)$ are mutually inverse isomorphisms.
]

#example(title: "Standard resolution")[
  For any $i >= 0$ let $G^(i + 1) := underbrace(G times dots times G, i + 1)$. The ring $ZZ[G^(i + 1)]$ has the structure of a $G$-module via
  $
    sigma (sigma_0, dots, sigma_i) |-> (sigma sigma_0, dots, sigma sigma_i).
  $
  Moreover, this is a free $G$-module with basis $(1,sigma_1,dots,sigma_i)$. Define the maps
  $
    s_j^i : ZZ[G^(i+1)] & --> ZZ[G^i] \
    (sigma_0,dots,sigma_i) & mapsto.long (sigma_0,dots,hat(sigma)_j,dots,sigma_i),
  $
  the notation $hat(sigma)_j$ means the corresponding term is omitted.
  We use them to build $G$-morphisms $delta^i : ZZ[G^(i+1)] -> ZZ[G^i]$ as $delta^i = sum_(j=0)^i (-1)^j s_j^i$. It is easy to check $delta^i compose delta^(i+1) = 0$, thus we get a cochain complex
  $
    dots -->^(delta^2) ZZ[G^2] -->^(delta^1) ZZ[G^1] & -->^(delta^0) ZZ -> 0. \
    sigma & mapsto.long 1
  $
  This is a projective (actually free!) resolution of $ZZ$, called the #term[standard resolution].
  To see that it is exact, fix $sigma in G$ and define
  $
  h^i : ZZ[G^(i+1)] & --> ZZ[G^(i+2)], \
  (sigma_0,dots,sigma_i) & mapsto.long (sigma,sigma_0,dots,sigma_i).
  $
  One can check that these maps satisfy
  $
    delta^(i+1) compose h^i + h^(i-1) compose delta^i = id_(ZZ[G^(i+1)]).
  $
  If we apply it to $x in ker delta^i$ we get $x = delta^(i+1) compose h^i (x)$, hence $x in im delta^(i+1)$. This concludes $im delta^(i+1) = ker delta^i$.

  Instead of using the basis $(1,sigma_1,dots,sigma_i)$ of $ZZ[G^(i+1)]$ sometimes it can be useful to consider the basis
  $
    [sigma_1,dots,sigma_i] = (1, sigma_1, sigma_1 sigma_2, dots, sigma_1 dots sigma_i).
  $
  With respect to this basis the boundary maps have values
  $
    delta^i ([sigma_1,dots,sigma_i]) = sigma_1 [sigma_2,dots,sigma_i] + sum_(j=1)^(i-1) (-1)^j [sigma_1, dots, sigma_j sigma_(j+1), dots sigma_i] + (-1)^(i+1) [sigma_1,dots,sigma_(i-1)].
  $
  We can view $i$-cochains as maps
  $
    ZZ[G^(i+1)] & --> A, \
    [sigma_1,dots,sigma_i] & mapsto.long a_(sigma_1,dots,sigma_i),
  $
  the inhomogeneous convention turns out to be more convenient for computations. Let's explicitate the $1$-cochains: they are maps of the form $sigma |-> a_sigma$. Let $partial^i$ be the maps induced in cohomology by the $delta^i$. By definition $1$-cocyles satisfy
  $
    0 = (partial^2 a)[sigma,tau] = a(delta^2[sigma,tau])= a(sigma [tau]) - a([sigma tau]) + a([sigma]) = sigma a_tau - a_(sigma tau) + a_sigma.
  $
  On the other hand, $1$-coboundaries are of the form $partial^1 phi$ for some $phi in "Hom"_G (ZZ[G],A)$. If $phi(1) = a$ we get
  $
    sigma mapsto.long partial^1phi([sigma]) = phi(delta^1[sigma]) = phi(1-sigma) = a-sigma a.
  $
  Thus, $1$-cochains form the group
  $
    H^1(G,A) = {sigma |-> a_sigma : a_(sigma tau) = sigma a_tau + a_sigma} / {sigma |-> a - sigma a}.
  $
  In particular, when $A$ is a trivial $G$-group the cocycle condition becomes $a_(sigma tau) = a_tau + a_sigma$, that is $H^1(G,A) = "Hom"(G,A)$.
]

#example(title: "Cohomology of cyclic groups")[
  Given any group $G$, define the #term[augmentation map] $epsilon : ZZ[G] -> ZZ$ by $sigma |-> 1$ for every $sigma in G$.
  
  Let's compute the cohomology of cyclic groups.
  1. Let $G = ZZ = chevron.l sigma chevron.r$, the sequence $
    0 --> ZZ[G] -->^(sigma - 1) ZZ[G] -->^epsilon ZZ --> 0
  $ is a projective resolution. We get $
    H^0(ZZ,A) = A^ZZ, wide H^1(ZZ,A) = A / ((sigma - 1) A), wide H^i (ZZ,A) = 0 "for" i >= 2.
  $
  2. Let $G = C_n = chevron.l sigma chevron.r$ and consider the norm element $N = sum_(i=0)^(n-1) sigma^i$. The sequence $
    dots -->^(sigma - 1) ZZ[G] -->^N ZZ[G] -->^(sigma - 1) ZZ[G] -->^epsilon ZZ --> 0
  $ is a projective resolution where the maps $(sigma - 1)$ and $N$ alternate. We get $
    H^0(C_n,A) = A^(C_n), wide H^(2 i - 1)(C_n,A) = attach(A, bl: N) / ((sigma - 1)A), wide H^(2 i)(C_n,A) = A^(C_n) / (N A)
  $ for every $i >= 1$, where $attach(A, bl: N) := ker N$.
]

== Restriction, co-restriction, inflation