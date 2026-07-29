import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean

structure CenterManifoldReduction (X : Type) [Add X] [Sub X] where
  operator : BifurcationOperator X
  dimStable : ℕ
  dimUnstable : ℕ
  dimCenter : ℕ
  reducedDynamics : X → X

theorem center_manifold_reduction_admissible (A : AdmissibleClass) :
    bridgeClosed A ∧ gateClosed A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean
end HautevilleHouse