grammar darwinners;

program: identification=identificationDiv data=dataDiv? procedure=procedureDiv? EOF ;

paragraph: (name=NAME DOT)? sentences+=sentence+ ;

sentence: statements+=statement+ DOT ;

statement: ACCEPT vars+=identifier+ # accept
         | ADD values+=atomic+ TO toValue=atomic (GIVING giving=identifier)? # add
         | ALTER procedure=NAME TOPROCEEDTO toProcedure=NAME # alter
         | DISPLAY values+=atomic+ (withNoAdvancing=WITHNOADVANCING)? # display
         | DIVIDE value=atomic INTO intoValues+=atomic+ (GIVING giving=identifier)? (REMAINDER remainder=identifier)? # divide
         | EVALUATE exp=anyexpression cases+=evaluateWhen+ END # evaluate
         | GOTO (procedure=NAME | variable=identifier) #goto
         | IF condition=booleanexpression THEN truestatements+=statement+ (ELSE falsestatements+=statement+)? END # if
         | LOOP body+=loopClause+ END # loop
         | MOVE (toMove=atomic | (figconst=SPACES | figconst=LOWVALUES | figconst=HIGHVALUES)) TO values+=identifier+ # move
         | MULTIPLY value=atomic BY byValues+=atomic+ (GIVING giving=identifier)? # multiply
         | NEXTSENTENCE # nextSentence
         | PERFORM procedure=NAME (THROUGH through=NAME)? (times=atomic TIMES)? # perform
         | SIGNAL (procedure=NAME | off=OFF) ONERROR # signal
         | STOP # stop
         | SUBTRACT values+=atomic+ FROM fromValue=atomic (GIVING giving=identifier)? # subtract ;

loopClause: VARYING (varying=identifier)? (FROM fr=atomic)? (TO to=atomic)? (BY by=atomic)?
          | WHILE wh=booleanexpression
          | UNTIL until=booleanexpression
          | bodyStatement=statement;
evaluateWhen: when=whenblock stmts+=statement+ ;
whenblock: WHEN values+=atomic+ | WHENOTHER ;

anyexpression: arithemicEx=arithmeticexpression | booleanEx=booleanexpression ;
arithmeticexpression: parthLeft=OPENPAR aexp=arithmeticexpression parthLeft=CLOSEPAR
                    | exp1=arithmeticexpression op=PLUS exp2=arithmeticexpression
                    | exp1=arithmeticexpression op=MINUS exp2=arithmeticexpression
                    | exp1=arithmeticexpression op=STAR exp2=arithmeticexpression
                    | exp1=arithmeticexpression op=SLASH exp2=arithmeticexpression
                    | value=atomic ;
stringexpression: value=atomic | exp1=stringexpression PLUS exp2=stringexpression ;
booleanexpression: parthLeft=OPENPAR bexp=booleanexpression parthLeft=CLOSEPAR
                 | value=booleanLiteral
                 | (aexp1=arithmeticexpression? op=EQUAL)? aexp2=arithmeticexpression
                 | (aexp1=arithmeticexpression? op=LT)? aexp2=arithmeticexpression
                 | (aexp1=arithmeticexpression? op=GT)? aexp2=arithmeticexpression
                 | (aexp1=arithmeticexpression? op=GET)? aexp2=arithmeticexpression
                 | (aexp1=arithmeticexpression? op=LET)? aexp2=arithmeticexpression
                 | op=NOT exp=booleanexpression
                 | bexp1=booleanexpression op=OR bexp2=booleanexpression
                 | bexp1=booleanexpression op=AND bexp2=booleanexpression
                 | bexp1=booleanexpression op=XOR bexp2=booleanexpression ;

atomic: booleanLiteral | integerLiteral | stringLiteral | identifier ;
booleanLiteral: value=TRUE | value=FALSE ;
integerLiteral: value=INTEGER ;
stringLiteral: value=STRINGLITERAL ;
identifier: name=NAME (OPENPAR index=INTEGER CLOSEPAR)? | name=NAME OF parent=identifier;

identificationDiv: IDENTIFICATIONDIVISION DOT PROGRAMID DOT programIdValue=NAME DOT (optionalName=identificationDivOptional DOT optionalValue=NAME DOT)* ;
identificationDivOptional: author=AUTHOR
                         | installation=INSTALLATION
                         | datewritten=DATEWRITTEN
                         | datecompiled=DATECOMPILED
                         | security=SECURITY
                         | additional=NAME ;

dataDiv: DATADIVISION DOT data+=datadeclaration+ ;
datadeclaration: level=integerLiteral name=identifier type=datatype? DOT ;
datatype: PICTURE IS rep+=representation+ # picture
        | LIKE likeidentifier=identifier # like ;
representation: NAME+ | (OPENPAR index=INTEGER CLOSEPAR) | INTEGER;
procedureDiv : PROCEDUREDIVISION DOT paragraphs+=paragraph+ ;



fragment UPPERCASE: [A-Z] ;
fragment LOWERCASE: [a-z] ;
fragment DIGIT: [0-9] ;

//IDENTIFICATION DIVISION
IDENTIFICATIONDIVISION: I D E N T I F I C A T I O N SPACE D I V I S I O N ;
PROGRAMID: P R O G R A M MINUS I D ;
AUTHOR: A U T H O R ;
INSTALLATION: I N S T A L L A T I O N ;
DATEWRITTEN: D A T E MINUS W R I T T E N ;
DATECOMPILED: D A T E MINUS C O M P I L E D ;
SECURITY: S E C U R I T Y ;

//DATA DIVISION
DATADIVISION: D A T A SPACE D I V I S I O N ;
PICTURE: P I C T U R E ;
LIKE: L I K E ;
OCCURS: O C C U R S ;
IS: I S ;
OF: O F ;

//PROCEDURE DIVISION
PROCEDUREDIVISION : P R O C E D U R E SPACE D I V I S I O N ;

// Statements
ACCEPT: A C C E P T ;
ADD: A D D ;
ALTER: A L T E R ;
DISPLAY: D I S P L A Y ;
DIVIDE: D I V I D E ;
EVALUATE: E V A L U A T E ;
GOTO: G O SPACE T O ;
IF: I F ;
LOOP: L O O P ;
MOVE: M O V E ;
MULTIPLY: M U L T I P L Y ;
NEXTSENTENCE: N E X T SPACE S E N T E N C E ;
PERFORM: P E R F O R M ;
SIGNAL: S I G N A L ;
STOP: S T O P ;
SUBTRACT: S U B T R A C T ;

// Other keywords
BY: B Y ;
END: E N D ;
ELSE: E L S E ;
FROM: F R O M ;
GIVING: G I V I N G ;
INTO: I N T O ;
OFF: O F F ;
ONERROR: O N SPACE E R R O R ;
REMAINDER: R E M A I N D E R ;
THEN: T H E N ;
THROUGH: T H R O U G H ;
TIMES: T I M E S ;
TOPROCEEDTO: T O SPACE P R O C E E D SPACE T O ;
TO: T O ;
UNTIL: U N T I L ;
VARYING: V A R Y I N G ;
WHEN: W H E N ;
WHENOTHER: W H E N SPACE O T H E R ;
WHILE: W H I L E ;
WITHNOADVANCING: W I T H SPACE N O SPACE A D V A N C I N G ;
SPACES: S P A C E S ;
HIGHVALUES: H I G H MINUS V A L U E S ;
LOWVALUES: L O W MINUS V A L U E S ;

// Expressions
PLUS: '+' ;
MINUS: '-' ;
STAR: '*' ;
SLASH: '/' ;
TRUE: 'TRUE' ;
FALSE: 'FALSE' ;
NOT: 'NOT' ;
OR: 'OR' ;
AND: 'AND' ;
XOR: 'XOR' ;
EQUAL: '=' ;
GT : '>' ;
LT : '<' ;
LET : LT EQUAL;
GET : GT EQUAL;
COMPARISONOP: EQUAL | LT | GT | LET | GET ;
BOOLEANOP: OR | AND | XOR ;
BOOLEAN: TRUE | FALSE ;
ARITHMETICOP: PLUS | MINUS | STAR | SLASH ;

// MISC
DOT: '.' ;
INTEGER: ('-')? (DIGIT)+ ;
NAME: (UPPERCASE | LOWERCASE | DIGIT | '-')+ ;
STRINGLITERAL: '"' .*? '"' ;
OPENPAR: '(';
CLOSEPAR: ')';
WS: [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
ANY: . ;

// ALPHABET FRAGMENTS
fragment A : [aA]; // match either an 'a' or 'A'
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];
fragment SPACE: ' ';
