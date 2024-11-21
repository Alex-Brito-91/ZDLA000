CLASS zdla000_cl001 DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA lv_table TYPE string .

    METHODS constructor
      IMPORTING
        !iv_table TYPE string .
    METHODS create
      CHANGING
        !cs_data TYPE any .
    METHODS read
      EXPORTING
        !et_data TYPE ANY TABLE .
    METHODS update
      CHANGING
        !cs_data TYPE any .
    METHODS delete
      IMPORTING
        !is_data TYPE any .
    METHODS validate
      IMPORTING
        !is_data TYPE any .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDLA000_CL001 IMPLEMENTATION.


  METHOD constructor.

    me->lv_table = iv_table.

  ENDMETHOD.


  METHOD create.

    ASSIGN COMPONENT `ID` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_id>).
    IF <fs_id> IS ASSIGNED.
      <fs_id> = cl_system_uuid=>create_uuid_x16_static( ).
    ENDIF.

    ASSIGN COMPONENT `DATA_MATRIC` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_data_matric>).
    IF <fs_data_matric> IS ASSIGNED AND <fs_data_matric> IS INITIAL.
      <fs_data_matric> = sy-datum.
    ENDIF.

    ASSIGN COMPONENT `CRIADO_EM` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_criado_em>).
    GET TIME STAMP FIELD DATA(lv_timestampl).
    IF <fs_criado_em> IS ASSIGNED.
      <fs_criado_em> = lv_timestampl.
    ENDIF.

    ASSIGN COMPONENT `CRIADO_POR` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_criado_por>).
    IF <fs_criado_por> IS ASSIGNED.
      <fs_criado_por> = sy-uname.
    ENDIF.

    MODIFY (lv_table) FROM cs_data.

  ENDMETHOD.


  METHOD delete.
  ENDMETHOD.


  METHOD read.
  ENDMETHOD.


  METHOD update.
  ENDMETHOD.


  METHOD validate.
  ENDMETHOD.
ENDCLASS.
