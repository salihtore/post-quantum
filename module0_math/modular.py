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
