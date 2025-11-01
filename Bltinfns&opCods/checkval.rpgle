      *=====================================================================
      * Program: CHECKVAL
      * Purpose: %CHECK with validation logic
      * Description: Validates numeric string using %CHECK with
      *              conditional logic to report validity
      *=====================================================================
      *
   
     D validNumbers    S             10A   INZ('1234567890')
     D charPosition    S              2S 0
     D sampleValue     S              5S 2 INZ(-12.86)
      *
      * Check if all chars in validNumbers are valid
     C                   EVAL      charPosition = %CHECK('1234567890': 
     C                             validNumbers)

      * Validate: position 10 and length 10 means last char invalid
     C                   IF        charPosition = 10 AND 
     C                             %LEN(validNumbers) = 10
      
     C     'INVALID'     DSPLY
     C                   ELSE
     
     C     'VALID'       DSPLY
     C                   ENDIF

     C     sampleValue   DSPLY
     C                   EVAL      *INLR=*ON
