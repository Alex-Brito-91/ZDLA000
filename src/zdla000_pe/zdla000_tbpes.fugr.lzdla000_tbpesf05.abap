FORM modify_register.

  CHECK zdla000_tbpes-criado_por IS NOT INITIAL.

  GET TIME STAMP FIELD DATA(lv_timestampl).
  zdla000_tbpes-modificado_em  = lv_timestampl.
  zdla000_tbpes-modificado_por = sy-uname.

ENDFORM.
