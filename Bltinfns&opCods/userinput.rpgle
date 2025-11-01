      *=====================================================================
      * Program: USERINP
      * Purpose: Demonstrate User Input and Addition
      * Author: Aravind Vemula
      * Description: Accept user input, convert to int, perform addition
      *=====================================================================
      /free
      dcl-s firstNumber int(5);
      dcl-s secondNumber int(5);
      dcl-s calculationResult int(5);
      dcl-s userInputBuffer char(10);


       dsply 'Enter first number:' '' userInputBuffer;
       firstNumber = %int(userInputBuffer);
 
       clear userInputBuffer;
      
       dsply 'Enter second number:' '' userInputBuffer;
       secondNumber = %int(userInputBuffer);

      * Calculate sum
       calculationResult = firstNumber + secondNumber;
      
       dsply ('The sum is: ' + %char(calculationResult));
       *inlr = *on;
      /end-free





