grammar Atomic;

atomic
    : INTEGER       #integerAtomic
    | FLOAT         #floatAtomic
    | STRING        #stringAtomic
    | NULL          #nullAtomic
    | IDENTIFIER    #identifierAtomic;

INTEGER: [+-]?[0-9]+;
FLOAT: [+-]?([0-9]*[,])?[0-9]+;
STRING: ('"' ~'"'* '"') | ('\'' ~'\''* '\'');
FILENAME: IDENTIFIER.'baby';
NULL: 'null';

WS: [ \t\r\n]+ -> skip;
IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*;

fragment A : ('A'|'a');
fragment B : ('B'|'b');
fragment C : ('C'|'c');
fragment D : ('D'|'d');
fragment E : ('E'|'e');
fragment F : ('F'|'f');
fragment G : ('G'|'g');
fragment H : ('H'|'h');
fragment I : ('I'|'i');
fragment J : ('J'|'j');
fragment K : ('K'|'k');
fragment L : ('L'|'l');
fragment M : ('M'|'m');
fragment N : ('N'|'n');
fragment O : ('O'|'o');
fragment P : ('P'|'p');
fragment Q : ('Q'|'q');
fragment R : ('R'|'r');
fragment S : ('S'|'s');
fragment T : ('T'|'t');
fragment U : ('U'|'u');
fragment V : ('V'|'v');
fragment W : ('W'|'w');
fragment X : ('X'|'x');
fragment Y : ('Y'|'y');
fragment Z : ('Z'|'z');


