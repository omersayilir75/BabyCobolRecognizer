grammar Division;
import Atomic;

// IDENTIFICATION DIVISION
identificationDiv: IDENTIFICATION_DIVISION ' '* '.' ' '* PROGRAM_ID ' '*  '.' ' '*  value ' '* '.' (' '*  optionalClause)*;
optionalClause: name ' '* '.' ' '*  value ' '*  '.';
name: AUTHOR | INSTALLATION | DATE_WRITTEN | DATE_COMPILED | SECURITY;
value: atomic;

// DATA DIVISION
dataDiv: DATA_DIVISION ' '* '.' (' '* entry)+;
entry: level ' '* IDENTIFIER ' '* (PICTURE_IS ' '* representation | LIKE ' '* IDENTIFIER)? ' '* (occurs)? '.';
level: INTEGER;
representation: (NINE_REPRESENTATION | X_REPRESENTATION);
occurs: OCCURS ' '* INTEGER ' '* TIMES;

// PROCEDURE DIVISION
procedureDiv: PROCEDURE_DIVISION ' '* '.' ;


// keywords
DIVISION: D I V I S I O N;
IDENTIFICATION_DIVISION: I D E N T I F I C A T I O N ' '* DIVISION;
DATA_DIVISION: D A T A ' '* DIVISION;
PROCEDURE_DIVISION: P R O C E D U R E ' ' DIVISION;
PROGRAM_ID: P R O G R A M '-' I D;
AUTHOR: A U T H O R;
INSTALLATION: I N S T A L L A T I O N;
DATE_WRITTEN: D A T E '-' W R I T T E N;
DATE_COMPILED: D A T E '-' C O M P I L E D;
SECURITY: S E C U R I T Y;

PICTURE_IS: P I C T U R E ' ' I S;
NINE_REPRESENTATION: [9]+;
X_REPRESENTATION: [X]+;
LIKE: L I K E;
OCCURS: O C C U R S;
