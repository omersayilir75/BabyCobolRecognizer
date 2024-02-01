grammar baby;

@header { 
    package JavaBabyCobol;
}


/* case insensitive lexer matching */
fragment A:('a'|'A')(WS+)?;
fragment B:('b'|'B')(WS+)?;
fragment C:('c'|'C')(WS+)?;
fragment D:('d'|'D')(WS+)?;
fragment E:('e'|'E')(WS+)?;
fragment F:('f'|'F')(WS+)?;
fragment G:('g'|'G')(WS+)?;
fragment H:('h'|'H')(WS+)?;
fragment I:('i'|'I')(WS+)?;
fragment J:('j'|'J')(WS+)?;
fragment K:('k'|'K')(WS+)?;
fragment L:('l'|'L')(WS+)?;
fragment M:('m'|'M')(WS+)?;
fragment N:('n'|'N')(WS+)?;
fragment O:('o'|'O')(WS+)?;
fragment P:('p'|'P')(WS+)?;
fragment Q:('q'|'Q')(WS+)?;
fragment R:('r'|'R')(WS+)?;
fragment S:('s'|'S')(WS+)?;
fragment T:('t'|'T')(WS+)?;
fragment U:('u'|'U')(WS+)?;
fragment V:('v'|'V')(WS+)?;
fragment W:('w'|'W')(WS+)?;
fragment X:('x'|'X')(WS+)?;
fragment Y:('y'|'Y')(WS+)?;
fragment Z:('z'|'Z')(WS+)?;

/////////////////
// LEXER RULES //
/////////////////

GOTO : G O T O;
WITHNOADVANCING : W I T H N O A D V A N C I N G;
DELIMITEDBY : D E L I M I T E D B Y;
HIGHVALUES : H I G H '-'WS? V A L U E S;
LOWVALUES : L O W '-'WS? V A L U E S;
SPACES : S P A C E S;
SPACE : S P A C E;
ACCEPT : A C C E P T;
ADD : A D D;
GIVING : G I V I N G;
DISPLAY : D I S P L A Y;
SIZE : S I Z E;
DIVIDE : D I V I D E;
INTO : I N T O;
REMAINDER : R E M A I N D E R;
EVALUATE : E V A L U A T E;
WHEN : W H E N;
OTHER : O T H E R;
END : E N D;
IF : I F;
THEN : T H E N;
ELSE : E L S E;
NOT : N O T;
MOVE : M O V E;
MULTIPLY : M U L T I P L Y;
BY : B Y;
PERFORM : P E R F O R M;
THROUGH : T H R O U G H;
TIMES : T I M E S;
STOP : S T O P;
SUBTRACT : S U B T R A C T;
FROM : F R O M;
AND : A N D;
XOR : X O R;
OR : O R;
TRUE : T R U E;
FALSE : F A L S E;
LOOP : L O O P;
VARYING : V A R Y I N G;
WHILE : W H I L E;
UNTIL : U N T I L;
LIKE : L I K E;
OCCURS : O C C U R S;
IDENTIFICATION : I D E N T I F I C A T I O N;
DIVISION : D I V I S I O N;
PROCEDURE : P R O C E D U R E;
DATA : D A T A;
PICTURE : P I C T U R E;
NEXTSENTENCE : N E X T S E N T E N C E;
ALTER : A L T E R;
TOPROCEEDTO : T O P R O C E E D T O;
IS : I S;
TO : T O;

// For data division
NUMERICALDIGIT : S? ([9]+ | [9]+ '(' NUMERIC_LITERAL ')') (V (([9] | LEADINGDIGIT)+ | ([9] | LEADINGDIGIT)+ '(' NUMERIC_LITERAL ')'))?;
SINGLECHARACTER : 'X' 'X'+;  // TODO - Temporary workaround?
ALPHABETICALCHARACTER : 'A' 'A'+;  // TODO - Temporary workaround?
LEADINGDIGIT : 'Z';
DECIMAL : [9]+ V [9]+;

// https://www.mainframestechhelp.com/tutorials/cobol/literal.htm
NUMERIC_LITERAL : ('-'|'+')? NUMBER+ (('.'|',') NUMBER+)?;
NON_NUMERIC_LITERAL : ('"' | '\'') ~('"' | '\'')* ('"' | '\'');

IDENTIFIER : NAME (NUMBER+)?;  // Weet niet of dit de goede notatie is
NAME : [A-Za-z0-9\-]+;  // Ik weet ook niet of hier miss nog andere speciale karakters in de naam mogen
NUMBER : [0-9];

COMMENT : '\r'? '\n' WS* '*' ~('\n'|'\r')* '\r'? '\n' -> skip;
DOT : '.';
WS : [ \t\r\n\f]+ -> skip;


//////////////////
// PARSER RULES //
//////////////////
program : identificationDivision dataDivision? procedureDivision EOF;

identificationDivision : IDENTIFICATION DIVISION DOT (divName DOT divValue DOT)+;  // Nog geen flauw idee hoe we de value literal zonder quotes kunnen doen met lexer rule
divName : identifier;
divValue : literal;

dataDivision : DATA DIVISION DOT dataDivisionBody+;
dataDivisionBody : (level identifier (picture_representation | like_identifier)? occurs? DOT);
level : NUMERIC_LITERAL;
picture_representation : PICTURE IS representation;
like_identifier : LIKE identifier;
representation : (NUMERICALDIGIT | ALPHABETICALCHARACTER | SINGLECHARACTER | DECIMAL) representation_shortened?;
representation_shortened : '(' NUMERIC_LITERAL ')';
occurs : OCCURS NUMERIC_LITERAL TIMES;

procedureDivision : PROCEDURE DIVISION DOT sentence* paragraph+;
paragraph : paragraphName DOT sentence+;
paragraphName : identifier;
sentence : stmt+ DOT;

stmt : acceptStmt
     | addStmt
     | displayStmt
     | divideStmt
     | evaluateStmt
     | ifStmt
     | moveStmt
     | multiplyStmt
     | performStmt
     | subtractStmt
     | stopStmt
     | loopStmt
     | nextSentence
     | gotoStmt
     | alterStmt
     ;

nextSentence : NEXTSENTENCE;

acceptStmt : ACCEPT identifier+;

addStmt : add to giving?;
add : ADD atomic+;
to : TO atomic;
giving : GIVING identifier;

divideStmt : divide into giving? remainder?;
divide : DIVIDE atomic;
into : INTO atomic+;
remainder : REMAINDER identifier;

multiplyStmt : multiply by giving?;
multiply : MULTIPLY atomic;
by : BY atomic+;

subtractStmt : subtract fr giving?;
subtract : SUBTRACT atomic+;
fr : FROM atomic;

moveStmt : move moveTo;
move : MOVE (atomic | HIGHVALUES | LOWVALUES | SPACES);
moveTo : TO (identifier+);

displayStmt : DISPLAY displayExpr* (WITHNOADVANCING)?; 
displayExpr : atomic (DELIMITEDBY (SPACE | SIZE | literal))?;  // DELIMITED BY NOT MANDATORY

ifStmt : IF booleanExpression ifThen ifElse? END? ;
ifThen : THEN stmt+;
ifElse : ELSE stmt+;

booleanExpression : TRUE
                  | FALSE
                  | arithmeticExpression comparisonOp arithmeticExpression
                  | NOT booleanExpression
                  | booleanExpression booleanOp (booleanExpression|contractedBoolean)
                  ;

contractedBoolean : arithmeticAtomic
                  | comparisonOp arithmeticAtomic
                  ;

arithmeticExpression : arithmeticAtomic
                     | arithmeticExpression arithmeticOp arithmeticExpression
                     ;

arithmeticAtomic : identifier | NUMERIC_LITERAL;

comparisonOp : '=' 
             | '>' 
             | '<' 
             | '>=' 
             | '<='
             ;

arithmeticOp : '+'
             | '-'
             | '**'
             | '/'
             | '*'
             ;

booleanOp : AND 
          | OR 
          | XOR
          ;

stringExpression : stringAtomic
                 | stringExpression '+' stringExpression
                 ;

stringAtomic : identifier | NON_NUMERIC_LITERAL;

evaluateStmt : EVALUATE anyExpression whenBlock* END;

anyExpression : arithmeticExpression
              | booleanExpression
              | stringExpression
              ;
    
whenBlock : whenAtomic
          | whenOther
          ;

whenAtomic : WHEN atomic+ stmt+;
whenOther : WHEN OTHER stmt+;

loopStmt : LOOP loopChoice* END;
loopChoice : varyingLoop
           | whileLoop
           | untilLoop
           | stmt
           ;

varyingLoop : VARYING identifier? (FROM atomic)? (TO atomic)? (BY atomic)?;
whileLoop : WHILE booleanExpression;
untilLoop : UNTIL booleanExpression;

performStmt : PERFORM procedureName through? times?;
procedureName : sectionName | paragraphName | identifier;
sectionName : identifier;
through : THROUGH procedureName;
times : atomic TIMES;

gotoStmt : GOTO procedureName;

alterStmt : ALTER procedureName TOPROCEEDTO procedureName;

stopStmt : STOP;

atomic : identifier | literal;
identifier : IDENTIFIER;
literal : NUMERIC_LITERAL | NON_NUMERIC_LITERAL;
