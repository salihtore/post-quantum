#!/usr/bin/env bash
# Creates the folder structure for the post-quantum crypto study repo.
# Run it from the root of your cloned repo:  bash setup_structure.sh
# Existing files are never overwritten.

set -euo pipefail

modules=(
  module0_math
  module1_classical
  module2_quantum
  module3_hash_signatures
  module4_lattice_lwe
  module5_nist_standards
  module6_implementation_security
  module7_blockchain
  notes
)

# Write a file only if it does not exist yet
write_if_missing() {
  local path="$1"
  if [[ -e "$path" ]]; then
    echo "  skip   $path (already exists)"
    cat > /dev/null
  else
    cat > "$path"
    echo "  create $path"
  fi
}

echo "Creating folders..."
for dir in "${modules[@]}"; do
  mkdir -p "$dir"
  # Git does not track empty folders, so add a placeholder
  if [[ "$dir" != "module0_math" && -z "$(ls -A "$dir")" ]]; then
    touch "$dir/.gitkeep"
  fi
  echo "  ok     $dir/"
done

echo "Creating module0 starter files..."

write_if_missing module0_math/modular.py <<'EOF'
"""Module 0: modular arithmetic helpers. Implement these yourself."""


def egcd(a: int, b: int) -> tuple[int, int, int]:
    """Extended Euclid: return (g, x, y) such that a*x + b*y = g = gcd(a, b)."""
    raise NotImplementedError


def modinv(a: int, m: int) -> int:
    """Return the inverse of a modulo m. Raise ValueError if it does not exist."""
    raise NotImplementedError


def modpow(base: int, exp: int, m: int) -> int:
    """Return base**exp mod m using square-and-multiply (don't use pow())."""
    raise NotImplementedError
EOF

write_if_missing module0_math/poly.py <<'EOF'
"""Module 0: polynomial arithmetic in Z_q[x] / (x^n + 1).

Polynomials are coefficient lists, lowest degree first:
    3x^3 + 2x + 5  ->  [5, 2, 0, 3]
"""


def poly_add(a: list[int], b: list[int], q: int) -> list[int]:
    """Add two polynomials, coefficients mod q."""
    raise NotImplementedError


def poly_mul(a: list[int], b: list[int], n: int, q: int) -> list[int]:
    """Multiply two polynomials in Z_q[x] / (x^n + 1).

    Rules:
      1. multiply coefficients, add exponents
      2. x^n = -1  (wrap around with a sign flip)
      3. keep every coefficient in 0..q-1
    """
    raise NotImplementedError
EOF

write_if_missing module0_math/test_module0.py <<'EOF'
"""Tests built from the exercises solved by hand in session 1."""

from modular import modinv
from poly import poly_add, poly_mul


def test_modinv_4_mod_11():
    assert modinv(4, 11) == 3


def test_poly_add_limit_10():
    # (6x^2 + 3x) + (5x^2 + 4x)  ->  x^2 + 7x   (q = 10)
    assert poly_add([0, 3, 6], [0, 4, 5], q=10) == [0, 7, 1]


def test_poly_mul_wraparound():
    # (x^3 + x) * x^2  ->  x^3 + 16x   (n = 4, q = 17)
    assert poly_mul([0, 1, 0, 1], [0, 0, 1, 0], n=4, q=17) == [0, 16, 0, 1]
EOF

write_if_missing requirements.txt <<'EOF'
numpy
pytest
EOF

echo
echo "Done. Next steps:"
echo "  1. Implement the functions in module0_math/"
echo "  2. Run: pytest"
echo "  3. git add . && git commit -m \"Module 0 scaffold\" && git push"