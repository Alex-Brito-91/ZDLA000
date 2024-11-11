class ZDLA000_CL001 definition
  public
  abstract
  create public .

public section.

  data LV_TABLE type STRING .

  methods CONSTRUCTOR
    importing
      !IV_TABLE type STRING .
  methods CREATE
    changing
      value(CS_DATA) type ANY .
  methods READ
    exporting
      !ET_DATA type ANY TABLE .
  methods UPDATE
    changing
      value(CS_DATA) type ANY .
  methods DELETE
    importing
      !IS_DATA type ANY .
  methods VALIDATE
    importing
      !IS_DATA type ANY .
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
    IF <fs_data_matric> IS ASSIGNED.
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


  METHOD read.

    SELECT *
      FROM (lv_table)
      INTO TABLE et_data.

  ENDMETHOD.


  METHOD update.

    ASSIGN COMPONENT `MODIFICADO_EM` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_em>).
    GET TIME STAMP FIELD DATA(lv_timestampl).
    IF <fs_modificado_em> IS ASSIGNED.
      <fs_modificado_em> = lv_timestampl.
    ENDIF.

    ASSIGN COMPONENT `MODIFICADO_POR` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_por>).
    IF <fs_modificado_por> IS ASSIGNED.
      <fs_modificado_por> = sy-uname.
    ENDIF.

    ASSIGN COMPONENT `ID` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_id>).
    MODIFY (lv_table) FROM cs_data.

  ENDMETHOD.


  METHOD delete.

    ASSIGN COMPONENT `ID` OF STRUCTURE is_data TO FIELD-SYMBOL(<fs_id>).
    IF <fs_id> IS ASSIGNED.
      DELETE FROM (lv_table) WHERE id = <fs_id>.
    ENDIF.

  ENDMETHOD.


  METHOD validate.
  ENDMETHOD.
ENDCLASS.
