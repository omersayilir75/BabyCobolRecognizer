grammar Copybook;

import BabyCobol;
options { caseInsensitive = true; }

copybook: .*? (copy .*?)*;

WS: ('\t' | ' ' | '\r' | '\n' | '\u000C')+ -> skip;