grammar Baby;
/*
 * place Atomic import in last place after all the other imports,
 * because order matters when a grammar ambiguity occcurs
 */
import Division, Atomic;

program: identificationDiv (dataDiv)? procedureDiv firstParagraph (alterParagraph | paragraph)* EOF;

firstParagraph: (IDENTIFIER ' '* '.')? (' '* sentence)+; // the first paragraph can essentially remain unnamed
alterParagraph: IDENTIFIER ' '* '.' ' '* gotoBaby ' '* '.';
paragraph: IDENTIFIER ' '* '.' (' '* sentence)+;
sentence: (' '* statement)+ ' '* '.';
statement: (subOpExpression | addOpExpression | mulOpExpression | divOpExpression | nextSentance | alter | display | gotoBaby | move | accept | perform | ifBlock | copy | loop | stop);

ifBlock: IF ' '* booleanExpression ' '* THEN ' '* block (' '* ELSE ' '* IF ' '* booleanExpression ' '* THEN ' '* block)*? (' '* ELSE block)?;

block: (sentence ' '*)* END;

// statements
accept: ACCEPT ' '* IDENTIFIER (' '* ',' ' '* IDENTIFIER)*?;
display: DISPLAY ' '* (' '* atomic)+ (' '* WITH_NO_ADVANCING)?;
move: MOVE ' '* assignedValue ' '* TO ' '* (' '* IDENTIFIER)+;
copy: COPY ' '* FILENAME (' '* REPLACING (' '* IDENTIFIER ' '* WITH ' '* IDENTIFIER)+)?;
perform: PERFORM ' '* IDENTIFIER (' '* THROUGH ' '* IDENTIFIER)? (' '* atomic ' '* TIMES)?;
alter: ALTER ' '* IDENTIFIER ' '* TO ' '* PROCEED ' '* TO ' '* IDENTIFIER;
stop: STOP;
gotoBaby: GOTO ' '* IDENTIFIER;
nextSentance: NEXT_SENTANCE;
loop: LOOP (' '* loopExpression)*;
subOpExpression: SUBTRACT ' '* atomic ' '* FROM ' '* atomic (' '* GIVING ' '* IDENTIFIER)?;
addOpExpression: ADD ' '* atomic ' '* TO ' '* atomic (' '* GIVING ' '* IDENTIFIER)?;
mulOpExpression: MULTIPLY ' '* atomic ' '* BY ' '* atomic (' '* GIVING ' '* IDENTIFIER)?;
divOpExpression: DIVIDE ' '* atomic ' '* INTO ' '* atomic (' '* GIVING ' '* IDENTIFIER)? (' '* REMAINDER ' '* IDENTIFIER)?;

varyingBaby: VARYING (' '* IDENTIFIER)? (' '* FROM ' '* atomic)? (' '* TO ' '* atomic)? (' '* BY ' '* atomic)? ' '* block;
whileBaby: WHILE ' '* booleanExpression ' '* block;
untilBaby: UNTIL ' '* booleanExpression ' '* block;

expression
    : atomic           #atomicExpression
    | IDENTIFIER       #identifierExpression;

booleanExpression
    : expression ' '* '>' ' '* expression     #biggerThenExpression
    | expression ' '* '<' ' '* expression     #lessThenExpression
    | expression ' '* '==' ' '* expression    #equalsExpression
    | expression ' '* '!=' ' '* expression    #notEqualsExpression;

loopExpression
    : varyingBaby          #varyingExpression
    | whileBaby            #whileExpression
    | untilBaby            #untilExpression;

assignedValue: atomic | figurativeConstants;
figurativeConstants: SPACES | HIGH_VALUES | LOW_VALUES;

// Operation keywords
SUBTRACT:   S U B T R A C T;
ADD:        A D D;
MULTIPLY:   M U L T I P L Y;
DIVIDE:     D I V I D E;
ALTER:      A L T E R;
COMPARE:    C O M P A R E;
ACCEPT:     A C C E P T;
GOTO:       G O ' '* T O;
PERFORM:    P E R F O R M;
DISPLAY:    D I S P L A Y;
EVALUATE:   E V A L U A T E;
WHILE:      W H I L E;
MOVE:       M O V E;
STOP:       S T O P;
LOOP:       L O O P;
UNTIL:      U N T I L;
IF:         I F;
ELSE:       E L S E;
THEN:       T H E N;
COPY:       C O P Y;

// Helping keywords
TO:         T O;
GO:         G O;
BY:         B Y;
END:        E N D;
INTO:       I N T O;
FROM:       F R O M;
WITH:       W I T H;
TIMES:      T I M E S;
GIVING:     G I V I N G;
PROCEED:    P R O C E E D;
THROUGH:    T H R O U G H;
VARYING:    V A R Y I N G;
REMAINDER:  R E M A I N D E R;
REPLACING:  R E P L A C I N G;
WITH_NO_ADVANCING: W I T H ' '* N O ' '* A D V A N C I N G;
NEXT_SENTANCE: N E X T ' '* S E N T E N C E;
SPACES:      S P A C E S;
HIGH_VALUES: H I G H '-' V A L U E S;
LOW_VALUES:  L O W '-' V A L U E S;