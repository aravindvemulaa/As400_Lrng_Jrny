      *=====================================================================
      * Program: SETLRP
      * Purpose: SETLL and READP operations
      * Author: Aravind Vemula
      * Description: SETLL positions to key, READP reads BACKWARD
      *              through records from that position
      *=====================================================================
     FCOMMONPF  IF   E           K DISK
      *
 
     D searchKey       S              2S 0 INZ(3)
      
      * SETLL - Set Lower Limit to searchKey position
     C     searchKey     SETLL     COMMONPF
      * READP - Read previous record from set position
     C                   READP     COMMONPF
      * DOW loop - Continue while NOT end of file
     C                   DOW       NOT %EOF()
      * Display employee name
     C     EMPNAME       DSPLY
      * READP - Read previous record
     C                   READP     COMMONPF
     C                   ENDDO
     C                   EVAL      *INLR=*ON
