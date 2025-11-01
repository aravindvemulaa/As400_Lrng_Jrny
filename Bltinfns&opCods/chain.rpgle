      *=====================================================================
      * Program: CHAINOP
      * Purpose: CHAIN Operation to find record
      * Description: Demonstrates CHAIN operation to read specific record
      *              using key value from Physical File
      *=====================================================================
     FCOMMONPF  IF   E           K DISK
      
      * searchKey: Employee ID to search in file
     D searchKey       S              2S 0 INZ(6)
     *
     * Main Processing
     C     searchKey     CHAIN     COMMONPF
     C                   IF        %FOUND()
     C     EMPNAME       DSPLY
     C                   ENDIF
     C                   EVAL      *INLR=*ON
