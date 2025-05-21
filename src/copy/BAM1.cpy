      *> COBOL Copybook for Module Calls (BAM1)
      *> Contains basic fields for inter-module communication

       01 BAM1-COMM-AREA.

          05 KEY-FIELDS.

             10  EYE-CATCHER          PIC X(8).
             10  MOD-VERSION          PIC X(8).

          05 INPUT-FIELDS.

             10  TRANSACTION-ID       PIC X(10).
             10  TRANSACTION-STATUS   PIC X(1).
             10  USER-ID              PIC X(8).
             10  TRANSACTION-TS       PIC X(20).

          05 OUTPUT-FIELDS.

             10  RETURN-CD            PIC S9(4) COMP.
             10  ERROR-MESSAGE        PIC X(20).

          05 FILLER-FIELDS.

             10  RESERVED-FIELDS      PIC X(50).