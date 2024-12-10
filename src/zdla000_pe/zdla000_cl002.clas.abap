CLASS zdla000_cl002 DEFINITION
  PUBLIC
  INHERITING FROM zdla000_cl001
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS update
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdla000_cl002 IMPLEMENTATION.


  METHOD update.

    ASSIGN COMPONENT `ID` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_id>).

    SELECT SINGLE *
      FROM zdla000_tbpes
      INTO @DATA(lt_pes)
      WHERE id EQ @<fs_modificado_id>.

    DO.

      ASSIGN COMPONENT sy-index OF STRUCTURE lt_pes TO FIELD-SYMBOL(<fs_lt_pes>).
      ASSIGN COMPONENT sy-index OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_cs_data>).

      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

      IF <fs_cs_data> IS INITIAL.
        <fs_cs_data> = <fs_lt_pes>.
      ENDIF.

    ENDDO.

    ASSIGN COMPONENT `MODIFICADO_EM` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_em>).
    GET TIME STAMP FIELD DATA(lv_timestampl).
    <fs_modificado_em> = lv_timestampl.

    ASSIGN COMPONENT `MODIFICADO_POR` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_modificado_por>).
    <fs_modificado_por> = sy-uname.

    MODIFY (lv_table) FROM cs_data.

  ENDMETHOD.
ENDCLASS.
