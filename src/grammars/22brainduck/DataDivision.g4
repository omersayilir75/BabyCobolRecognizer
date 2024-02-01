grammar DataDivision;

//import DataDivisionVocab;

dataDivision : DATA_DIVISION DOT declaration+;

declaration
    : lvl=NUMBER WORD occurs? DOT
        # plainDeclaration

    | lvl=NUMBER WORD PICTURE_IS representation occurs? DOT
        # pictureDeclaration

    | lvl=NUMBER WORD LIKE identifier occurs? DOT
        # likeDeclaration
    ;

representation : (~'.')+?;

identifier
    : WORD
    | identifier (OF parent=identifier)
    ;

occurs : OCCURS NUMBER TIMES;

DATA_DIVISION : 'DATA DIVISION';
DOT : '.';
PICTURE_IS : 'PICTURE IS';
LIKE : 'LIKE';
OCCURS : 'OCCURS';
TIMES : 'TIMES';
OF : 'OF';



NUMBER : DIGIT+;
WORD : (DIGIT (DIGIT | DASH)*)? LETTER (DASH* ALPHANUM) *;

fragment DIGIT : [0-9];
fragment LETTER : [a-zA-Z];
fragment DASH : [-_];
fragment ALPHANUM : LETTER | DIGIT;

LPAR : '(';
RPAR : ')';

WS: (' ' | '\n' | '\t' | '\r') -> skip;