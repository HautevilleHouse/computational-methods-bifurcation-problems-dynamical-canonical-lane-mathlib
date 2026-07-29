import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def ConstrainedBifurcationClosure (A : BifurcationAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bifurcation_endgame (A : BifurcationAdmissibleClass) : ConstrainedBifurcationClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean
end HautevilleHouse