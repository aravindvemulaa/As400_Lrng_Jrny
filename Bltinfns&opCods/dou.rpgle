      *=====================================================================
      * Program: DOULOOP
      * Purpose: Demonstrate DOU Loop Operation
      * Author: Aravind Vemula
      * Description: DOU executes until condition becomes true
      *=====================================================================
      *
     D loopStartNum    S              2S 0 INZ(10)
     D loopEndNum      S              2S 0 INZ(50)
      *
     C     loopStartNum  DSPLY
     
      * DOU loop - Increment loopStartNum until equals loopEndNum
     C                   DOU       loopStartNum = loopEndNum
     C                   EVAL      loopStartNum = loopStartNum + 10
     C     loopStartNum  DSPLY
     C                   ENDDO
     C                   EVAL      *INLR=*ON
