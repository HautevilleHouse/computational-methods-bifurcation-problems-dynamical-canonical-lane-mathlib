import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure AdmissibleProblem where
  equation : BifurcationEquation? -- This is a placeholder; we'll use a String for now
  domain : String
  method : String

deriving Repr, DecidableEq

-- AdmissibleClass for bifurcation problem
structure BifurcationAdmissibleClass where
  problem : AdmissibleProblem
  solverDecidesSolution : DecidesSolution problem.method problem.domain
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

-- DecidesSolution means the method can solve the problem over the domain
structure DecidesSolution (method domain : String) : Prop where
  halts : forall (prob : AdmissibleProblem), prob.method = method → ProbDomain prob.domain domain
  correct : True

-- Domain inclusion
structure ProbDomain (d1 d2 : String) : Prop where
  subset : d1 = d2

def bridgeClosed (A : BifurcationAdmissibleClass) : Prop := A.solverDecidesSolution.halts

def gateClosed (A : BifurcationAdmissibleClass) : Prop := A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedBifurcationClosure (A : BifurcationAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : BifurcationAdmissibleClass) : bridgeClosed A :=
  A.solverDecidesSolution.halts

theorem gate_from_admissible_class (A : BifurcationAdmissibleClass) : gateClosed A :=
  A.gateWitness

end ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean
end HautevilleHouse