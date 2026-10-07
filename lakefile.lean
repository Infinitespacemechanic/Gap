import Lake
open Lake DSL

package Gap

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.22.0"

lean_lib Gap
