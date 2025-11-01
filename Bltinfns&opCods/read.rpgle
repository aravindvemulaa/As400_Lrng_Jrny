      *=====================================================================
      * Program: READPF
      * Purpose: Demonstrate READ Loop through File
      * Author: Aravind Vemula
      * Description: READ sequentially through all records in file
      *              using DOW loop with %EOF condition
      *=====================================================================
     FCOMMONPF  IF   E           K DISK

     C                   READ      COMMONPF
      * DOW loop - Continue while NOT end of file
     C                   DOW       NOT %EOF(COMMONPF)
      * Display employee name
     C     EMPNAME       DSPLY
      * Read next record
     C                   READ      COMMONPF
     C                   ENDDO
     C                   EVAL      *INLR=*ON
