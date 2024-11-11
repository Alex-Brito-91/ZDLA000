*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 01.11.2024 at 09:43:32
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA000_TBATV...................................*
DATA:  BEGIN OF STATUS_ZDLA000_TBATV                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA000_TBATV                 .
CONTROLS: TCTRL_ZDLA000_TBATV
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZDLA000_TBATV                 .
TABLES: ZDLA000_TBATV                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
