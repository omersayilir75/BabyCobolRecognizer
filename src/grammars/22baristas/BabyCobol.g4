parser grammar BabyCobol;

options { tokenVocab=Tokens; }

//Anissa
// C:\Users\User\Documents\AAAUni\Master\Computer Science\SoftwareEvolution\baristas\src
// C:\Users\User\Documents\AAAUni\Master\Computer Science\SoftwareEvolution\baristas\src\grammar

//Lola
//C:\Users\Lola\IdeaProjects\baristas\src
//C:\Users\Lola\IdeaProjects\baristas\src\grammar

program:    PARAGRAPH (DATA_DIVISION_ data+ DATA_DIVISION_END)?
            PROCEDURE_DIVISION_ using? paragraph+ EOF;

using : USING (BY REFERENCE identifier (BY CONTENT atomic)? (BY VALUE atomic)?)+
      ;

data: DATA_PARAGRAPH? LEVEL DATA_DIVISION_ID type? (OCCURS_CLAUSE N_TIMES)? TYPE_END
    ;

paragraph: (PARAGRAPH IDENTIFIER DOT)? sentence+
         ;

sentence: statement+ DOT
        ;

statement: ACCEPT identifier+                                                                                  #acceptST
         | ADD FIRST+=atomic+ TO SECOND+=atomic (GIVING identifier)*                                            #addST
         | ALTER identifier TO PROCEED TO identifier                                                           #alterST
         | CALL FILENAME using?                                                                                #callST
         | DISPLAY displayExpression+ (WITH NO ADVANCING)?                                                     #displayST
         | DIVIDE FIRST=atomic INTO SECOND+=atomic+ (GIVING THIRD+=identifier+)? (REMAINDER REM=identifier)?   #divideST
         | EVALUATE anyExpression (ALSO anyExpression)* (whenBlock EXECUTE+=statement*)+ END                   #evaluateST
         | GO TO paragraphname                                                                                 #gotoST
         | IF booleanExpression THEN TS+=statement+ (ELSE ES+=statement+ DOT?)? END?                           #ifST
         | LOOP loopStatement* END                                                                             #loopST
         | MOVE moveExpression TO identifier+                                                                  #moveST
         | MULTIPLY FIRST=atomic BY SECOND+=atomic+ (GIVING identifier)?                                       #multiplyST
         | NEXT SENTENCE                                                                                       #nextST
         | PERFORM paragraphname (THROUGH paragraphname)? (atomic TIMES)?                                      #performST
         | SIGNAL (OFF | paragraphname) ON ERROR                                                               #signalST
         | STOP                                                                                                #stopST
         | SUBTRACT FIRST+=atomic+ FROM SECOND+=atomic+ (GIVING identifier)*                                   #subtractST
         ;

paragraphname: IDENTIFIER;

displayExpression: atomic (DELIMITED BY (SPACE | SIZE | (NUMERIC | LEVEL) | NONNUMERIC))?
                 ;
moveExpression:HIGHVALUES
              | LOWVALUES
              | SPACES
              |  atomic
              ;
whenBlock: WHEN (OTHER | whenStatement+ alsoWhen*)
            ;
alsoWhen: ALSO whenStatement+;

whenStatement: atomic (THROUGH atomic)?;

anyExpression: arithmeticExpression
             | stringExpression
             | booleanExpression
             ;
arithmeticExpression: atomic                                                    #singleArithmeticExpression
                    | arithmeticExpression arithmeticOp arithmeticExpression    #multArithmeticExpression
                    ;
stringExpression: atomic
                | stringExpression PLUS stringExpression
                ;
booleanExpression: TRUE                                                                                                 #trueExpr
                 | FALSE                                                                                                #falseExpr
                 | arithmeticExpression NOT? comparisonOp arithmeticExpression (booleanOp contractedBoolean)*            #arithmeticBoolean
                 | NOT (booleanExpression | contractedBoolean )                                                         #notBoolean
                 | booleanExpression booleanOp booleanExpression                                                        #booleanExpr
                 ;

contractedBoolean: arithmeticExpression                                                             #contractedArithmetic
                 | comparisonOp arithmeticExpression                                                #contractedComparison
                 ;

loopStatement: VARYING identifier? (FROM atomic)? (TO atomic)? (BY atomic)?                         #varyingLoop
               | WHILE booleanExpression                                                            #whileLoop
               | UNTIL booleanExpression                                                            #untilLoop
               |statement                                                                           #statementLoop
             ;

comparisonOp: EQ
            | GT
            | ST
            | GE
            | SE
            ;
booleanOp: OR
         | AND
         | XOR
         ;
arithmeticOp: PLUS
            | MINUS
            | MULT
            | DIV
            | EXP
            ;
atomic: (NUMERIC | LEVEL)
      | NONNUMERIC
      | identifier
      ;

identifier: IDENTIFIER array_id? tailId* ;
tailId: OF IDENTIFIER array_id?;

array_id: ARRAY_N
         | LBRACE identifier RBRACE;

type: PICTURE IS REPRESENTATION                       #picture
    | LIKE DATA_DIVISION_ID (Q_OF DATA_DIVISION_ID)*  #likeId
    ;





