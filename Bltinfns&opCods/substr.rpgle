      *=====================================================================
      * Program: SUBSTR
      * Purpose: Demonstrate %SUBST for Palindrome Check
      * Author: Aravind Vemula
      * Description: Uses %SUBST to extract chars and check palindrome
      *=====================================================================
      /free
      dcl-s inputWord char(10);
      dcl-s stringLength packed(2:0);
      dcl-s reversedWord char(10);
      dcl-s loopIndex packed(2:0);

      *
       inputWord = 'madaM';
      
       stringLength = %len(%trim(inputWord));
      
       reversedWord = '';
      
       for loopIndex = 1 to stringLength;
        reversedWord = %trim(reversedWord) + 
                         %subst(inputWord: stringLength + 1 - loopIndex: 1);
       endfor;
     
       if inputWord = reversedWord;
           dsply 'The word is palindrome';
       else;
           dsply 'The word is not palindrome';
       endif;
       *inlr = *on;
      /END-FREE
