grammar ProcedureDivision;

import ProcedureDivisionVocab;

// No USING, because we do not implement CALL.
procedureDivision : PROCEDURE_DIVISION DOT sentences=sentence* paragraph* EOF;

paragraph : identifier DOT sentences=sentence+? ;
sentence : statement+? DOT;

statement
    : ACCEPT identifier+
        # acceptStatement

    | ADD from+=atomic+ TO to=atomic ( GIVING giving=identifier )?
        # addStatement

    | ALTER procedure=identifier TO_PROCEED_TO target=identifier
        # alterStatement
    // ALTER, CALL, COPY

    | DISPLAY displayClause+
        WITH_NO_ADVANCING ?
        # displayStatement

    | DIVIDE source=atomic INTO targets+=atomic+
        ( GIVING identifiers+=identifier+
            ( REMAINDER remainder=identifier )?
        )?
        # divideStatement

    | EVALUATE expressions+=anyExpression (ALSO expressions+=anyExpression)* whenClause+ END
        # evaluateStatement

    | GO_TO identifier
        # gotoStatement

    | IF anyExpression
        THEN then+=statement+
        ( ELSE else+=statement+ )?
        END
        # ifStatement

    | LOOP loopLine* END
        # loopStatement

    | MOVE atomic TO identifiers+=identifier+ # moveAtomicStatement
    | MOVE ( HIGH_VALUES | LOW_VALUES | SPACES ) TO identifier #moveSymbolicStatement

    | MULTIPLY from=atomic BY by+=atomic+ ( GIVING giving=identifier )?
        # multiplyStatement

    | NEXT_SENTENCE
        # nextSentenceStatement

    | PERFORM procedure=identifier
        ( THROUGH through=identifier )?
        ( times=atomic TIMES)?
        # performStatement

    | SIGNAL procedure=identifier ON_ERROR # signalProcedureStatement

    | STOP # stopStatement

    | SUBTRACT atomics+=atomic+ FROM from=atomic ( GIVING giving=identifier )*
        # subtractStatement
    ;

displayClause : atomic ;

whenClause
    : WHEN
        whenCondition
        ( ALSO whenCondition )*?
        statement+
        # whenNormal

    | WHEN OTHER statement+
        # whenOther
    ;

whenCondition
    : whenAtomic=atomic ( THROUGH through=atomic )? ;
loopLine
    : VARYING varying=identifier? ( FROM from=atomic )? ( TO to=atomic )? ( BY by=atomic )? # varyingLoopLine
    | WHILE anyExpression # whileLoopLine
    | UNTIL anyExpression # untilLoopLine
    | statement # statementLoopLine
    ;

anyExpression
    : arithmeticExpression
    | booleanExpression
    | atomicExpression;

atomicExpression : atomic;

arithmeticExpression
    : arithmeticExpression ARITHMETIC_OPERATOR arithmeticExpression # operatorArithmeticExpression
    | atomicExpression # atomicArithmeticExpression
    ;

booleanExpression
    : TRUE # trueExpression
    | FALSE # falseExpression
    | left=arithmeticExpression operator=COMPARISON_OPERATOR right=arithmeticExpression # comparatorBooleanExpression
    | NOT expression=booleanExpression # notExpression
    | left=booleanExpression BOOLEAN_OPERATOR right=booleanExpression # booleanBooleanExpression
    ;

identifier
    : IDENTIFIER # singularIdentifier
    | IDENTIFIER PAREN_OPEN index=LITERAL_NUMBER PAREN_CLOSE # arrayIdentifier
    ;

literal : LITERAL_STRING | LITERAL_NUMBER;

atomic
    : LITERAL_STRING #literalStringAtomic
    | LITERAL_NUMBER #literalNumberAtomic
    | TRUE #literalTrueAtomic
    | FALSE #literalFalseAtomic
    | identifier #variableAtomic
    ;
