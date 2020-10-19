*&---------------------------------------------------------------------*
*& Report ZVG_18A_31_UB4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zvg_18a_31_ub4.


DATA: position   TYPE zvg_18a_31_s_pos,
      positionen TYPE zvg_18a_31_t_pos.



FIELD-SYMBOLS <position> TYPE zvg_18a_31_s_pos.



position-bezeichnung       = 'Banane'.
position-anzahl            = 50.
position-preis_pro_einheit = '0.50'.

APPEND position TO positionen.
CLEAR position.

position-bezeichnung       = 'Apfel'.
position-anzahl            = 1904.
position-preis_pro_einheit = '0.70'.

APPEND position TO positionen.
CLEAR position.

position-bezeichnung       = 'Papaya'.
position-anzahl            = 13.
position-preis_pro_einheit = '6.50'.

APPEND position TO positionen.
CLEAR position.



"Calculate 'preis_gesamt' from 'preis_pro_einheit' and 'anzahl'
LOOP AT positionen ASSIGNING <position>.
  <position>-preis_gesamt = <position>-preis_pro_einheit * <position>-anzahl.
ENDLOOP.



*"Print contents to report
*LOOP AT positionen INTO position.
*  WRITE: / position-bezeichnung,
*           position-anzahl,
*           position-preis_pro_einheit,
*           position-preis_gesamt.
*ENDLOOP.

SORT positionen BY bezeichnung ASCENDING.

"Print contents to ALV Function
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_structure_name = 'ZVG_18A_31_S_POS'
*   I_BACKGROUND_ID  = '
    i_grid_title     = 'Artikelliste'
*   I_GRID_SETTINGS  =
*   IS_LAYOUT        =
*   IT_FIELDCAT      =
*   IT_EXCLUDING     =
*   IT_SPECIAL_GROUPS                 =
*   it_sort          =
*   IT_FILTER        =
*   IS_SEL_HIDE      =
*   I_DEFAULT        = 'X'
*   I_SAVE           = ' '
*   IS_VARIANT       =
*   IT_EVENTS        =
*   IT_EVENT_EXIT    =
*   IS_PRINT         =
*   IS_REPREP_ID     =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS  =
*   IT_HYPERLINK     =
*   IT_ADD_FIELDCAT  =
*   IT_EXCEPT_QINFO  =
*   IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab         = positionen
  EXCEPTIONS
    program_error    = 1
    OTHERS           = 2.


IF sy-subrc <> 0.
  WRITE: 'Fehler bei Ausgabe!'.
ENDIF.
