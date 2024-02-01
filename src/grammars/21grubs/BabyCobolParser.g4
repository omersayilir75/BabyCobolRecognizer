parser grammar BabyCobolParser;
options {tokenVocab = BabyCobolLexer;}

program : identificationDivision dataDivision? procedureDivision? EOF;

identificationDivision : IDENTIFICATION DIVISION DOT identificationStatement+ ;
identificationStatement : key=name DOT value=name DOT ;

dataDivision : DATA DIVISION DOT dataStatement* ;
dataStatement : INTEGER ID ((PICTURE IS representation)|(LIKE variable))? (OCCURS INTEGER TIMES)? DOT;

procedureDivision : PROCEDURE DIVISION DOT sentence* paragraph+ ;
paragraph : ID DOT sentence+ ;
sentence : statement+ DOT ;

statement : acceptStatement
          | addStatement
          | displayStatement
          | divideStatement
          | evaluateStatement
          | ifStatement
          | loopStatement
          | moveStatement
          | multiplyStatement
          | nextSentenceStatement
          | performStatement
          | signalStatement
          | stopStatement
          | subtractStatement
          | gotoStatement
          ;

// Statements
acceptStatement: ACCEPT variable+ ;
addStatement : ADD atomic+ TO atomic (GIVING variable)? ;
displayStatement : DISPLAY displayExpression* (WITH NO ADVANCING)? ;
divideStatement : DIVIDE atomic INTO atomic+ (GIVING variable)? (REMAINDER variable)? ;
evaluateStatement: EVALUATE anyExpression whenBlock* END ;
ifStatement : IF booleanExpression THEN trueStatements+=statement+ (ELSE falseStatements+=statement+)? END? ;
loopStatement : LOOP loopExpression* END ;
moveStatement : MOVE moveExpression TO variable+ ;
multiplyStatement : MULTIPLY atomic BY atomic+ (GIVING variable)? ;
nextSentenceStatement: NEXT SENTENCE ;
performStatement: PERFORM procedureName(THROUGH procedureName)? (atomic TIMES)? ;
signalStatement: SIGNAL (OFF | procedureName) ON ERROR ;
stopStatement: STOP ;
subtractStatement : SUBTRACT atomic+ FROM atomic (GIVING variable)? ;
gotoStatement : GOTO procedureName ;

whenBlock : WHEN anyExpression+ statement+   #whenAnyBlock
          | WHEN OTHER statement+           #whenOtherBlock
          ;

// Expressions
displayExpression : atomic (DELIMITED BY (SPACE|SIZE))? ;

moveExpression : atomic
                | SPACES
                | HIGHVALUES
                | LOWVALUES
                ;

anyExpression : atomic
              | arithmeticExpression
              | stringExpression
              | booleanExpression
              ;

arithmeticExpression : atomic                                                             #atomicArithmeticExpression
                     | left=arithmeticExpression ArithmeticOp right=arithmeticExpression  #arithmeticOpArithmeticExpression
                     ;

booleanExpression : TRUE                                                                                     #trueBooleanExpression
                  | FALSE                                                                                    #falseBooleanExpression
                  | left=arithmeticExpression ComparisonOp right=arithmeticExpression                        #comparisonOpBooleanExpression
                  | NOT booleanExpression                                                                    #notBooleanExpression
                  | left=booleanExpression BooleanOp right=booleanExpression                                 #booleanOpBooleanExpression
                  | left=arithmeticExpression ComparisonOp right=arithmeticExpression contractedExpression+  #contractedBooleanExpression
                  ;

contractedExpression: BooleanOp ComparisonOp? arithmeticExpression ;

stringExpression : atomic                                                       #atomicStringExpression
                 | left=stringExpression StringConcatOp right=stringExpression  #stringConcatExpression
                 ;

loopExpression : VARYING variable? (FROM from=atomic)? (TO to=atomic)? (BY by=atomic)?    #varyingLoopExpression
               | WHILE booleanExpression                                                  #whileLoopExpression
               | UNTIL booleanExpression                                                  #untilLoopExpression
               | statement                                                                #statementLoopExpression
               ;

procedureName : ID ;

atomic  : variable            #variableAtomic
        | number              #numberAtomic
        | STRINGLITERAL       #stringAtomic
        ;
variable : ID (OF ID)*;
name : (NODOT|ID|INTEGER|FLOAT|ArithmeticOp)+ ;
representation : (ID|INTEGER);
number : INTEGER | FLOAT ;
