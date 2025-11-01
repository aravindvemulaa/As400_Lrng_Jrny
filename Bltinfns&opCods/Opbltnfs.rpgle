     FCPYPF     UF   E           K DISK
      *=====================================================================
      * Program Name: Opbltnfs
      * Description: Comprehensive program demonstrating all Built-in 
      *              Functions and Operations from learning folder
      * Author: Aravind Vemula
      * Date: May 20, 2025
      *=====================================================================

     D*------- Data Structure Definitions ------
     D
     D* Qualified Data Structure for Employee Info
       dcl-ds empDS Qualified;
          custid zoned(4:0);
          custname char(10);
          cust_address char(10);
       end-ds;

     D* Data Structure for Customer
       dcl-Ds myfrsrExp;
          custid zoned(4:0);
          custname char(10);
          cust_address char(10);
       end-ds;

     D* Qualified Data Structure for Math Operations
       dcl-ds mathDS Qualified;
          num1 int(5);
          num2 int(5);
          result int(5);
       end-ds;

     D*------- Standalone Variables for String Operations ------
     D
     DvalidNumStr      S              9A   INZ('123456789')
     DcharPosition     S              2S 0
     DsearchString1    S             10A   INZ('INTERVIEW')
     DsearchString2    S             10A   INZ('RNTERVIEW')
     DoriginalString   S             14A   INZ('ARAVIND VEMULA')
     DprocessedString  S             50A   INZ(' ')
     DinputWord        S             10A   INZ('madaM')
     DreversedWord     S             50A   INZ(' ')
     DstringLength     S              2S 0
     DloopIndex        S              2S 0
     DtempVariable     S              2S 0

     D*------- Standalone Variables for Numeric Operations ------
     D
     DloopCounter      S              5S 0 INZ(1)
     DloopStartNum     S              2S 0 INZ(10)
     DloopEndNum       S              2S 0 INZ(50)
     DcurrentNumber    S              5S 0 INZ(0)
     DsampleDecimal    S              5S 2 INZ(-12.86)
     DuserInputValue   S             10A   INZ(' ')
     DconvertedNum1    S              5I 0
     DconvertedNum2    S              5I 0
     DcalculationResult S              5I 0

     D*------- Variables for File Operations ------
     D
     DsearchEmployeeId S              2S 0
     DcurrentEmpId     S             50S 0
     DpreviousEmpId    S             50S 0
     DduplicateMessage S             50A

     D*------- Prototype for Parameter Passing ------
     D
       dcl-pr parmrcv1 extpgm('PARMRCV1');
         p_frst char(20);
         p_second char(10);
       end-pr;

      /FREE
      *=====================================================================
      * SECTION 1: LOOP OPERATIONS (FOR, DO, DOU, DOW)
      *=====================================================================
       dsply '*** SECTION 1: LOOP OPERATIONS ***';

      * FOR Loop - Counter from 1 to 10
       dsply 'FOR Loop (1 to 10):';
       loopCounter = 0;
       for loopCounter = 1 to 10;
          if loopCounter >= 8;
             dsply loopCounter;
          endif;
       endfor;

      * DOU (Do Until) Loop - Continue until loopStartNum equals loopEndNum
       dsply 'DOU Loop (until loopStartNum=loopEndNum):';
       loopStartNum = 10;
       loopEndNum = 50;
       dou loopStartNum = loopEndNum;
          loopStartNum = loopStartNum + 10;
          dsply loopStartNum;
       enddo;

      * DOW (Do While) Loop - While currentNumber < 20
       dsply 'DOW Loop (while currentNumber<20):';
       currentNumber = 0;
       dow currentNumber < 20;
          currentNumber = currentNumber + 5;
          dsply currentNumber;
       enddo;

      *=====================================================================
      * SECTION 2: STRING BUILT-IN FUNCTIONS
      *=====================================================================
       dsply '*** SECTION 2: STRING BUILT-IN FUNCTIONS ***';

      * %CHECK - Check if character exists in string
      * Looking for '123456789' in validNumStr
       dsply 'TEST %CHECK Function:';
       validNumStr = '123456789';
       charPosition = %check('123456789': validNumStr);
       if charPosition > 0;
          dsply 'INVALID: Found at position: ' + %char(charPosition);
       else;
          dsply 'VALID: No invalid character found';
       endif;

      * %CHECK - Alternative test
       validNumStr = '1234567890';
       charPosition = %check('1234567890': validNumStr);
       if charPosition = 10 and %len(validNumStr) = 10;
          dsply 'INVALID: Last character not in set';
       else;
          dsply 'VALID: All characters match';
       endif;

      * %SCAN - Scan for character position
      * Looking for 'R' in 'INTERVIEW'
       dsply 'TEST %SCAN Function:';
       searchString1 = 'INTERVIEW';
       charPosition = %scan('R': searchString1);
       dsply 'Position of R in INTERVIEW: ' + %char(charPosition);

       searchString2 = 'RNTERVIEW';
       charPosition = %check('R': searchString2);
       dsply 'Check position in RNTERVIEW: ' + %char(charPosition);

      * %SUBST - Extract substring
      * Extract first 7 characters
       dsply 'TEST %SUBST Function:';
       originalString = 'ARAVIND VEMULA';
       originalString = %subst(originalString: 1: 7);
       dsply 'Substring (1,7): ' + originalString;

      * %SUBST - Build string character by character (Palindrome check)
       dsply 'Palindrome Check using %SUBST:';
       inputWord = 'madaM';
       stringLength = %len(%trim(inputWord));
       reversedWord = '';
       for loopIndex = 1 to stringLength;
          reversedWord = %trim(reversedWord) + %subst(inputWord: stringLength + 1 - loopIndex: 1);
       endfor;
       if inputWord = reversedWord;
          dsply 'Result: ' + inputWord + ' is a palindrome';
       else;
          dsply 'Result: ' + inputWord + ' is NOT a palindrome';
       endif;

      *=====================================================================
      * SECTION 3: NUMERIC AND CONVERSION BUILT-IN FUNCTIONS
      *=====================================================================
       dsply '*** SECTION 3: NUMERIC FUNCTIONS ***';

      * %INT - Integer conversion
      * %CHAR - Character conversion
       dsply 'Arithmetic with %INT and %CHAR:';
       convertedNum1 = 25;
       convertedNum2 = 35;
       calculationResult = convertedNum1 + convertedNum2;
       dsply 'Sum of ' + %char(convertedNum1) + ' + ' + 
              %char(convertedNum2) + ' = ' + %char(calculationResult);

      * Display numeric value with formatting
       dsply 'Numeric Display - sampleDecimal value: ' + %char(sampleDecimal);

      * %LEN - Length of string
       dsply 'Length of validNumStr: ' + %char(%len(validNumStr));

      * %RAND - Random number generation
       dsply 'Random Number: ' + %char(%int(%rand() * 1000));

      *=====================================================================
      * SECTION 4: DATA STRUCTURES
      *=====================================================================
       dsply '*** SECTION 4: DATA STRUCTURES ***';

      * Qualified Data Structure
       dsply 'Qualified Data Structure - empDS:';
       empds.custid = 1561;
       empds.custname = 'Aravind';
       empds.cust_address = 'HYD';
       dsply 'Customer ID: ' + %char(empds.custid);
       dsply 'Customer Name: ' + %trim(empds.custname);
       dsply 'Address: ' + %trim(empds.cust_address);

      * Math Operations Data Structure
       dsply 'Math Data Structure - mathDS:';
       mathds.num1 = 20;
       mathds.num2 = 30;
       mathds.result = mathds.num1 + mathds.num2;
       dsply 'Num1: ' + %char(mathds.num1);
       dsply 'Num2: ' + %char(mathds.num2);
       dsply 'Result (Sum): ' + %char(mathds.result);

      *=====================================================================
      * SECTION 5: FILE OPERATIONS (READ, CHAIN, SETLL, SETGT, READE, READP)
      *=====================================================================
       dsply '*** SECTION 5: FILE OPERATIONS ***';

      * CHAIN - Read specific record using key
       dsply 'CHAIN Operation:';
       searchEmployeeId = 3;
       chain searchEmployeeId cpypf;
       if %found();
          dsply 'Record found via CHAIN';
       else;
          dsply 'Record NOT found via CHAIN';
       endif;

      * SETLL + READ - Set position and read forward
       dsply 'SETLL + READ Operations:';
       searchEmployeeId = 2;
       setll searchEmployeeId cpypf;
       read cpypf;
       if not %eof(cpypf);
          dsply 'Read first record after SETLL';
       endif;

      * READP - Read previous record
       dsply 'READP Operation:';
       searchEmployeeId = 3;
       setll searchEmployeeId cpypf;
       readp cpypf;
       if not %eof(cpypf);
          dsply 'Read previous record';
       endif;

      * READE - Read while equal key
       dsply 'READE Operation:';
       searchEmployeeId = 2;
       setll searchEmployeeId cpypf;
       reade cpypf;
       if not %eof(cpypf);
          dsply 'Read with equal key';
       endif;

      * DOW with READ - Loop through file
       dsply 'DOW with READ - Loop all records:';
       setll *start cpypf;
       read cpypf;
       dow not %eof(cpypf);
          dsply 'Employee record: ' + %char(empid);
          read cpypf;
       enddo;

      *=====================================================================
      * SECTION 6: MOVE AND FIELD OPERATIONS
      *=====================================================================
       dsply '*** SECTION 6: MOVE AND FIELD OPERATIONS ***';

       originalString = 'ABC';
       processedString = 'ARAVIND';
       dsply 'Original originalString: ' + originalString;
       dsply 'Original processedString: ' + processedString;

      * MOVE - Right align
       move originalString processedString;
       dsply 'After MOVE originalString to processedString: ' + processedString;

      * RESET - Clear field
       reset processedString;
       dsply 'After RESET processedString: ' + processedString;

      * MOVEL - Left align
       movel originalString processedString;
       dsply 'After MOVEL originalString to processedString: ' + processedString;

      *=====================================================================
      * SECTION 7: REMOVE DUPLICATES FROM FILE
      *=====================================================================
       dsply '*** SECTION 7: REMOVE DUPLICATES ***';
       dsply 'Checking for duplicate EMPID in CPYPF...';
       currentEmpId = 0;
       previousEmpId = 0;
       setll *start cpypf;
       read cpypf;
       dow not %eof(cpypf);
          currentEmpId = empid;
          if currentEmpId = previousEmpId;
             duplicateMessage = 'Duplicate found: ' + %char(currentEmpId);
             dsply duplicateMessage;
             delete cpypf;
          else;
             previousEmpId = currentEmpId;
          endif;
          read cpypf;
       enddo;

      *=====================================================================
      * SECTION 8: USER INPUT HANDLING
      *=====================================================================
       dsply '*** SECTION 8: USER INPUT HANDLING ***';
       dsply 'Demonstrate User Input Processing';
       userInputValue = '42';
       convertedNum1 = %int(userInputValue);
       dsply 'Converted input to integer: ' + %char(convertedNum1);

      *=====================================================================
      * SECTION 9: PARAMETER PASSING PROTOTYPE
      *=====================================================================
       dsply '*** SECTION 9: PARAMETER PASSING ***';
       dsply 'Calling PARMRCV1 program (if available)...';
      * This demonstrates the prototype definition
      * Uncomment below if PARMRCV1 exists:
      * callp parmrcv1('Aravind Vemula': 'Developer');

      *=====================================================================
      * END OF PROGRAM
      *=====================================================================
       dsply '*** ALL SECTIONS COMPLETED ***';
       *inlr = *on;

      /END-FREE

      *-----End of Fixed Format Comments (if any needed)-----
