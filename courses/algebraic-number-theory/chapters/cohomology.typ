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

#definition(title: "Co-induced modules")[
  Let $A$ be a $G$-module and let $H <= G$. We define the #term[co-induced module from $H$ to $G$] as
  $
    M^G_H (A) := "Hom"_H (ZZ[G], A).
  $
  The group $G$ acts on $phi in M^G_H (A)$ by $sigma(phi)(g) = phi(g dot sigma)$, the action is well defined: indeed, $h phi(g dot sigma) = phi(h g dot sigma)$ is still a $H$-morphism.
]

#lemma[
  Let $A,M$ be $G$-modules and let $H <= G$. There is a canonical isomorphism
  $
    "Hom"_G (M,M^G_H (A)) tilde.eq "Hom"_H (M,A).
  $
] <lemma:coinduced-duality>

#proof[
  Given a $G$-morphism
  $
    M --> "Hom"_H (ZZ[G],A), wide m mapsto.long phi_m
  $
  we map it to $[m |-> phi_m (1)] in "Hom"_G (M,A)$.
  Viceversa, if $lambda : M -> A$ is a $H$-morphism we map it to
  $
    m mapsto.long lambda_m in "Hom"_H (ZZ[G],A), wide lambda_m (g) = lambda(g dot m).
  $
  The two maps are mutually inverse isomorphisms.
]

#corollary(title: "Shapiro's lemma")[
  There is a canonical isomorphism
  $
    H^i (G,M^G_H (A)) tilde.eq H^i (H,A).
  $
] <lemma:shapiro>

#proof[
  Let $P_bullet -> ZZ$ be a projective resolution of $ZZ$ by $G$-modules. Since $ZZ[G]$ is free as a $ZZ[H]$-module, each $P_i$ is is also projective as a $H$-module. Hence, $P_bullet -> ZZ$ is also a projective resolution of $ZZ$ by $H$-modules. By #ref(<lemma:coinduced-duality>) we get an isomorphism of cochain complexes $"Hom"_G (P_bullet, M^G_H (A)) tilde.eq "Hom"_H (P_bullet, A)$ which induces the desired isomorphism in cohomology.
]

#corollary[
  In particular when $H = {1} <= G$ we have
  $
    H^i (G,M^G_{1} (A)) = 0 "for" i > 0.
  $
] <cor:coinduced-trivial-cohomology>

#proof[
  By #ref(<lemma:shapiro>) we have $H^i (G,M^G_{1} (A)) tilde.eq H^i ({1},A)$. By using the projective resolution $0 -> ZZ -> ZZ -> 0$ we get that $H^i ({1},A) = 0$ for $i > 0$.
]

#remark[
  We call $M^G (A) := M^G_{1} (A)$ the #term[co-induced module from $A$]. There is an injective map
  $
    A arrow.long M^G (A), wide a mapsto.long [sigma |-> sigma a].
  $
  In this sense the co-induced module behaves similarly to an injective module (even if in general it is not one).
]

Consider now a $G$-module $A$, there is a $G$-morphism
$
  A -->^tilde "Hom"_G (ZZ[G],A) --> "Hom"_H (ZZ[G],A) = M^G_H (A)
$
corresponding to the inclusion $A arrow.hook M^G_H (A)$.

#definition(title: "Restriction map")[
  The #term[restriction map] is the map induced by the inclusion $A arrow.hook M^G_H (A)$ on the group cohomology
  $
    "Res" : H^i (G,A) --> H^i (G,M^G_H (A)) =^#ref(<lemma:shapiro>) H^i (H,A).
  $
  In terms of $i$-cocycles it sends $phi : G^i -> A$ to its restriction $evaluated(phi)_H : H^i -> A$.
]

Consider a normal subgroup $H triangle.l G$ and a $G$-module $A$. The action of $G$ on $A^H$ factorizes through $G\/H$, thus $A^H$ is also a $G\/H$-module.
Let $P_bullet -> ZZ$ be a projective resolution of $ZZ$ by $G$-modules and $Q_bullet -> ZZ$ a projective resolution of $ZZ$ by $G\/H$-modules. Every term $Q_i$ inherits the structure of a $G$-module (although not necessarily projective), hence by #ref(<lemma:projective-resolution-lift>) there is a morphism of complexes $(P_bullet -> ZZ) -> (Q_bullet -> ZZ)$ obtained from the identity on $ZZ$. Therefore we get morphisms of abelian groups
$
  "Hom"_(G\/H) (Q_bullet, A^H) = "Hom"_(G) (Q_bullet, A^H) --> "Hom"_G (P_bullet, A^H),
$
they induce morphisms in cohomology
$
  H^i ("Hom"_(G\/H) (Q_bullet, A^H)) --> H^i ("Hom"_G (P_bullet, A^H)) = H^i (G,A^H) --> H^i (G,A).
$

#definition(title: "Inflation map")[
  The map above is called the #term[inflation map]:
  $
    "Inf" : H^i (G\/H,A^H) --> H^i (G,A).
  $
  In terms of $i$-cocycles it sends $phi : (G\/H)^i -> A^H$ to $phi compose pi_H : G^i -> (G\/H)^i -> A^H subset.eq A$.
]

#lemma[
  1. We have $M^G (A)^H tilde.eq M^(G\/H)(A)$ (in particular $H^i (G\/H,M^G (A)^H) = 0$ for $i > 0$).
  2. We have $H^i (H,M^G (A)) = 0$ for $i > 0$.
] <lemma:coinduced-trivial-cohomology-2>

#proof[
  1. By definition $M^G (A)^H = "Hom"(ZZ[G],A)^H$. Given a morphism $phi : G -> A$, it being $H$-invariant means $phi(sigma h) = h phi(sigma) = phi(sigma)$. Therefore it factors through $phi : G -> G\/H -> A$ and $
    "Hom"(ZZ[G],A)^H tilde.eq "Hom"(ZZ[G\/H],A).
  $
  2. We know $ZZ[G]$ is a free $ZZ[H]$-module, therefore $M^G (A) = product_(i in I) M^H (A)$. For every $i > 0$ we get $
    H^i (H, M^G (A)) tilde.eq H^i (H, product_(i in I) M^H (A)) tilde.eq product_(i in I) H^i (H, M^H (A)) = 0.
  $
]

#proposition(title: "Restriction-inflation sequence")[
  1. There is an exact sequence $
    0 --> H^1(G\/H,A^H) -->^"Inf" H^1(G,A) -->^"Res" H^1(H,A).
  $
  2. If moreover $H^1(H,A)=0$ there is an exact sequence $
    0 --> H^2(G\/H,A^H) -->^"Inf" H^2(G,A) -->^"Res" H^2(H,A).
  $
]

#proof[
  1. #exercise
  2. Let $C_A = M^G (A) \/ A$, there is an exact sequence
    $
      0 --> A --> M^G (A) --> C_A --> 0.
    $
    From the group cohomology long exact sequence we extract the short exact sequence
    $
      0 --> A^H --> M^G (A)^H --> C_A^H --> H^1(H,A) = 0.
    $
    We construct a commutative diagram in the following way: we take the long exact sequences in group cohomology extracted from the above short sequences for columns, the restriction and inflation maps for rows:
    #align(center, diagram({
	    node((-3, 0), [$0$])
	    node((-2, 0), [$H^1 (G\/H,C_A^H)$])
	    node((-1, 0), [$H^1(G,C_A)$])
	    node((0, 0), [$H^1(H,C_A)$])
	    node((-2, 1), [$H^2 (G\/H,A^H)$])
	    node((-1, 1), [$H^2(G,A)$])
	    node((0, 1), [$H^2(H,A)$])
	    node((-2, 2), [$H^2 (G\/H,M^G (A)^H)$])
	    node((-1, 2), [$H^2(G,M^G (A))$])
	    node((0, 2), [$H^2(H,M^G (A))$])
	    node((-2, -1), [$H^1 (G\/H,M^G (A)^H)$])
	    node((-1, -1), [$H^1(G,M^G (A))$])
	    node((0, -1), [$H^1(H,M^G (A))$])
	    edge((-3, 0), (-2, 0), "->")
	    edge((-2, 0), (-1, 0), [$"Inf"$], label-side: left, "->")
	    edge((-1, 0), (0, 0), [$"Res"$], label-side: left, "->")
	    edge((-2, -1), (-2, 0), "->")
	    edge((-2, 0), (-2, 1), "->")
	    edge((-2, 1), (-2, 2), "->")
	    edge((-1, -1), (-1, 0), "->")
	    edge((-1, 0), (-1, 1), "->")
	    edge((-1, 1), (-1, 2), "->")
	    edge((0, -1), (0, 0), "->")
	    edge((0, 0), (0, 1), "->")
	    edge((0, 1), (0, 2), "->")
	    edge((-2, 1), (-1, 1), [$"Inf"$], label-side: left, "->")
	    edge((-1, 1), (0, 1), [$"Res"$], label-side: left, "->")
    }))
    We shall prove the central vertical maps are isomorphisms, then by the previous point we get the desired result.
    This is a direct consequence of #ref(<cor:coinduced-trivial-cohomology>) and #ref(<lemma:coinduced-trivial-cohomology-2>).
]

#remark[
  In general, there is a spectral sequence $H^p (G\/H, H^q (H,A)) => H^(p+q)$ (G,A) called the #term[Hochschild-Serre spectral sequence].
]

Let $H <= G$ be a subgroup of finite index $n = [G:H]$ and fix $rho_1,dots,rho_n$ a system of coset representatives of $G mod H$. Identify $A tilde.eq "Hom"_G (ZZ[G],A)$ and consider the map
$
  M^G_H (A) = "Hom"_H (ZZ[G],A) & --> "Hom"_G (ZZ[G],A) tilde.eq A, \
  phi & mapsto.long  [phi^G_H : x mapsto sum_(j=1)^n rho_j phi(rho_j^(-1) x)].
$

It is well defined, i.e. it does not depend on the choice of $rho_1,dots,rho_n$. Let $rho_j tau_j$ be another set of respresentatives, we can assume $tau_j in H$. We have
$
  #text(fill: red)[computations]
$

#definition(title: "Co-restriction map")[
  The #term[co-restriction map] is the morphism
  $
    "Cor" : H^i (H,A) tilde.eq H^i (G,M^G_H (A)) --> H^i (G,A)
  $
  induced in cohomology by the map above.
]

#proposition[
  If $[G:H] = n$ then $"Cor" compose "Res" = n$.
] <prop:cor-res-composition>

#proof[
  Recall $A tilde.eq "Hom"_G (ZZ[G],A)$. The maps that induce restriction and co-restriction in cohomology compose as
  $
    "Hom"_G (ZZ[G],A) & --> & "Hom"_H (ZZ[G],A) & --> & "Hom"_G (ZZ[G],A), \
    phi & mapsto.long & phi & mapsto.long & phi^G_H.
  $
  Since $phi$ is a $G$-morphism we have
  $
    phi^G_H (x) = sum_(j=1)^n rho_j phi( rho_j^(-1) x) = sum_(j=1)^n rho_j rho_j^(-1) phi(x) = sum_(j=1)^n phi(x) = n phi(x),
  $
  therefore the map $phi |-> phi^G_H$ is multiplication-by-$n$.
]

#corollary[
  If $G$ is finite of order $n$, then $n dot H^i (G,A) = 0$ for every $i > 0$.
] <cor:cohomology-torsion>

#proof[
  We apply $"Res"$ and $"Cor"$ with subgroup $H={1} <= G$. We get
  $
    H^i (G,A) -->^"Res" H^i ({1},A) -->^"Cor" H^i (G,A),
  $
  from #ref(<prop:cor-res-composition>) this is the multiplication-by-$n$ map. On the other hand,
  $
    H^i ({1},A) tilde.eq^#ref(<lemma:shapiro>) H^i (G,M^G (A)) =^#ref(<cor:coinduced-trivial-cohomology>) 0 "for" i > 0.
  $
  Hence $dot n = 0$ as maps on $H^i (G,A)$.
]

#corollary[
  If $G$ has finite order $n$ and $A$ is a $QQ$-vector space, then $H^i (G,A) = 0$ for every $i > 0$.
]

#proof[
  The multiplication map $a |-> n a$ is an isomorphism $A ->^tilde A$. The induced map $H^i (G,A) ->^n H^i (G,A)$ is also an isomorphism, and #ref(<cor:cohomology-torsion>) yields $H^i (G,A) = 0$.
]

The proof can be adapted to any $K$-vector space where $K$ is $n$-divisible, that is multiplication by $n$ is bijective on $K$.