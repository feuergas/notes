#import "../prelude.typ": *

#definition(title: "Brauer group")[
  Let $k$ be a field and $k_s$ be one of its separable closures. The #term[Brauer group] of $k$ is
  $
    "Br"(k) := H^2(k,k_s)
  $
  If $K|k$ is a separable subextension of $k_s|k$ we can define the #term[relative Brauer group] of the extension as
  $
    "Br"(K|k) := ker("Br"(k) -->^"Res" "Br"(K))
  $
]

The elements of $"Br"(k)$ correspond to the finite dimensional division algebras $D$ with center $k$. In this correspondence, the subgroup $"Br"(K|k)$ gives those $D$ for which $D times.o_k K tilde.eq M_(n times n)(K)$, where $n^2 = dim_k D$.

#lemma[
  1. Banana
  2. banen
  3. #lorem(20)
]