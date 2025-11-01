      *=====================================================================
      * Program: DOLOOP
      * Purpose: Demonstrate FOR Loop iteration
      * Author: Aravind Vemula
      * Description: FOR loop iterates from 1 to 10 and displays values
      *=====================================================================
      *
     D loopCounter     S              2S 0 INZ(1)
      *
      /FREE
          for loopCounter = 1 to 10;
              dsply loopCounter;
          endfor;
          *inlr = *on;
      /END-FREE
      *
      * Original Fixed Format Code (Commented)
      * C                  DO        10
      * C                  EVAL      loopCounter=loopCounter+1
      * C    loopCounter   DSPLY
      * C                  ENDDO
      * C                  EVAL      *INLR=*ON



