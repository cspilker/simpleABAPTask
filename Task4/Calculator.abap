*&---------------------------------------------------------------------*
*& Report ZVG_18A_31_UB3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zvg_18a_31_ub3.

PARAMETERS:
  zahl1 TYPE p,
  operator  TYPE c DEFAULT '+',
  zahl2 TYPE p.

DATA:
  ergebnis TYPE p.


CASE operator.
  WHEN '+'.
    ergebnis = zahl1 + zahl2.
    WRITE: 'Ergebnis:', ergebnis.
  WHEN '*'.
    ergebnis = zahl1 * zahl2.
    WRITE: 'Ergebnis:', ergebnis.
  WHEN '-'.
    ergebnis = zahl1 - zahl2.
    WRITE: 'Ergebnis:', ergebnis.
  WHEN '/'.
    ergebnis = zahl1 / zahl2.
    WRITE: 'Ergebnis:', ergebnis.
  WHEN OTHERS.
    WRITE 'Unbekannter Operator!'.
ENDCASE.
