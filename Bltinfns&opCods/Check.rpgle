      *=====================================================================
      * Program: CHECKFN
      * Purpose: Demonstrate %CHECK Built-in Function
      * Description: %CHECK validates if string contains only valid chars
      *=====================================================================
      *

     D validNumbers    S              9A   INZ('123456789')
     D charPosition    S              2S 0
      *
      * Check if validNumbers contains valid characters
     C                   EVAL      charPosition = %CHECK('123456789':
     C                             validNumbers)
     C                   IF        charPosition > 0
     C     'INVALID'     DSPLY
     C     charPosition  DSPLY
     C                   ELSE
     C     'VALID'       DSPLY
     C                   ENDIF
     C                   EVAL      *INLR=*ON
