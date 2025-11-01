      *=====================================================================
      * Program: DOWLOOP
      * Purpose: Demonstrate DOW Loop Operation
      * Author: Aravind Vemula
      * Description: DOW loop executes while condition is TRUE
      *              Condition checked BEFORE each iteration
      *=====================================================================
      *
      
     D loopCounter     S              5S 0 INZ(0)
      *
     C                   DOW       loopCounter < 20

      * Increment counter by 5
     C                   EVAL      loopCounter = loopCounter + 5
      * Display current counter value
      
     C     loopCounter   DSPLY
     C                   ENDDO
     C                   EVAL      *INLR=*ON
