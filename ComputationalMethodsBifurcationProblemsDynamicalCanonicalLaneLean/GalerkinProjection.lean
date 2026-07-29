import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean

structure GalerkinProjection (X : Type) [Add X] [Sub X] where
  fullSpace : X
  subspace : X
  projection : Projection X
  truncatedOperator : BifurcationOperator X

theorem galerkin_projection_bridge_closed (A : AdmissibleClass) :
    Decides A.lane.solver A.lane.projectedLanguage := by
  exact A.solverDecidesProjectedLanguage

end ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean
end HautevilleHouse