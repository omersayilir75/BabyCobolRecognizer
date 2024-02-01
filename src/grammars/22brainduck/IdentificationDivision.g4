grammar IdentificationDivision;

IDENTIFICATION_DIVISION : 'IDENTIFICATION DIVISION';
DOT : '.';

identificationDivision
    : IDENTIFICATION_DIVISION DOT identificationLine+
    ;

identificationLine : name=NAME_OR_VALUE DOT value=NAME_OR_VALUE DOT;

NAME_OR_VALUE : ( ~'.' )+;