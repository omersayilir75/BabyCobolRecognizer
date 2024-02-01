lexer grammar ProcedureDivisionVocab;

PROCEDURE_DIVISION : 'PROCEDURE DIVISION';

/**
 * Statement keywords
 */
ACCEPT : 'ACCEPT';
ADD : 'ADD';
ALSO : 'ALSO';
ALTER : 'ALTER';
DISPLAY : 'DISPLAY';
DIVIDE : 'DIVIDE';
EVALUATE : 'EVALUATE';
IF : 'IF';
MOVE : 'MOVE';
MULTIPLY: 'MULTIPLY';
PERFORM: 'PERFORM';
STOP: 'STOP';
SUBTRACT: 'SUBTRACT';

/*
 * Other keywords used in statements
 */

BY: 'BY';
BY_CONTENT : 'BY CONTENT';
BY_REFERENCE : 'BY REFERENCE';
BY_VALUE : 'BY VALUE';
DELIMITED_BY : 'DELIMITED BY';
ELSE:'ELSE';
END : 'END';
FALSE: 'FALSE';
FROM: 'FROM';
GIVING : 'GIVING';
GO_TO: 'GO TO';
HIGH_VALUES: 'HIGH-VALUES';
INTO : 'INTO';
LOW_VALUES: 'LOW-VALUES';
LOOP : 'LOOP';
NEXT_SENTENCE : 'NEXT SENTENCE';
NOT : 'NOT';
OF : 'OF';
ON_ERROR : 'ON ERROR';
OTHER: 'OTHER';
REMAINDER : 'REMAINDER';
SIGNAL : 'SIGNAL';
SIZE : 'SIZE';
SPACE : 'SPACE';
SPACES : 'SPACES';
THEN: 'THEN';
THROUGH: 'THROUGH';
TIMES : 'TIMES';
TO : 'TO';
TO_PROCEED_TO : 'TO PROCEED TO';
TRUE: 'TRUE';
UNTIL : 'UNTIL';
USING: 'USING';
VARYING : 'VARYING';
WHEN: 'WHEN';
WHILE : 'WHILE';
WITH_NO_ADVANCING : 'WITH NO ADVANCING';

PAREN_OPEN : '(';
PAREN_CLOSE : ')';

ARITHMETIC_OPERATOR : '-' | '*' | '/' | '**' | PLUS;
PLUS : '+';
COMPARISON_OPERATOR : '=' | '>' | '<' | '>=' | '<=';
BOOLEAN_OPERATOR : 'OR' | 'AND' | 'XOR';

/*
 * Symbols, fragments and misc.
 */
IDENTIFIER : (DIGIT | LETTER | '-')* LETTER ( DIGIT | LETTER | '-')*;

LITERAL_STRING: '"' (~'"')* '"';
LITERAL_NUMBER: SIGN? DIGITS ( (DOT|COMMA) DIGITS )*;

fragment DIGIT : [0-9] ;
DIGITS: DIGIT+;
fragment NEWLINE   : '\r' '\n' | '\n' | '\r';
fragment LETTER : LOWERCASE | UPPERCASE;
fragment LOWERCASE : [a-z];
fragment UPPERCASE : [A-Z];
fragment LEGAL_STRING_CHARS : ~['"];
fragment SIGN : '+' | '-';
DOT : '.';
COMMA : ',';
WS: (' '|'\n'|'\t'|'\r') -> skip;
TOKEN: ~[. \n\t\r];
