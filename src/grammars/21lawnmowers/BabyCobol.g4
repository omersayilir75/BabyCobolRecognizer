grammar BabyCobol;

program:                    identification_division
                            data_division?
                            procedure_division
                            EOF;

identification_division:    IDENTIFICATION_DIVISION DOT
                            identification_division_content;
data_division:              DATA_DIVISION DOT
                            data_division_content;
procedure_division:         PROCEDURE_DIVISION DOT
                            procedure_division_content;

// Mandate PROGRAM-ID (for now)
identification_division_content:
                            program_id
                            author?
                            date_written?;
data_division_content:      data_declaration*;
procedure_division_content: block+;

program_id:                 PROGRAM_ID DOT atomic DOT;
author:                     AUTHOR DOT atomic DOT;
date_written:               DATE_WRITTEN DOT DATE_VALUE DOT;

data_declaration:           NUMBER atomic data_type? occurs? DOT;
data_type:                  picture_type | like_type;
picture_type:               PICTURE_IS data_rep;
like_type:                  LIKE identifier;
data_rep:                   NUMBER_REP | STRING_REP;
occurs:                     OCCURS NUMBER TIMES;

block:                      (atomic DOT)? sentence+;

sentence:                   sentence_content DOT;
sentence_content:           statement+;

statement:                  accept_statement |
                            add_statement |
                            display_statement |
                            divide_statement |
                            evaluate_statement |
                            goto_statement |
                            if_statement |
                            loop_statement |
                            move_statement |
                            multiply_statement |
                            next_sentence_statement |
                            perform_statement |
                            stop_statement |
                            subtract_statement;

// Statements
accept_statement:           ACCEPT identifier+;

add_statement:              ADD atomic TO atomic giving?;

display_statement:          DISPLAY display_expression* WITH_NO_ADVANCING?;
display_expression:         atomic;

divide_statement:           DIVIDE atomic INTO atomic giving? divide_remainder?;
divide_remainder:           REMAINDER identifier;

evaluate_statement:         EVALUATE any_expression when_block* END;
when_block:                 WHEN (atomic | OTHER) sentence_content;

goto_statement:             GO_TO atomic;

if_statement:               IF boolean_expression THEN then_block (ELSE else_block)? END?;
then_block:                 sentence_content;
else_block:                 sentence_content;

loop_statement:             LOOP inner_loop_statement* END;
inner_loop_statement:       varying_statement |
                            while_statement |
                            until_statement |
                            statement;
varying_statement:          VARYING varying_variant? varying_from? varying_to? varying_by?;
varying_variant:            identifier;
varying_from:               FROM atomic;
varying_to:                 TO atomic;
varying_by:                 BY atomic;
while_statement:            WHILE boolean_expression;
until_statement:            UNTIL boolean_expression;

move_statement:             MOVE (atomic | SPACES | HIGH_VALUES | LOW_VALUES) TO identifier+; // TODO maybe change one of them to identifier

multiply_statement:         MULTIPLY atomic BY atomic giving?;

next_sentence_statement:    NEXT_SENTENCE;

perform_statement:          PERFORM atomic perform_through? (NUMBER TIMES)?;
perform_through:            THROUGH atomic;

stop_statement:             STOP;

subtract_statement:         SUBTRACT atomic FROM atomic giving?;


giving:                     GIVING identifier;


// Expressions
any_expression:             arithmetic_expression |
                            boolean_expression |
                            string_expression;

arithmetic_expression:      atomic |
                            arithmetic_expression ARITHMETIC_OPERATOR arithmetic_expression;
boolean_expression:         TRUE |
                            FALSE |
                            arithmetic_expression COMPARISON_OPERATOR arithmetic_expression |
                            NOT boolean_expression |
                            boolean_expression BOOLEAN_OPERATOR boolean_expression |
                            contracted_expression;
string_expression:          atomic |
                            string_expression ARITHMETIC_OPERATOR string_expression;

contracted_expression:      atomic COMPARISON_OPERATOR contracted_expression_part* atomic;
contracted_expression_part: atomic BOOLEAN_OPERATOR COMPARISON_OPERATOR?;

atomic:                     NUMBER | ATOMIC | identifier;

identifier:                 ATOMIC (OF ATOMIC)*;

ACCEPT:                     A C C E P T;
ADD:                        A D D;
DISPLAY:                    D I S P L A Y;
DIVIDE:                     D I V I D E;
EVALUATE:                   E V A L U A T E;
GO_TO:                      G O ' '? T O;
IF:                         I F;
LOOP:                       L O O P;
MOVE:                       M O V E;
MULTIPLY:                   M U L T I P L Y;
NEXT_SENTENCE:              N E X T ' '? S E N T E N C E;
STOP:                       S T O P;
SUBTRACT:                   S U B T R A C T;


IDENTIFICATION_DIVISION:    I D E N T I F I C A T I O N ' '? D I V I S I O N;
PROGRAM_ID:                 P R O G R A M '-' I D;
AUTHOR:                     A U T H O R;
DATE_WRITTEN:               D A T E '-' W R I T T E N;

DATA_DIVISION:              D A T A ' '? D I V I S I O N;

PROCEDURE_DIVISION:         P R O C E D U R E ' '? D I V I S I O N;

TO:                         T O;
FROM:                       F R O M;
BY:                         B Y;
INTO:                       I N T O;

GIVING:                     G I V I N G;

REMAINDER:                  R E M A I N D E R;

SPACES:                     S P A C E S;
HIGH_VALUES:                H I G H '-' V A L U E S;
LOW_VALUES:                 L O W '-' V A L U E S;

// ATOMIC:                     ~(' ' | '.' | '\n')*?;

TRUE:                       T R U E;
FALSE:                      F A L S E;
NOT:                        N O T;
ARITHMETIC_OPERATOR:        ArithmeticOp;
COMPARISON_OPERATOR:        ComparisonOp;
BOOLEAN_OPERATOR:           (Or | And | Xor);


WHEN:                       W H E N;
OTHER:                      O T H E R;
END:                        E N D;

THEN:                       T H E N;
ELSE:                       E L S E;


VARYING:                    V A R Y I N G;
WHILE:                      W H I L E;
UNTIL:                      U N T I L;

PERFORM:                    P E R F O R M;
THROUGH:                    T H R O U G H;


PICTURE_IS:                 P I C T U R E ' '? I S;
LIKE:                       L I K E;
OCCURS:                     O C C U R S;

TIMES:                      T I M E S;

OF:                         O F;


// NUMBER_REP:                 NINE+;
NUMBER_REP:                 S? (Z* | Z REP_AMOUNT) ('9'+ | '9' REP_AMOUNT) V? ('9'* | '9' REP_AMOUNT);
STRING_REP:                 (A REP_AMOUNT? | X REP_AMOUNT? | '9' REP_AMOUNT?)+;
REP_AMOUNT:                 '(' ([0-9])+ ')';

DATE_VALUE:                 Date;

WITH_NO_ADVANCING:          W I T H ' '? N O ' '? A D V A N C I N G;

// IDENTIFIER:                 VAR ('-' VAR)* INT?;

NL:                         ('\r'? '\n' ' '*) -> skip;
DOT:                        '.';

NUMBER:                     Digit+ ('.' Digit+)?;

ATOMIC:                     Atomic_Char+;

WS:                         [ \r\n\t\f]+ -> skip;

fragment Atomic_Char:       ~(' ' | '.' | '\n');
fragment Letter:            A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z;
fragment NINE:              [9];
fragment Digit:             [0-9];
fragment Anything:          .;
fragment Date:              Digit Digit Digit Digit '-' Digit Digit '-' Digit Digit;
fragment Or:                O R;
fragment And:               A N D;
fragment Xor:               X O R;
fragment ComparisonOp:      '=' | '>' | '<' | '>=' | '<=';
fragment ArithmeticOp:      '+' | '-' | '*' | '/' | '**';
fragment ConcatOp:          '+';

fragment A:                 ('a'|'A');
fragment B:                 ('b'|'B');
fragment C:                 ('c'|'C');
fragment D:                 ('d'|'D');
fragment E:                 ('e'|'E');
fragment F:                 ('f'|'F');
fragment G:                 ('g'|'G');
fragment H:                 ('h'|'H');
fragment I:                 ('i'|'I');
fragment J:                 ('j'|'J');
fragment K:                 ('k'|'K');
fragment L:                 ('l'|'L');
fragment M:                 ('m'|'M');
fragment N:                 ('n'|'N');
fragment O:                 ('o'|'O');
fragment P:                 ('p'|'P');
fragment Q:                 ('q'|'Q');
fragment R:                 ('r'|'R');
fragment S:                 ('s'|'S');
fragment T:                 ('t'|'T');
fragment U:                 ('u'|'U');
fragment V:                 ('v'|'V');
fragment W:                 ('w'|'W');
fragment X:                 ('x'|'X');
fragment Y:                 ('y'|'Y');
fragment Z:                 ('z'|'Z');