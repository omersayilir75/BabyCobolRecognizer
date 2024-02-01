grammar DaddyCobol;

/*
Daddy cobol is different from baby cobol in the following ways:
All keywords are reserved in uppercase.
All procedure paragraphs should be prepended with an '@' sign.
Clauses in identification division should be of the form:
    '<name> : <value>' where name and value are string literals.
You cannot break up keywords and variables with spaces, it will lead to a parsing error.
Start of string literal must be on the same line as end quotation mark, reserved characters can be escaped with a backslash

Daddy has been around a lot longer than its cute little baby and therefor does not allow ambiguities.
From experience, ambiguity has caused daddy a lot of trouble with his wife. Although daddy enjoys his kid's imagination,
there is no room for ambiguities in the real world as that may lead to conflict.
*/

cobolProgram: identificationDivision dataDivision? procedureDivision? EOF;

identificationDivision:
    IDENTIFICATION DIVISION DOT
    //PROGRAM_ID DOT identificationValue DOT
    customIdentificationNameValue*
    ;

customIdentificationNameValue: STRING_LITERAL COLON STRING_LITERAL;

dataDivision: DATA DIVISION DOT (dataDefinition DOT)+;
dataDefinition:
    dataLevel identifier dataOccurs?                                        #recordDef
    | dataLevel identifier PICTURE IS pictureRepresentation dataOccurs?     #pictureDef
    | dataLevel identifier LIKE identifier dataOccurs?                      #likeDef
    ;

dataOccurs: OCCURS NUMERIC_LITERAL TIMES;
dataLevel: NUMERIC_LITERAL; // note: semantic checker should make sure it is a 2-wide int (00-99)
pictureRepresentation: STRING_LITERAL;

procedureDivision: PROCEDURE DIVISION using* DOT sentence* paragraph+;

using: USING usingEntry+;

usingEntry:
    BY REFERENCE identifier
    | BY CONTENT atomic
    | BY VALUE atomic
    ;

paragraph: AT_SIGN identifier DOT sentence+;

sentence: statement+ DOT;

statement:
    ACCEPT identifier+                                                          #acceptStat
    | ADD atomic+ TO atomic (GIVING identifier)?                                #addStat
    | ALTER procedureName TO PROCEED TO procedureName                           #alterStat
    | CALL identifier using?                                                    #callStat
    | COPY atomic (REPLACING (STRING_LITERAL BY STRING_LITERAL)+)?              #copyStat
    | DISPLAY displayExpression+ (WITH NO ADVANCING)?                           #displayStat
    // note: remainder only allowed if giving is present (pretty stupid)
    | DIVIDE atomic INTO atomic+ (GIVING identifier+ remainder?)?               #divideStat

    // https://slebok.github.io/baby/evaluate.html
    | EVALUATE expr evaluateAlso* (whenClause whenBody)+ END                    #evaluateStat

    | GO TO procedureName /*(OR procedureName)**/                               #goToStat
    | IF expr THEN statement+ (ELSE statement+)? END?                           #ifStat

    // https://slebok.github.io/baby/loop.html
    | LOOP loopStatement* END                                                   #loopStat
    | MOVE moveExpression TO identifier+                                        #moveStat
    | MULTIPLY atomic BY atomic+ (GIVING identifier)?                           #multiplyStat
    | NEXT SENTENCE                                                             #nextSentenceStat
    | PERFORM procedureName (THROUGH procedureName)? (atomic TIMES)?            #performStat
    | SIGNAL (OFF | procedureName) ON ERROR                                     #signalStat
    | STOP                                                                      #stopStat
    | SUBTRACT atomic+ FROM atomic+ (GIVING identifier)*                        #subtractStat
;

displayExpression: atomic (DELIMITED BY (SPACE | SIZE | literal))?;

remainder: REMAINDER identifier;

moveExpression: atomic | HIGH_VALUES | LOW_VALUES | SPACES;

// todo check if contracted expression actually works in the sense of operator precedence
// if not, we should just rewrite the contracted expression to a 'regular' one such that operator precedence
// works as expected again
expr: unaryOp expr                                  #unaryExpr  // -5, NOT x
    | <assoc=right> expr OP_POW expr                #powExpr    // x**2
    | expr multOp expr                              #multExpr   // a*3, x/y
    | expr addOp expr                               #addExpr    // a+3, x-y
    | expr compOp expr contractedExpr*              #compExpr   // a=b, c<d, e<=f, g>h, i>=10
    | expr logicOp expr                             #logicExpr  // a AND b, true OR false, true XOR b
    | '(' expr ')'                                  #parExpr
    | atomic                                        #atomicExpr // 123, var, "xyz"
;

evaluateAlso: ALSO expr;

// todo: whenClause should be able to support expressions, not just atomics??
whenClause:
    WHEN atomic (THROUGH atomic)? whenAlso*
    | WHEN OTHER
;

whenAlso: ALSO atomic (THROUGH atomic)?;

whenBody: statement+;

// level 3 feature, allows for: x = 5 OR 10, x < 20 OR > 10, x < 20 OR = 25...
contractedExpr: logicOp compOp? expr;

unaryOp: NOT | OP_SUB;
multOp: OP_MULT | OP_DIV;
addOp: OP_ADD | OP_SUB;
compOp: OP_EQ | OP_GT | OP_GTE | OP_LT | OP_LTE; // equality first for operator precedence
logicOp: AND | XOR | OR; // do not change the order of the terminals! Implicitly defines operator precedence

loopStatement:
    VARYING identifier? (FROM atomic)? (TO atomic)? (BY atomic)? #varyingLoopStatement
    | WHILE expr                                                 #whileLoopStatement
    | UNTIL expr                                                 #untilLoopStatement
    | statement                                                  #statementLoopStatement
;

atomic: literal | identifier;
literal: STRING_LITERAL | NUMERIC_LITERAL | float;
float: NUMERIC_LITERAL? DOT NUMERIC_LITERAL;
procedureName: identifier;//| SectionName | ParagraphName; // don't know what sectionName and paragraphName are

identifier: IDENTIFIER (OF IDENTIFIER)* index?;
index: '(' atomic (',' atomic)* ')';

ALSO: 'ALSO';
OF: 'OF';
CALL: 'CALL';
USING: 'USING';
REFERENCE: 'REFERENCE';
CONTENT: 'CONTENT';
VALUE: 'VALUE';
PICTURE: 'PICTURE';
IS: 'IS';
LIKE: 'LIKE';
OCCURS: 'OCCURS';
DATA: 'DATA';
PROGRAM_ID: 'PROGRAM-ID';
IDENTIFICATION: 'IDENTIFICATION';
PROCEDURE: 'PROCEDURE';
DIVISION: 'DIVISION';
ACCEPT: 'ACCEPT';
GIVING: 'GIVING';
ADD: 'ADD';
ALTER: 'ALTER';
TO: 'TO';
PROCEED: 'PROCEED';
COPY: 'COPY';
REPLACING: 'REPLACING';
BY: 'BY';
DISPLAY: 'DISPLAY';
WITH: 'WITH';
NO: 'NO';
ADVANCING: 'ADVANCING';
DIVIDE: 'DIVIDE';
INTO: 'INTO';
REMAINDER: 'REMAINDER';
EVALUATE: 'EVALUATE';
END: 'END';
GO: 'GO';
IF: 'IF';
THEN: 'THEN';
ELSE: 'ELSE';
LOOP: 'LOOP';
MOVE: 'MOVE';
MULTIPLY: 'MULTIPLY';
NEXT: 'NEXT';
SENTENCE: 'SENTENCE';
PERFORM: 'PERFORM';
THROUGH: 'THROUGH';
TIMES: 'TIMES';
SIGNAL: 'SIGNAL';
OFF: 'OFF';
ON: 'ON';
ERROR: 'ERROR';
STOP: 'STOP';
SUBTRACT: 'SUBTRACT';
FROM: 'FROM';
DELIMITED: 'DELIMITED';
SPACE: 'SPACE';
SPACES: 'SPACES';
SIZE: 'SIZE';
HIGH_VALUES: 'HIGH-VALUES';
LOW_VALUES: 'LOW-VALUES';
WHEN: 'WHEN';
OTHER: 'OTHER';
TRUE: 'TRUE';
FALSE: 'FALSE';
NOT: 'NOT';
VARYING: 'VARYING';
WHILE: 'WHILE';
UNTIL: 'UNTIL';
AND: 'AND';
OR: 'OR';
XOR: 'XOR';

OP_EQ: '=';
OP_GT: '>';
OP_GTE: '>=';
OP_LT: '<';
OP_LTE: '<=';

OP_ADD: '+';
OP_SUB: '-';
OP_MULT: '*';
OP_DIV: '/';
OP_POW: '**';

DOT: '.';
AT_SIGN: '@';
COLON: ':';

// defining string literals like this allows escaping characters
// does not allow literals to span multiple lines
// NOTE: on the implementation level we should take care of escaped symbols
// since babycobol only accepts escaped ", we only have to implement a special case for when we find '\"' -> '"'
STRING_LITERAL: UnterminatedStringLiteral '"';
UnterminatedStringLiteral: '"' (~["\\\r\n] | '\\' (. | EOF))*; // disallow "\"

NUMERIC_LITERAL: [0-9]+;
IDENTIFIER: [a-zA-Z0-9]+ ([-_]+ [a-zA-Z0-9]+)*;
WS: [ \t\r\n]+ -> skip;
ANY_CHAR_EXCEPT_DOT: ~[.]; // <- seems like madness
