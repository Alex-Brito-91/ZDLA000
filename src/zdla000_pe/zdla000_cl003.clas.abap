CLASS zdla000_cl003 DEFINITION
  PUBLIC
  INHERITING FROM zdla000_cl001
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS update REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdla000_cl003 IMPLEMENTATION.

  METHOD update.

    ASSIGN COMPONENT `ID` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_id>).

    SELECT SINGLE *
      FROM zdla000_tbatv
      INTO @DATA(ls_atv)
      WHERE id EQ @<fs_modificado_id>.

    DO.
      ASSIGN COMPONENT sy-index OF STRUCTURE ls_atv TO FIELD-SYMBOL(<fs_atv>).
      ASSIGN COMPONENT sy-index OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_data>).

      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

      IF <fs_data> IS INITIAL.
        <fs_data> = <fs_atv>.
      ENDIF.
    ENDDO.

    ASSIGN COMPONENT `MODIFICADO_EM` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_em>).
    GET TIME STAMP FIELD DATA(lv_timestampl).
    <fs_modificado_em> = lv_timestampl.

    ASSIGN COMPONENT `MODIFICADO_POR` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_por>).
    <fs_modificado_por> = sy-uname.

    MODIFY (lv_table) FROM cs_data.

    INCLUDE zi_update_media.

    CLEAR ls_atv.
  ENDMETHOD.

ENDCLASS.
