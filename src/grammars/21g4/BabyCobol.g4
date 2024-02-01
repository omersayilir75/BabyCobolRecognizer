grammar BabyCobol;


program
    : identificationDivision (dataDivision)? (procedureDivision)? EOF
    ;

identificationDivision
    : IDENTIFICATION DIVISION DOT (divisionName DOT divisionName DOT)+
    ;

dataDivision
    : DATA DIVISION DOT (dataEntry)+
    ;

procedureDivision
    : PROCEDURE DIVISION DOT (sentence+)? paragraph*
    ;

divisionName
    : ID
    | NO_DOTS
    ;

sentence
    : stat+ DOT
    ;

paragraph
    : identifier DOT sentence+
    ;

dataEntry
    : INT_LIT identifier (pictureClause | likeClause)? occursClause? DOT
    ;

pictureClause
    : PICTURE IS representation
    ;

likeClause
    : LIKE identifier
    ;

occursClause
    :  OCCURS n=INT_LIT TIMES
    ;

representation
    : ID
    | INT_LIT
    ;

stat
    : ACCEPT identifier+                                                                #acceptStat
    | ADD left=atomic TO right=atomic (GIVING identifier)?                              #addStat
    | SUBTRACT left=atomic FROM right=atomic (GIVING identifier)?                       #subtractStat
    | MULTIPLY left=atomic BY right=atomic (GIVING identifier)?                         #multiplyStat
    | DISPLAY (dispOptions)+? (WITH NO ADVANCING)?                                      #displayStat
    | DIVIDE left=atomic INTO right=atomic (GIVING identifier)? (REMAINDER identifier)? #divideStat
    | STOP                                                                              #stopStat
    | IF boolExpr THEN ifStats+=stat+ (ELSE elseStats+=stat+?)? END                     #conditionalStat
    | EVALUATE anyExpr whenBlock*? END                                                  #evaluateStat
    | GO_TO identifier                                                                  #goToStat
    | PERFORM startProc=identifier (THROUGH endProc=identifier)? (atomic TIMES)?        #performStat
    ;

anyExpr
    : arithExpr
    | boolExpr
    ;

whenBlock
    : WHEN (OTHER | atomic+?) stat+
    ;

dispOptions
    : atomic (DELIMITED BY (SIZE | SPACE | literal))?
    ;

boolExpr
    : TRUE
    | FALSE
    | arithExpr compOp arithExpr
    | NOT boolExpr
    | boolExpr boolOp boolExpr
    ;

arithExpr
    : arithExpr POW_OP arithExpr                #powerExpr
    | arithExpr (MUL_OP | DIV_OP) arithExpr     #mulDivExpr
    | arithExpr (ADD_OP | SUB_OP) arithExpr     #addSubExpr
    | atomic                                    #arithAtomic
    ;

atomic
    : literal       #literalAtomic
    | identifier    #idAtomic
    ;

literal
    : INT_LIT   #intLit
    | NUM_LIT   #numLit
    | TXT_LIT   #txtLit
    | TRUE      #trueLit
    | FALSE     #falseLit
    ;

identifier
    : ACCEPT
    | ADD
    | ADVANCING
    | AND
    | BY
    | DATA
    | DELIMITED
    | DISPLAY
    | DIVIDE
    | DIVISION
    | ELSE
    | END
    | EVALUATE
    | FALSE
    | FROM
    | GIVING
    | IDENTIFICATION
    | IF
    | IS
    | MULTIPLY
    | NO
    | NOT
    | OCCURS
    | OF
    | OTHER
    | OR
    | PERFORM
    | PROCEDURE
    | PICTURE
    | SIZE
    | SPACE
    | STOP
    | SUBTRACT
    | THEN
    | THROUGH
    | TO
    | TRUE
    | WITH
    | WHEN
    | XOR
    | identifier (OF identifier)+
    | identifier INDEX
    | ID
    ;

boolOp
    : AND
    | OR
    | XOR
    ;

compOp
    : EQ
    | GT
    | LT
    | GE
    | LE
    ;


ACCEPT          : A C C E P T;
ADD             : A D D;
ADVANCING       : A D V A N C I N G;
AND             : A N D;
BY              : B Y;
DATA            : D A T A;
DELIMITED       : D E L I M I T E D;
DISPLAY         : D I S P L A Y;
DIVIDE          : D I V I D E;
DIVISION        : D I V I S I O N;
ELSE            : E L S E;
END             : E N D;
EVALUATE        : E V A L U A T E;
FALSE           : F A L S E;
FROM            : F R O M;
GIVING          : G I V I N G;
GO_TO           : G O WS? T O;
IDENTIFICATION  : I D E N T I F I C A T I O N;
IF              : I F;
INTO            : I N T O;
IS              : I S;
LIKE            : L I K E;
MULTIPLY        : M U L T I P L Y;
NO              : N O;
NOT             : N O T;
OCCURS          : O C C U R S;
OF              : O F;
OTHER           : O T H E R;
OR              : O R;
PERFORM         : P E R F O R M;
PROCEDURE       : P R O C E D U R E;
PICTURE         : P I C T U R E;
REMAINDER       : R E M A I N D E R;
SIZE            : S I Z E;
SPACE           : S P A C E;
STOP            : S T O P;
SUBTRACT        : S U B T R A C T;
THEN            : T H E N;
THROUGH         : T H R O U G H;
TIMES           : T I M E S;
TO              : T O;
TRUE            : T R U E;
WITH            : W I T H;
WHEN            : W H E N;
XOR             : X O R;

EQ          : '=';
GE          : '>=';
LE          : '<=';
GT          : '>';
LT          : '<';
POW_OP      : '**';
ADD_OP      : '+';
SUB_OP      : '-';
MUL_OP      : '*';
DIV_OP      : '/';
DOT         : '.';

INT_LIT : ('+' | '-')? [0-9]+;
NUM_LIT : ('+' | '-')? [0-9]* ('.' | ',') [0-9]+;
TXT_LIT : '"'.*?'"';

INDEX   : '('[ \r\t]*[0-9]+[ \r\t]*')';

ID      : [a-zA-Z0-9][a-zA-Z0-9-]*;
NO_DOTS : (~[. \r\t\n])+;


// Skip white-space
NEW_LINE : [\n] ->channel(HIDDEN);
WS  :   [ \r\t]+ -> skip;

// Case Insensitive
fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');
