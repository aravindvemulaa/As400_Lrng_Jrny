      *=====================================================================
      * Program: READKEQ
      * Purpose: READE Read while key is equal
      * Author: Aravind Vemula
      * Description: SETLL positions file, READE reads only records
      *              with matching key value
      *=====================================================================
     FCOMMONPF  IF   E           K DISK
      *
      
     D searchKey       S              2S 0 INZ(3)
      *
     
      * SETLL - Set Lower Limit to searchKey position
     C     searchKey     SETLL     COMMONPF

      * Read first record with EQUAL key
     C                   READE     COMMONPF

      * Continue while NOT end of file
     C                   DOW       NOT %EOF(COMMONPF)

     C     EMPNAME       DSPLY
      * Read next record with EQUAL key
     C                   READE     COMMONPF
     
     C                   ENDDO
     C                   EVAL      *INLR=*ON
