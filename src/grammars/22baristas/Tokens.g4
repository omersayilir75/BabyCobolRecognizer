lexer grammar Tokens;


PARAGRAPH: '~';

DATA_DIVISION_: D A T A [ \t]+ D I V I S I O N DOT -> pushMode(DATA_DIVISION);
PROCEDURE_DIVISION_: PROCEDURE_DIVISION DOT;

fragment KEYWORD: ACCEPT
| ADD
| ADVANCING
| ALSO
| ALTER
| AUTHOR
| BY
| CALL
| CONTENT
| COPY
//| DATA
| DATECOMPILED
| DATEWRITTEN
| DELIMITED
| DISPLAY
| DIVIDE
//| DIVISION
| ELSE
| END
| ERROR
| EVALUATE
| FALSE
| FROM
| GIVING
| GO
| IDENTIFICATION
| IF
| INSTALLATION
| INTO
| IS
| LIKE
| LOOP
| MOVE
| MULTIPLY
| NEXT
| NO
| NOT
//| OCCURS
//| OF
| OFF
| ON
| OTHER
| PERFORM
| PICTURE
| PROCEDURE_DIVISION
| PROCEED
| PROGRAMID
| REFERENCE
| REMAINDER
| REPLACING
| SECURITY
| SENTENCE
| SIGNAL
| SIZE
| SPACE
| SPACES
| STOP
| SUBTRACT
| THEN
| THROUGH
| TIMES
| TO
| TRUE
| USING
| VALUE
| VARYING
| WHEN
| WITH
| AND
| OR
| XOR
| HIGHVALUES
| LOWVALUES
;

ARRAY_N: LBRACE INT RBRACE;
ACCEPT: A C C E P T;
ADD: A D D;
ADVANCING: A D V A N C I N G;
ALSO : A L S O;
ALTER: A L T E R;
AUTHOR: A U T H O R;
BY: B Y;
CALL: C A L L;
CONTENT: C O N T E N T;
COPY: C O P Y;
DATECOMPILED: D A T E DASH C O M P I L L E D;
DATEWRITTEN: D A T E DASH W R I T T E N;
DELIMITED: D E L I M I T E D;
DISPLAY: D I S P L A Y;
DIVIDE: D I V I D E;
DOT: '.';
ELSE: E L S E;
END: E N D;
ERROR: E R R O R;
EVALUATE: E V A L U A T E;
FALSE: F A L S E;
FROM: F R O M;
GIVING: G I V I N G;
GO: G O;
IDENTIFICATION: I D E N T I F I C A T I O N;
IF: I F;
INSTALLATION: I N S T A L L A T I O N;
INTO: I N T O;
LOOP: L O O P;
MOVE: M O V E;
MULTIPLY: M U L T I P L Y;
NEXT: N E X T;
NO: N O;
NOT: N O T;
OF: O F;
OFF: O F F;
ON: O N;
OTHER: O T H E R;
PERFORM:  P E R F O R M;
PROCEED: P R O C E E D;
PROCEDURE_DIVISION: P R O C E D U R E [ \t]+ D I V I S I O N;
PROGRAMID: P R O G R A M DASH I D;
REFERENCE: R E F E R E N C E;
REMAINDER: R E M A I N D E R;
REPLACING: R E P L A C I N G;
SECURITY: S E C U T R I T Y;
SENTENCE: S E N T E N C E;
SIGNAL: S I G N A L;
SIZE: S I Z E;
SPACE: S P A C E;
SPACES: S P A C E S;
STOP: S T O P;
SUBTRACT: S U B T R A C T;
THEN: T H E N;
THROUGH: T H R O U G H;
TIMES: T I M E S;
TO: T O;
TRUE: T R U E;
USING: U S I N G;
VALUE: V A L U E;
VARYING: V A R Y I N G;
WHEN: W H E N;
WHILE: W H I L E;
WITH: W I T H;
UNTIL: U N T I L;

AND: A N D;
OR: O R;
XOR: X O R;

PLUS: '+';
MINUS: ' - ';
DASH:'-';
MULT: '*';
DIV: '/';
EXP: '**';

EQ: '=';
GT: '>';
ST: '<';
GE: '>=';
SE: '<=';


NUMERIC: SIGN? INT (SEPARATOR INT)?;
NONNUMERIC: '\'' (SPECIAL | LETTER | DIGIT | QUOTE | (APOST APOST) | ' ')+ '\''
          | '"' (SPECIAL | LETTER | DIGIT | APOST | (QUOTE QUOTE) | ' ')+ '"';


IDENTIFIER: (DIGIT (DIGIT | DASH)*)? LETTER (DASH* ALPHANUMERIC)*;
FILENAME: DATA_DIVISION_ID '.coffee';
HIGHVALUES: H I G H DASH V A L U E S;
LOWVALUES: L O W  DASH V A L U E S;


fragment INT: DIGIT+;

fragment ALPHANUMERIC: LETTER | DIGIT;
fragment LETTER: [a-zA-Z];
fragment DIGIT: [0-9];

LBRACE:   '(';
RBRACE:   ')';
// Skipped token types
WS: [ \t\r\n]+ -> skip;

fragment SPECIAL: [.+*/=$,;><:];
fragment APOST: '\'';
fragment QUOTE: '"';
fragment SIGN: [+-];
fragment SEPARATOR: [.,];
fragment ID_DIV_CHAR: SPECIAL | LETTER | DIGIT | APOST | QUOTE | LBRACE | RBRACE | DASH | [ \t];
fragment PATTERN_CHAR: LETTER | DIGIT | [+*/$,;>:'"\-.() \t];

fragment A: [aA];
fragment B: [bB];
fragment C: [cC];
fragment D: [dD];
fragment E: [eE];
fragment F: [fF];
fragment G: [gG];
fragment H: [hH];
fragment I: [iI];
fragment J: [jJ];
fragment K: [kK];
fragment L: [lL];
fragment M: [mM];
fragment N: [nN];
fragment O: [oO];
fragment P: [pP];
fragment Q: [qQ];
fragment R: [rR];
fragment S: [sS];
fragment T: [tT];
fragment U: [uU];
fragment V: [vV];
fragment W: [wW];
fragment X: [xX];
fragment Y: [yY];
fragment Z: [zZ];

mode TYPE_CLAUSE;
TYPE_WS: [ \t]+ -> skip;
PICTURE: P I C T U R E;
IS: I S;
LIKE: L I K E -> pushMode(ID) ; //pushMode(QUALIFIED_ID), pushMode(ID).
Q_OF: O F -> pushMode(ID);
OCCURS_CLAUSE: O C C U R S -> pushMode(OCCURANCES);
REPRESENTATION: (
                    ([9AXZ](LBRACE INT RBRACE)?)+ // A valid representation string. S and V may only occur once, number in parentheses may shorthand repetition.
                    | ([9AXZ](LBRACE INT RBRACE)?)*'S'([9AXZ](LBRACE INT RBRACE)?)*('V'([9AXZ](LBRACE INT RBRACE)?)*)?
                    | ([9AXZ](LBRACE INT RBRACE)?)*'V'([9AXZ](LBRACE INT RBRACE)?)*('S'([9AXZ](LBRACE INT RBRACE)?)*)?
              );
TYPE_END: '.' -> popMode;

mode OCCURANCES;
OCCURANCES_WS: [ \t]+ -> skip;
N_TIMES: INT->popMode;
//TIMES: T I M E S -> popMode;

mode QUALIFIED_ID;
QID_WS: [ \t]+ -> skip;
//Q_OF: O F -> pushMode(ID);
//Q_DOT: '.' -> popMode,popMode;

mode ID;
ID_WS: [ \t]+ -> skip;
DATA_DIVISION_ID: (DIGIT (DIGIT | DASH)*)? LETTER (DASH* ALPHANUMERIC)* -> popMode;


mode DATA_DIVISION;
LEVEL: DIGIT DIGIT -> pushMode(TYPE_CLAUSE), pushMode(ID);
DATA_DIVISION_WS: [ \t\r\n]+ -> skip;
DATA_DIVISION_END:  {Character.isLetter((char) _input.LA(2))}? '~' -> popMode;
DATA_PARAGRAPH: PARAGRAPH;
//PROCEDURE_DIVISION_: DATA_PARAGRAPH P R O C E D U R E [ \t]+ D I V I S I O N DOT -> popMode/*, pushMode(PROCEDURE_DIVISION)*/;

//mode PROCEDURE_DIVISION;
//PROCEDURE_DIVISION_WS: [ \t\r\n]+ -> skip;
//PROCEDURE_PARAGRAPH: PARAGRAPH -> pushMode(ID);
//PROCEDURE_DOT: DOT;
//ACCEPT_STAT: A C C E P T-> pushMode(IDPLUS);