      *=====================================================================
      * Program: SETGTRD
      * Purpose: SETGT and READ file operations
      * Author: Aravind Vemula
      * Description: SETGT positions AFTER key, READ reads beyond that
      *              point through all remaining records
      *=====================================================================
     FCOMMONPF  IF   E           K DISK

     D searchKey       S              2S 0 INZ(3)
      *
      * SETGT - Set Greater Than searchKey position
     C     searchKey     SETGT     COMMONPF

      * Read first record AFTER set position
     C                   READ      COMMONPF

      * DOW loop - Continue while NOT end of file
     C                   DOW       NOT %EOF()
     
      * Display employee name
     C     EMPNAME       DSPLY
     C                   READ      COMMONPF
     C                   ENDDO
     C                   EVAL      *INLR=*ON
