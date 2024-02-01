grammar BabyCobol;

options { caseInsensitive = true; }

program: identification_division data_division? procedure_division;

identification_division: 'IDENTIFICATION DIVISION' '.' ((copy '.') | identification_name_value_pair)+?;
identification_name_value_pair: (~'.'|'!')+? '.' (~'.'|'!')+? '.';

// This division also supports comment lines and COPY instructions.
data_division: 'DATA DIVISION' '.' (data_division_definition | copy)*;
data_division_definition: NUM_LITERAL WORD picture_or_like? occurs_clause? '.';

picture_or_like: picture | like;
picture: 'PICTURE IS' STR_LITERAL;

//NUMERIC_DIGIT: [0-9];
//ALPHABETIC_OR_SPACE: [a-zA-Z]| ' ';
//SINGLE_CHARACTER: [a-zA-Z];
like: 'LIKE' identifier;

occurs_clause: 'OCCURS' NUM_LITERAL 'TIMES';

// procedure_division
procedure_division: 'PROCEDURE DIVISION' using? '.' sentence* paragraph+;

using: 'USING' ( using_specifier )+;

using_specifier: by_reference_clause | by_content_clause | by_value_clause;
by_reference_clause: ('BY REFERENCE' WORD);
by_content_clause: ('BY CONTENT' atomic);
by_value_clause: ('BY VALUE' atomic);

sentence: statement+ '.';
paragraph: WORD '.' sentence+;

copy: 'COPY' WORD replacing?;
replacing: 'REPLACING' replacement_pair+;
replacement_pair: '===' replacement_literal '===' 'BY' '===' replacement_literal '===';
replacement_literal: (.)*?;


// statement
statement: add
         | subtract
         | multiply
         | divide
         | set
         | move
         | stop
         | display
         | accept
         | evaluate
         | goto
         | computable_goto
         | signal
         | loop
         | perform
         | next_sentence
         | copy
         | alter
         | if_statement;

// Just for testing!
set: 'SET' identifier 'TO' anyLiteral;

alter: 'ALTER' WORD 'TO' 'PROCEED' 'TO' WORD;

next_sentence: 'NEXT' 'SENTENCE';

goto: 'GO' 'TO' WORD; // go to paragraph name. If that name changes type this must too.

computable_goto: 'GO' 'TO' identifier;

add: 'ADD' atomic+ 'TO' atomic ('GIVING' identifier)*;


display: 'DISPLAY' atomic_with_delimitation+ (WITH_NO_ADVANCING)?;
atomic_with_delimitation: atomic delimitation_clause?;
delimitation_clause: 'DELIMITED BY' ('SIZE' | 'SPACE' | anyLiteral); // not required for points

divide: 'DIVIDE' denominator 'INTO' numerators (giving_clause remainder_clause?)?;
denominator: atomic;
numerators: atomic+;
giving_clause: 'GIVING' identifier+;
remainder_clause: 'REMAINDER' identifier;

multiply: 'MULTIPLY' multiplier 'BY' multiply_targets (single_ident_giving_clause)?;
multiplier: atomic;
multiply_targets: atomic+;
single_ident_giving_clause: 'GIVING' identifier;

subtract: 'SUBTRACT' substract_values_clause subtract_targets_clause (single_ident_giving_clause)*;
subtract_targets_clause: 'FROM' atomic+;
substract_values_clause: atomic+;

accept: 'ACCEPT' identifier+;

stop: 'STOP';


evaluate: 'EVALUATE' anyExpr ('ALSO' anyExpr)* whenWithStatements+ 'END';

whenWithStatements: whenClause statement+;

whenClause: 'WHEN' 'OTHER'                                      # whenOther
          | 'WHEN' whenValueMatches ('ALSO' whenValueMatches)*  # whenComplex;

whenValueMatches: whenValueMatch+;
whenValueMatch: atomic                   # whenValueMatchSimple
              | atomic 'THROUGH' atomic  # whenValueMatchThrough;


if_statement: 'IF' booleanExpr 'THEN' statement+ (else_clause)? 'END'; // END IS MANDATORY FOR NOW! (see canvas level 1)
else_clause: 'ELSE' statement+;

loop: 'LOOP' loopStm* 'END' ;
loopStmVarying: 'VARYING' identifier? fromClause toClause byClause;
fromClause: ('FROM' atomic)?;
toClause: ('TO' atomic)?;
byClause: ('BY' atomic)?;
loopStmWhile: 'WHILE' booleanExpr;
loopStmUntil: 'UNTIL' booleanExpr;

loopStm: loopStmVarying   # loopStmVar
        | loopStmWhile    # loopStmWhl
        | loopStmUntil    # loopStmUtl
        | statement       # loopStmStm;

signal: 'SIGNAL' 'OFF'      'ON' 'ERROR'    # signalOff
      | 'SIGNAL' WORD 'ON' 'ERROR'    # signalNormal;


anyExpr: arithExpr      # anyExprArith
       | stringExpr     # anyExprStr
       | booleanExpr    # anyExprBool;


booleanExpr: booleanTerm                                # boolTerm
           | termContractedBooleanExpr                  # boolExprTermContracted
           | operatorContractedBooleanExpr              # boolExprCompareContracted
           | arithExpr operatorContractedBooleanExpr    # boolExprCompare
           | 'NOT' booleanExpr                          # boolExprNot
           | booleanExpr 'AND' booleanExpr              # boolExprAnd
           | booleanExpr 'XOR' booleanExpr              # boolExprXor
           | booleanExpr 'OR' booleanExpr               # boolExprOr;

operatorContractedBooleanExpr: termOperatorContractedBooleanExpr    # boolExprOperatorTerm
                             | 'NOT' operatorContractedBooleanExpr  # boolExprOperatorNot;

termOperatorContractedBooleanExpr: '=' arithExpr                    # boolExprOperatorEQ
                             | '<' arithExpr                        # boolExprOperatorLT
                             | '<=' arithExpr                       # boolExprOperatorLE
                             | '>' arithExpr                        # boolExprOperatorGT
                             | '>=' arithExpr                       # boolExprOperatorGE;

termContractedBooleanExpr: arithExpr                        # boolExprContractedTerm
                         | 'NOT' termContractedBooleanExpr  # boolExprContractedNot;

booleanTerm: 'TRUE'                         # boolTermTrue
           | 'FALSE'                        # boolTermFalse
           | '(' booleanExpr ')'            # boolTermParens;


arithExpr: arithSubExpr                             # arithExprSub
         | <asoc=right> arithExpr '**' arithExpr    # arithExprPow
         | arithExpr '+' arithExpr                  # arithExprPlus
         | arithExpr '-' arithExpr                  # arithExprMinus;

arithSubExpr: arithTerm                             # arithExprTerm
            | arithSubExpr '*' arithSubExpr         # arithExprMult
            | arithSubExpr '/' arithSubExpr         # arithExprDiv;

arithTerm: atomic                                   # arithTermAtomic
         | '(' arithExpr ')'                        # arithTermParens;


stringExpr: stringTerm                  # stringExprTerm
         | stringExpr '+' stringExpr    # stringExprPlus;

stringTerm: atomic                      # stringTermAtomic
         | '(' stringExpr ')'           # stringTermParens;


// This must be an infix expression grammar where whitespace _does_ matter.
// Not sure how we do that. (we do that later :)

move: 'MOVE' move_value_clause 'TO' identifier+;
move_value_clause: atomic | 'HIGH-VALUES' | 'LOW-VALUES' | 'SPACES';


perform: 'PERFORM' procedure_name through_clause? times_clause?;
procedure_name: WORD;
through_clause: ('THROUGH' procedure_name);
times_clause: (atomic 'TIMES');

WITH_NO_ADVANCING: 'WITH NO ADVANCING';

atomic: anyLiteral # atomicLiteral
      | identifier # atomicIdent;

anyLiteral: NUM_LITERAL # literalNum
          | STR_LITERAL # literalStr;

// God be with you when deciphering this
NUM_LITERAL: [-+]?[0-9]* ([0-9] | ([,.] [0-9]+));
STR_LITERAL: '"' (~'"')* '"';

identifier: WORD ('OF' WORD)* (cardinality)?;
cardinality: '[' NUM_LITERAL ']';

// https://www.ibm.com/docs/en/i/7.3?topic=strings-cobol-words
WORD: [a-z0-9][a-z0-9\-_]*[a-z0-9]?;

WS: ('\t' | ' ' | '\r' | '\n' | '\u000C')+ -> skip;
