       IDENTIFICATION DIVISION.
       PROGRAM-ID. BAB1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       *> Include the communication area copybook (BAM1)
       COPY BAM1.
       77 WS-RESP                          PIC S9(8) COMP.
       01 BAM1-PGM                         PIC X(8) VALUE 'BAM1'.

       PROCEDURE DIVISION.

       MAIN-PROCESS.

           PERFORM INITIALIZE-COMM-AREA
           PERFORM CALL-BAM1
           PERFORM HANDLE-RETURN-CODE
           GOBACK.

       INITIALIZE-COMM-AREA.

           MOVE SPACES TO BAM1-COMM-AREA.
           MOVE 'BAM1' TO EYE-CATCHER. *> Name of the calling module
           MOVE 'BATCHUSR' TO USER-ID.     *> User ID of the caller
           MOVE '1234567890' TO TRANSACTION-ID. *> Example trans ID
           MOVE SPACES TO ERROR-MESSAGE.
           MOVE 0 TO RETURN-CODE.
           MOVE SPACES TO TRANSACTION-STATUS.

       CALL-BAM1.

           DISPLAY "Calling module BAM1..."
           CALL BAM1-PGM USING BAM1-COMM-AREA
              ON EXCEPTION
                  DISPLAY "Error: Unable to call BAM1."
                  MOVE -1 TO RETURN-CODE
              END-CALL.

       HANDLE-RETURN-CODE.

           IF RETURN-CODE = 0
               DISPLAY "BAM1 completed successfully."
               DISPLAY "Transaction Status: " TRANSACTION-STATUS
           ELSE
               DISPLAY "BAM1 encountered an error."
               DISPLAY "Error Message: " ERROR-MESSAGE
               DISPLAY "Return Code: " RETURN-CODE.