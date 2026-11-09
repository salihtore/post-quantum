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
