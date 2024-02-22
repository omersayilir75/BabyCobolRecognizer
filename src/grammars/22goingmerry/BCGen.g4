grammar BCGen;

program : identification_division
          (NL data_division)?
          (NL procedure_division)?
          EOF
        ;

identification_division : SP7 IDENTIFICATION SP DIVISION DOT (NL identificationEntry)*;

identificationEntry : SP7 TAB ((IDENTIFIER DOT SP IDENTIFIER DOT)| (copy_statement DOT));

data_division: SP7 DATA SP DIVISION DOT (NL SP7 TAB line)*;
line : record | field | (copy_statement DOT);
record : INT SP IDENTIFIER (SP OCCURS SP INT+ SP TIMES)? DOT;
field : INT SP IDENTIFIER ((SP PICTURE SP IS SP representation) | (SP LIKE SP identifiers)) (SP OCCURS SP INT+ SP TIMES)? DOT;

representation: (IDENTIFIER | INT) INDEX?; // inclusion index allows for 9(20) and such

identifiers     :   IDENTIFIER (INDEX)?(SP OF SP IDENTIFIER (INDEX)?)* ;

procedure_division : SP7 PROCEDURE SP DIVISION (SP USING (SP using)*)? DOT (NL statements)*  (NL paragraph)* NL SP7 TAB DOT  ;

paragraph :  SP7 TAB IDENTIFIER DOT (NL statements)+ ;



statements : (SP7 TAB statement (DOT)?);

using     : BY SP REFERENCE SP IDENTIFIER
          | BY SP CONTENT SP atomic
          | BY SP VALUE SP atomic
          ;

statement : accept_statement
          | add_statement
          | alter_statement
          | call_statement
          | copy_statement
          | display_statement
          | divide_statement
          | evaluate_statement
          | go_to_statement
          | if_statement
          | loop_statement
          | move_statement
          | multiply_statement
          | next_sentence_statement
          | perform_statement
          | signal_statement
          | stop_statement
          | subtract_statement
          ;


//statements
accept_statement : ACCEPT SP (f+=identifiers)+ ;

add_statement : ADD (SP atomic)+ SP TO SP to+=atomic (SP GIVING SP ident+=identifiers)* ;

alter_statement: ALTER SP IDENTIFIER SP TO SP PROCEED SP TO SP IDENTIFIER;

call_statement: CALL SP (IDENTIFIER | LITERAL) SP (USING (SP call_types)+)? ;

copy_statement: COPY SP (IDENTIFIER | LITERAL) (SP REPLACING (SP replace=COPYLITERAL SP BY SP by=COPYLITERAL)+)?;

display_statement : DISPLAY (SP atomic (SP DELIMITED SP BY SP display_types)?)+ (SP WITH SP NO SP ADVANCING)?;

divide_statement : DIVIDE SP div=atomic SP INTO (SP atomic)+ (SP GIVING (SP identifiers)+  (SP REMAINDER SP remainder_id=identifiers)? )? ;

go_to_statement: GO SP TO SP IDENTIFIER;

evaluate_statement : EVALUATE SP anyExpression (SP ALSO SP expression)* (SP evaluate_WhenClause (SP statement)+)+ SP END ;

if_statement : IF SP booleanExpression SP THEN  (NL SP7 TAB statement)+ (SP ELSE (NL SP statement)+)? (NL SP END)? ;

loop_statement: LOOP (SP loop_types)* SP END;

move_statement : MOVE SP move_types SP TO (SP identifiers)+;

multiply_statement : MULTIPLY SP multiply=atomic SP BY (SP atomic)+ (SP GIVING SP giving_id=identifiers )? ;

next_sentence_statement: NEXT SP SENTENCE;

perform_statement : PERFORM SP IDENTIFIER (SP THROUGH SP IDENTIFIER)? (SP atomic SP TIMES)? ;

signal_statement: SIGNAL SP ((IDENTIFIER | OFF) SP) ONERROR;

stop_statement : STOP ;

subtract_statement : SUBTRACT SP (atomic SP)+ FROM (SP atomic)+ (SP GIVING SP identifiers)* ;

/////////////////////



call_types: BY SP REFERENCE SP IDENTIFIER
          | BY SP CONTENT SP atomic
          | BY SP VALUE SP atomic
          ;

display_types: SIZE
             | SPACE
             | literal
             ;

move_types: SPACES
          | HIGH
          | LOW
          | atomic
          ;

loop_types: VARYING SP identifiers? (SP FROM SP fr=atomic)? (SP TO SP to=atomic)? (SP BY SP by=atomic)?
          | WHILE SP booleanExpression
          | UNTIL SP booleanExpression
          | statement
          ;

evaluate_WhenClause : WHEN ((SP atomic (SP THROUGH SP atomic)?)+ SP ALSO)*
                    | WHEN (SP atomic (SP THROUGH SP atomic)?)*
                    | WHEN SP OTHER
                    ;


anyExpression : arithmeticExpression
              | booleanExpression
              | stringExpression
              ;

arithmeticExpression : arithmeticAtomic
                     | arithmeticExpression SP arithmeticOp SP arithmeticExpression
                     ;
arithmeticAtomic : identifiers | (INT | DOUBLE);


stringExpression : stringAtomic
                 | stringExpression SP '+' SP stringExpression
                 ;

stringAtomic : identifiers | LITERAL;

atomic      : literal
            | identifiers
            ;


booleanExpression : left=booleanTerm (SP (OR |  XOR) SP right+=booleanTerm)*
                  ;

booleanTerm : left=booleanFactor (SP AND SP right+=booleanFactor)* ;

booleanFactor : booleanValue
              | '(' booleanExpression (SP (AND | OR | XOR | '=') SP booleanExpression)+ ')' // twice or more to prevent generating things like "(TRUE)"
              ;

booleanValue : booleanOp
             | comparisonExpression
             | '(' NOT SP booleanValue ')' // testing to see what happens... -> much less failing test
             ;

comparisonExpression :(right+=additiveExpression)
                     |left=additiveExpression (SP comparisonOp SP right+=additiveExpression)*
                     |(comparisonOp SP right+=additiveExpression)+
                     ; // no more branches that are ? or *

additiveExpression : multiplicativeExpression (SP arithmeticOp SP multiplicativeExpression)* ;

multiplicativeExpression : primaryExpression (SP arithmeticOp SP primaryExpression)* ;

primaryExpression : atomic | ('(' booleanExpression SP (AND | OR | XOR | '=') SP booleanExpression ')') ;

//booleanExpression : condition+ ;


//condition : left=expression (anyOperation right=expression)?
//          | anyOperation right=expression?
//          | NOT right=expression
//          ;

expression : left=factor (SP anyOperation SP right=factor)* ;

factor : literal | IDENTIFIER | anyOperation ;

int             :   ('-'|'+')? INT;


literal : int | DOUBLE | LITERAL | TRUE | FALSE;



anyOperation    :comparisonOp
                |arithmeticOp
                |logicalOp
                |booleanOp
                ;

//////OPERATIONS
comparisonOp    :   '='
                |   '>'
                |   '<'
                |   '>='
                |   '<='
                ;

arithmeticOp    :   '+'
                |   '-'
                |   '*'
                |   '**'
                |   '/'
                ;

logicalOp       : OR
                | AND
                ;

booleanOp       : TRUE
                | FALSE
                ;
//symbols

IDENTIFICATION: 'IDENTIFICATION';
DIVISION:   'DIVISION';
PROCEDURE:  'PROCEDURE';
ID:         'ID';
RUN:        'RUN';
DATA:       'DATA';
CALL:       'CALL';
COPY:       'COPY';
DISPLAY:    'DISPLAY';
SIZE:       'SIZE';
SPACE:      'SPACE';
WITH:       'WITH';
NO:         'NO';
ADVANCING:  'ADVANCING';
STOP:       'STOP';
MOVE:       'MOVE';
TO:         'TO';
SUBTRACT:   'SUBTRACT';
FROM:       'FROM';
GIVING:     'GIVING';
MULTIPLY:   'MULTIPLY';
BY:         'BY';
PERFORM:    'PERFORM';
TIMES:      'TIMES';
IF:         'IF';
THEN:       'THEN';
ELSE:       'ELSE';
END:        'END';
ACCEPT:     'ACCEPT';
ADD:        'ADD';
DIVIDE:     'DIVIDE';
DELIMITED:  'DELIMITED';
INTO:       'INTO';
EVALUATE:   'EVALUATE';
ALSO:       'ALSO';
WHEN:       'WHEN';
OTHER:      'OTHER';
TRUE:       'TRUE';
FALSE:      'FALSE';
NOT:        'NOT';
OR:         'OR';
AND:        'AND';
XOR:        'XOR';
NEXT:       'NEXT';
SENTENCE:   'SENTENCE';
REMAINDER:  'REMAINDER';
LOOP:       'LOOP';
VARYING:    'VARYING';
WHILE:      'WHILE';
REPLACING:  'REPLACING';
UNTIL:      'UNTIL';
OF:         'OF';
THROUGH:    'THROUGH';
PICTURE:    'PICTURE';
PARAGRAPH:  'PARAGRAPH';
IS:         'IS';
LIKE:       'LIKE';
OCCURS:     'OCCURS';
GO:         'GO';
SPACES:     'SPACES';
VALUE:      'VALUE';
HIGH:       'HIGH-VALUES';
LOW:        'LOW-VALUES';
USING:      'USING';
REFERENCE:  'REFERENCE';
CONTENT:    'CONTENT';
SIGNAL:     'SIGNAL';
ONERROR:    'ON ERROR';
OFF:        'OFF';
ALTER:      'ALTER';
PROCEED:    'PROCEED';

SP7: '       ';
TAB: '    ';
SP: ' ';
NL : '\n';

INT : [0-9]+;
DOUBLE : ('-'|'+')? INT ( DOT INT )? ;
LITERAL :   '"' ~'"'* '"'; // Any char except for "
COPYLITERAL :  '===' ~'='+ '===';
DOT : '.';
IDENTIFIER : [a-z]+ [0-9]* ([-_]+ [a-z0-9]+)*; // for generator: change [a-zA-Z0-9]+ to [a-zA-Z]+ [0-9]*
                                               // disallow capital letters for generating easier test
VAR : [A-Za-z]+;
DIGIT : '-'? [0-9]+;
DASH : '-';
COMMA: ',';
INDEX   : '('(([0-9]+)|IDENTIFIER)')'; // no identifies
COMMENT : '\r'? '\n' (( ' ' | '\t' | '\r' | '\n' )+)* '*' ~('\n'|'\r')* '\r'? '\n' -> skip;




