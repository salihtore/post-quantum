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
