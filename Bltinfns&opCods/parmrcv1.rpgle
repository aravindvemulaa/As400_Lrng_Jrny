      *=====================================================================
      * Program: PARMRCV1
      * Purpose: Receive parameters from calling program
      * Author: Aravind Vemula
      * Description: Receives two parameters from prm1.rpgle program
      *              and displays them on screen
      *=====================================================================
      /free
      
      dcl-pi *n;
          receivedName char(20);
          receivedRole char(10);
      end-pi;
       dsply receivedName;
       dsply receivedRole;

       *inlr = *on;
      /end-free


