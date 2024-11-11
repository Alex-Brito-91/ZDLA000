FORM modify_register.

  CHECK zdla000_tbatv-criado_em IS NOT INITIAL.

  GET TIME STAMP FIELD DATA(lv_timestampl).

  zdla000_tbatv-modificado_em  = lv_timestampl.
  zdla000_tbatv-modificado_por = sy-uname.

  DATA: lv_soma     TYPE zdla000_elnota,
        lv_contador TYPE zdla000_elnota.

  IF zdla000_tbatv-nota1 IS NOT INITIAL.
    lv_soma     += zdla000_tbatv-nota1.
    lv_contador += 1.
  ENDIF.

  IF zdla000_tbatv-nota2 IS NOT INITIAL.
    lv_soma     += zdla000_tbatv-nota2.
    lv_contador += 1.
  ENDIF.

  IF zdla000_tbatv-nota3 IS NOT INITIAL.
    lv_soma     += zdla000_tbatv-nota3.
    lv_contador += 1.
  ENDIF.

  IF zdla000_tbatv-nota4 IS NOT INITIAL.
    lv_soma     += zdla000_tbatv-nota4.
    lv_contador += 1.
  ENDIF.

  IF lv_contador > 0.
    zdla000_tbatv-media = lv_soma / lv_contador.
  ELSE.
    CLEAR zdla000_tbatv-media.
  ENDIF.

ENDFORM.
