      *=====================================================================
      * Program: DSCALC
      * Purpose: Data Structure with calculation
      * Author: Aravind Vemula
      * Description: Qualified data structure holds multiple numbers,
      *              calculates sum and displays results
      *=====================================================================
      **free

      dcl-ds math Qualified;
          firstNumber int(5);
          secondNumber int(5);
          sumResult int(5);
      end-ds;
      dcl-s resultValue Int(20);

         math.firstNumber  = 20;
   
         math.secondNumber = 30;
         math.sumResult    = math.firstNumber + 
                              math.secondNumber;
      
         resultValue = math.firstNumber + 
                        math.secondNumber;
         
       dsply math;
       dsply resultValue;
       *inlr=*on;
      /END-FREE












