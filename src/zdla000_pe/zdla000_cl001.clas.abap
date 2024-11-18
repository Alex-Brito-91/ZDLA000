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
      !CS_DATA type ANY .
  methods READ
    exporting
      !ET_DATA type ANY TABLE .
  methods UPDATE
    changing
      !CS_DATA type ANY .
  methods DELETE
    importing
      !IS_DATA type ANY .
  methods VALIDATE
    importing
      !IS_DATA type ANY .
protected section.
private section.
ENDCLASS.



CLASS ZDLA000_CL001 IMPLEMENTATION.


  method CONSTRUCTOR.
  endmethod.


  method CREATE.
  endmethod.


  method DELETE.
  endmethod.


  method READ.
  endmethod.


  method UPDATE.
  endmethod.


  method VALIDATE.
  endmethod.
ENDCLASS.
