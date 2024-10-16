FORM create_register.

  zdla000_tbpes-id          = cl_system_uuid=>create_uuid_x16_static( ).
  zdla000_tbpes-data_matric = sy-datum.

  GET TIME STAMP FIELD DATA(lv_timestampl).
  zdla000_tbpes-criado_em  = lv_timestampl.
  zdla000_tbpes-criado_por = sy-uname.

ENDFORM.
