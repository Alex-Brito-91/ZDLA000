*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 15.10.2024 at 12:06:25
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZDLA000_TBPES...................................*
DATA:  BEGIN OF STATUS_ZDLA000_TBPES                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZDLA000_TBPES                 .
CONTROLS: TCTRL_ZDLA000_TBPES
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *ZDLA000_TBPES                 .
TABLES: ZDLA000_TBPES                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
