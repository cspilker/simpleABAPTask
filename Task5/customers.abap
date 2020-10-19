*&---------------------------------------------------------------------*
*& Report ZVG_18A_31_UB5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zvg_18a_31_ub5.

DATA: kunden TYPE zvg_18a_31_t_kunde,
      kunde  TYPE zvg_18a_31_kunde.

SELECT-OPTIONS: s_kunnr FOR kunde-kunnr.

SELECT * FROM zvg_18a_31_kunde INTO TABLE kunden
  WHERE kunnr IN s_kunnr.


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE  = ' '
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
    i_structure_name = 'ZVG_18A_31_KUNDE'
*   I_BACKGROUND_ID  = ' '
*   I_GRID_TITLE     =
*   I_GRID_SETTINGS  =
*   IS_LAYOUT        =
*   IT_FIELDCAT      =
*   IT_EXCLUDING     =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT          =
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
*   IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab         = kunden
  EXCEPTIONS
    program_error    = 1
    OTHERS           = 2.
IF sy-subrc <> 0.
  WRITE: 'Fehler bei Ausgabe'.
ENDIF.
