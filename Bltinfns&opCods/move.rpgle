      *=====================================================================
      * Program: MOVEOP
      * Purpose: Demonstrate MOVE and MOVEL Operations
      * Author: Aravind Vemula
      * Description: MOVE = right align, MOVEL = left align
      *=====================================================================
      *

     D sourceString    S              5A   INZ('ABC')
     D targetString    S              7A   INZ('ARAVIND')
      *

     C     sourceString  DSPLY
     C     targetString  DSPLY

     C                   MOVE      sourceString   targetString
      
     C     targetString  DSPLY

      *  Clear targetString
     C                   RESET                   targetString
     
     C     targetString  DSPLY

      * Left align sourceString to targetString
     C                   MOVEL     sourceString   targetString
     
      
     C     targetString  DSPLY
     C                   EVAL      *INLR=*ON
