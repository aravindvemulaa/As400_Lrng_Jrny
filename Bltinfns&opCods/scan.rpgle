      *=====================================================================
      * Program: SCANFN
      * Purpose: Demonstrate %SCAN Built-in Function
      * Author: Aravind Vemula
      * Description: %SCAN finds position of character in string
      *=====================================================================
      *
      
     D searchString    S             10A   INZ('INTERVIEW')
     D charPosition    S              2S 0
      *
      * Scan for 'R' in searchString
     C                   EVAL      charPosition = %SCAN('R':searchString)
      * Display position found
     C     charPosition  DSPLY
     
     C                   EVAL      *INLR=*ON
