      *=====================================================================
      * Program: SETLLRD
      * Purpose: SETLL and READ file operations
      * Author: Aravind Vemula
      * Description: SETLL positions to key, READ reads forward
      *              through all records from that position
      *=====================================================================
     FCOMMONPF  IF   E           K DISK
      *
   
     D searchKey       S              2S 0 INZ(3)
      *

      * SETLL - Set Lower Limit to searchKey position
     C     searchKey     SETLL     COMMONPF
      * READ - Read first record from set position
     C                   READ      COMMONPF
      * DOW loop - Continue while NOT end of file
     C                   DOW       NOT %EOF()
      * Display employee name
     C     EMPNAME       DSPLY
      * READ - Read next record
     C                   READ      COMMONPF
     C                   ENDDO
     C                   EVAL      *INLR=*ON
