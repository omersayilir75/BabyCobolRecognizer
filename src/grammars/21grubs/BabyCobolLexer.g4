lexer grammar BabyCobolLexer;

// Operators
ComparisonOp : '=' | '>' | '<' | '>=' | '<=' ;
BooleanOp : OR | AND | XOR ;
StringConcatOp  : '++' ;
ArithmeticOp : '+' | '-' | '*' | '/' | '**' ;
DOT : '.' ;

// Keywords
ACCEPT: 'ACCEPT' ;
ADD : 'ADD' ;
ADVANCING : 'ADVANCING' ;
AND : 'AND' ;
BY : 'BY' ;
DATA : 'DATA';
DELIMITED : 'DELIMITED' ;
DISPLAY : 'DISPLAY' ;
DIVIDE : 'DIVIDE' ;
DIVISION : 'DIVISION' ;
ELSE : 'ELSE' ;
END : 'END' ;
ERROR : 'ERROR' ;
EVALUATE: 'EVALUATE' ;
FALSE : 'FALSE' ;
FROM : 'FROM' ;
GIVING : 'GIVING' ;
GOTO: 'GO TO';
HIGHVALUES : 'HIGH-VALUES';
IDENTIFICATION : 'IDENTIFICATION';
IF : 'IF' ;
INTO : 'INTO' ;
IS : 'IS' ;
LIKE : 'LIKE';
LOOP : 'LOOP' ;
LOWVALUES : 'LOW-VALUES' ;
MOVE : 'MOVE';
MULTIPLY : 'MULTIPLY' ;
NEXT: 'NEXT' ;
NO : 'NO' ;
NOT : 'NOT' ;
OCCURS : 'OCCURS';
OF : 'OF';
OFF : 'OFF' ;
ON : 'ON' ;
OR : 'OR' ;
OTHER: 'OTHER' ;
PERFORM: 'PERFORM' ;
PICTURE : 'PICTURE' ;
PROCEDURE: 'PROCEDURE';
REMAINDER : 'REMAINDER' ;
SENTENCE: 'SENTENCE' ;
SIGNAL : 'SIGNAL' ;
SIZE : 'SIZE' ;
SPACE : 'SPACE' ;
SPACES : 'SPACES';
STOP: 'STOP' ;
SUBTRACT : 'SUBTRACT' ;
THEN : 'THEN' ;
THROUGH: 'THROUGH' ;
TIMES: 'TIMES' ;
TO : 'TO';
TRUE : 'TRUE' ;
UNTIL : 'UNTIL' ;
VARYING : 'VARYING' ;
WHEN: 'WHEN' ;
WHILE : 'WHILE' ;
WITH : 'WITH' ;
XOR : 'XOR' ;

// variable names
STRINGLITERAL : '"' (~ '"')+ '"' ;
INTEGER : SIGN? DIGIT+ ;
FLOAT : SIGN? DIGIT* SEPARATOR DIGIT+ ;
ID : (DIGIT|LETTER|ArithmeticOp)+ ; // arithmeticop breaks testsgen...
fragment DIGIT : '0'..'9' ;
fragment LETTER : 'a'..'z' | 'A'..'Z' ;
fragment SIGN : '-' | '+' ;
fragment SEPARATOR : '.' | ',' ;

WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
NODOT : ~'.';
