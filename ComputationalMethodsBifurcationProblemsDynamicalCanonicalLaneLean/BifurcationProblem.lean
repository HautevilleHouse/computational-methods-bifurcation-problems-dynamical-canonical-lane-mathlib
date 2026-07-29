import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean

inductive Parameter where
  | real (r : Float)
  | complex (re im : Float)
deriving Repr, DecidableEq

structure State where
  x : Float
  y : Float
  param : Parameter
deriving Repr, DecidableEq

define BifurcationEquation (s : State) : Float :=
  (s.x * s.x - s.y * s.param.toFloat) + s.y * s.y - 1.0

-- Compute the jacobian at a state
structure Jacobian where
  dfdx : Float
  dfdy : Float
deriving Repr, DecidableEq

noncomputable def jacobian (s : State) : Jacobian :=
  { dfdx := 2.0 * s.x,
    dfdy := -s.param.toFloat + 2.0 * s.y }

-- A solution is a state where BifurcationEquation ≈ 0 and Jacobian is invertible
structure Solution where
  state : State
  equation_norm : Float
  jacobian_det : Float
  is_nondegenerate : Bool
deriving Repr, DecidableEq

-- A bifurcation point
structure BifurcationPoint where
  param : Parameter
  state : State
  condition : String

deriving Repr, DecidableEq

end ComputationalMethodsBifurcationProblemsDynamicalCanonicalLaneLean
end HautevilleHouse