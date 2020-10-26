class ZVG_18A_31_CL_STACK definition
  public
  final
  create public .

public section.

  methods PUSH
    importing
      !ELEMENT type NUM2 .
  methods POP
    returning
      value(RETURN) type NUM2 .
  methods TOP
    returning
      value(RETURN) type NUM2 .
protected section.
private section.

  data ITEMS type ZVG_18A_31_T_STACKITEMS .
ENDCLASS.



CLASS ZVG_18A_31_CL_STACK IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZVG_18A_31_CL_STACK->POP
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURN                         TYPE        NUM2
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD pop.
    return = me->top( ).
    DESCRIBE TABLE me->items LINES DATA(length).
    DELETE me->items INDEX length.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZVG_18A_31_CL_STACK->PUSH
* +-------------------------------------------------------------------------------------------------+
* | [--->] ELEMENT                        TYPE        NUM2
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD push.
    APPEND element TO me->items.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZVG_18A_31_CL_STACK->TOP
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURN                         TYPE        NUM2
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD top.
    DESCRIBE TABLE me->items LINES DATA(length).
    READ TABLE me->items INTO return INDEX length .
  ENDMETHOD.
ENDCLASS.
