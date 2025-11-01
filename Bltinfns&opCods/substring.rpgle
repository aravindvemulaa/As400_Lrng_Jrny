      *=====================================================================
      * Program: SUBEXT
      * Purpose: Extract substring using %SUBST
      * Author: Aravind Vemula
      * Description: Demonstrates %SUBST to extract portion of string
      *              starting at position and taking specified length
      *=====================================================================

     D sourceText      S             14A   INZ('ARAVIND VEMULA')
     D unusedText      S              5A   INZ('NICKY')

      * Extract 7 characters starting from position 1
       sourceText = %subst(sourceText: 1: 7);

       dsply sourceText;
       *INLR=*ON;
