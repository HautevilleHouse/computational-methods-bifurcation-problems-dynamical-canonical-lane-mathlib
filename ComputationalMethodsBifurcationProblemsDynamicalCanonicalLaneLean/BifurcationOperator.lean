import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean

structure BifurcationOperator (X : Type) [Add X] [Sub X] where
  state : X
  delta : X
  projection : Projection X
  carriedComponent : X := delta - projection.toFun delta

structure BifurcationAdmittedObject where
  operator : BifurcationOperator ℝ
  projectedLanguage : Language
  solver : DecisionProcedure

end ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean
end HautevilleHouse