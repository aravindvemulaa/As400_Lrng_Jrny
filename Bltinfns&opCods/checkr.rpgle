      *=====================================================================
      * Program: CHECKR
      * Purpose: %CHECK finding character position
      * Description: Uses %CHECK to find first character NOT in set
      *              demonstrating validation of strings
      *=====================================================================
      *

     D testString      S             10A   INZ('RNTERVIEW')
     D charPosition    S              2S 0
      *
      * Check if 'R' exists in testString
     C                   EVAL      charPosition = %CHECK('R': testString)
     C     charPosition  DSPLY
     C                   EVAL      *INLR=*ON
