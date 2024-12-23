*&---------------------------------------------------------------------*
*& Include zi_update_media
*&---------------------------------------------------------------------*

SELECT SINGLE nota1, nota2, nota3, nota4
  FROM zdla000_tbatv
  INTO @DATA(ls_notas)
  WHERE id EQ @<fs_modificado_id>.

DATA: lv_contador TYPE i,
      lv_soma     TYPE p DECIMALS 1.

DO.
  ASSIGN COMPONENT |NOTA{ sy-index }| OF STRUCTURE ls_notas TO FIELD-SYMBOL(<fs_notas>).
  IF sy-subrc <> 0.
    EXIT.
  ENDIF.

  IF <fs_notas> IS NOT INITIAL.
    lv_soma     += <fs_notas>.
    lv_contador += 1.
  ENDIF.
ENDDO.

IF lv_contador > 0.
  ASSIGN COMPONENT `MEDIA` OF STRUCTURE cs_data TO FIELD-SYMBOL(<fs_media>).
  <fs_media> = lv_soma / lv_contador.
ENDIF.

MODIFY (lv_table) FROM cs_data.
CLEAR ls_notas.
