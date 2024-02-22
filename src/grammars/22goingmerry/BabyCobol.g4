grammar BabyCobol;

program : identification_division (data_division)? (procedure_division)? EOF;

identification_division :  IDENTIFICATION DIVISION DOT identificationEntry*;

identificationEntry :   (IDENTIFIER DOT IDENTIFIER DOT)| (copy_statement DOT);

data_division: DATA DIVISION DOT lines+=line*;
line : record | field | (copy_statement DOT);
record : INT IDENTIFIER (OCCURS INT+ TIMES)? DOT;
field : INT IDENTIFIER ((PICTURE IS representation) | (LIKE identifiers)) (OCCURS INT+ TIMES)? DOT;

representation: (IDENTIFIER | INT) INDEX?; // inclusion index allows for 9(20) and such

identifiers     :   IDENTIFIER (INDEX)?(OF IDENTIFIER (INDEX)?)* ;

procedure_division : PROCEDURE DIVISION (USING using*)? DOT statements* paragraph* DOT  ;

paragraph :   IDENTIFIER DOT statements+ ;

statements : statement+ DOT?;

using     : BY REFERENCE IDENTIFIER
          | BY CONTENT atomic
          | BY VALUE atomic
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
accept_statement : ACCEPT (f+=identifiers)+ ;

add_statement : ADD add+=atomic+ TO to+=atomic (GIVING ident+=identifiers)* ;

alter_statement: ALTER IDENTIFIER TO PROCEED TO IDENTIFIER;

call_statement: CALL (IDENTIFIER | LITERAL) (USING call_types+)? ;

copy_statement: COPY (IDENTIFIER | LITERAL) (REPLACING (replace=COPYLITERAL BY by=COPYLITERAL)+)?;

display_statement : DISPLAY (atomic (DELIMITED  BY display_types)?)+  (WITH NO ADVANCING)?;

divide_statement : DIVIDE div=atomic    INTO into+=atomic+ ( GIVING giving_id+=identifiers+  (REMAINDER remainder_id=identifiers)? )? ;

go_to_statement: GO TO IDENTIFIER;

evaluate_statement : EVALUATE anyExpression (ALSO expression)* (evaluate_WhenClause statement+)+  END ;

if_statement : IF booleanExpression THEN then+=statement+ (ELSE esle+=statement+)? (END)? ;

loop_statement: LOOP loops+=loop_types* END;

move_statement : MOVE move_types TO move_ids+=identifiers+;

multiply_statement : MULTIPLY multiply=atomic BY by+=atomic+ ( GIVING giving_id=identifiers )? ;

next_sentence_statement: NEXT SENTENCE;

perform_statement : PERFORM IDENTIFIER (THROUGH IDENTIFIER)? (atomic TIMES)? ;

signal_statement: SIGNAL (IDENTIFIER | OFF) ONERROR;

stop_statement : STOP ;

subtract_statement : SUBTRACT subtract+=atomic+ FROM fr+=atomic+ (GIVING identifiers)* ;

/////////////////////



call_types: BY REFERENCE IDENTIFIER
          | BY CONTENT atomic
          | BY VALUE atomic
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

loop_types: VARYING identifiers? (FROM fr=atomic)? (TO to=atomic)? (BY by=atomic)?
          | WHILE booleanExpression
          | UNTIL booleanExpression
          | statement
          ;

evaluate_WhenClause : WHEN ((atomic (THROUGH atomic)?)+ ALSO)*
                    | WHEN (atomic (THROUGH atomic)?)*
                    | WHEN OTHER
                    ;


anyExpression : arithmeticExpression
              | booleanExpression
              | stringExpression
              ;

arithmeticExpression : arithmeticAtomic
                     | arithmeticExpression arithmeticOp arithmeticExpression
                     ;
arithmeticAtomic : identifiers | (INT | DOUBLE);


stringExpression : stringAtomic
                 | stringExpression '+' stringExpression
                 ;

stringAtomic : identifiers | LITERAL;

atomic      : literal
            | identifiers
            ;


booleanExpression : left=booleanTerm ((OR |  XOR) right+=booleanTerm)*
                  ;

booleanTerm : left=booleanFactor (AND right+=booleanFactor)* ;

booleanFactor : booleanValue
              | '(' booleanExpression ')'
              ;

booleanValue : booleanOp
             | comparisonExpression
             | NOT booleanValue
             ;

comparisonExpression :(right+=additiveExpression)?
                     |left=additiveExpression (comparisonOp right+=additiveExpression)*
                     |(comparisonOp right+=additiveExpression)*
                     ;

additiveExpression : multiplicativeExpression (arithmeticOp multiplicativeExpression)* ;

multiplicativeExpression : primaryExpression (arithmeticOp primaryExpression)* ;

primaryExpression : atomic | '(' booleanExpression ( (AND | OR | XOR | '=')  booleanExpression)*  ')' ;

//booleanExpression : condition+ ;


//condition : left=expression (anyOperation right=expression)?
//          | anyOperation right=expression?
//          | NOT right=expression
//          ;

expression : left=factor (anyOperation right=factor)* ;

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


WS : ( ' ' | '\t' | '\r' | '\n' )+ -> skip ;
INT : [0-9]+;
DOUBLE : ('-'|'+')? INT ( DOT INT )? ;
LITERAL :   '"' ~'"'* '"'; // Any char except for "
COPYLITERAL :  '===' ~'='+ '===';
DOT : '.';
IDENTIFIER : [a-zA-Z0-9]+ ([-_]+ [a-zA-Z0-9]+)*;
VAR : [A-Za-z]+;
DIGIT : '-'? [0-9]+;
DASH : '-';
COMMA: ',';
INDEX   : '('([0-9]*| IDENTIFIER)')';
COMMENT : '\r'? '\n' WS* '*' ~('\n'|'\r')* '\r'? '\n' -> skip;




