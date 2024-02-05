package gen;// Generated from C:/Users/omer_/IdeaProjects/BabyCobolRecognizer/src/grammars/22goingmerry/BabyCobol.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link BabyCobolParser}.
 */
public interface BabyCobolListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(BabyCobolParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(BabyCobolParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#identification_division}.
	 * @param ctx the parse tree
	 */
	void enterIdentification_division(BabyCobolParser.Identification_divisionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#identification_division}.
	 * @param ctx the parse tree
	 */
	void exitIdentification_division(BabyCobolParser.Identification_divisionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#identificationEntry}.
	 * @param ctx the parse tree
	 */
	void enterIdentificationEntry(BabyCobolParser.IdentificationEntryContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#identificationEntry}.
	 * @param ctx the parse tree
	 */
	void exitIdentificationEntry(BabyCobolParser.IdentificationEntryContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#data_division}.
	 * @param ctx the parse tree
	 */
	void enterData_division(BabyCobolParser.Data_divisionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#data_division}.
	 * @param ctx the parse tree
	 */
	void exitData_division(BabyCobolParser.Data_divisionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#line}.
	 * @param ctx the parse tree
	 */
	void enterLine(BabyCobolParser.LineContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#line}.
	 * @param ctx the parse tree
	 */
	void exitLine(BabyCobolParser.LineContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#record}.
	 * @param ctx the parse tree
	 */
	void enterRecord(BabyCobolParser.RecordContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#record}.
	 * @param ctx the parse tree
	 */
	void exitRecord(BabyCobolParser.RecordContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#field}.
	 * @param ctx the parse tree
	 */
	void enterField(BabyCobolParser.FieldContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#field}.
	 * @param ctx the parse tree
	 */
	void exitField(BabyCobolParser.FieldContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#representation}.
	 * @param ctx the parse tree
	 */
	void enterRepresentation(BabyCobolParser.RepresentationContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#representation}.
	 * @param ctx the parse tree
	 */
	void exitRepresentation(BabyCobolParser.RepresentationContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#identifiers}.
	 * @param ctx the parse tree
	 */
	void enterIdentifiers(BabyCobolParser.IdentifiersContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#identifiers}.
	 * @param ctx the parse tree
	 */
	void exitIdentifiers(BabyCobolParser.IdentifiersContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#procedure_division}.
	 * @param ctx the parse tree
	 */
	void enterProcedure_division(BabyCobolParser.Procedure_divisionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#procedure_division}.
	 * @param ctx the parse tree
	 */
	void exitProcedure_division(BabyCobolParser.Procedure_divisionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#paragraph}.
	 * @param ctx the parse tree
	 */
	void enterParagraph(BabyCobolParser.ParagraphContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#paragraph}.
	 * @param ctx the parse tree
	 */
	void exitParagraph(BabyCobolParser.ParagraphContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#statements}.
	 * @param ctx the parse tree
	 */
	void enterStatements(BabyCobolParser.StatementsContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#statements}.
	 * @param ctx the parse tree
	 */
	void exitStatements(BabyCobolParser.StatementsContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#using}.
	 * @param ctx the parse tree
	 */
	void enterUsing(BabyCobolParser.UsingContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#using}.
	 * @param ctx the parse tree
	 */
	void exitUsing(BabyCobolParser.UsingContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(BabyCobolParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(BabyCobolParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#accept_statement}.
	 * @param ctx the parse tree
	 */
	void enterAccept_statement(BabyCobolParser.Accept_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#accept_statement}.
	 * @param ctx the parse tree
	 */
	void exitAccept_statement(BabyCobolParser.Accept_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#add_statement}.
	 * @param ctx the parse tree
	 */
	void enterAdd_statement(BabyCobolParser.Add_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#add_statement}.
	 * @param ctx the parse tree
	 */
	void exitAdd_statement(BabyCobolParser.Add_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#alter_statement}.
	 * @param ctx the parse tree
	 */
	void enterAlter_statement(BabyCobolParser.Alter_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#alter_statement}.
	 * @param ctx the parse tree
	 */
	void exitAlter_statement(BabyCobolParser.Alter_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#call_statement}.
	 * @param ctx the parse tree
	 */
	void enterCall_statement(BabyCobolParser.Call_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#call_statement}.
	 * @param ctx the parse tree
	 */
	void exitCall_statement(BabyCobolParser.Call_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#copy_statement}.
	 * @param ctx the parse tree
	 */
	void enterCopy_statement(BabyCobolParser.Copy_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#copy_statement}.
	 * @param ctx the parse tree
	 */
	void exitCopy_statement(BabyCobolParser.Copy_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#display_statement}.
	 * @param ctx the parse tree
	 */
	void enterDisplay_statement(BabyCobolParser.Display_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#display_statement}.
	 * @param ctx the parse tree
	 */
	void exitDisplay_statement(BabyCobolParser.Display_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#divide_statement}.
	 * @param ctx the parse tree
	 */
	void enterDivide_statement(BabyCobolParser.Divide_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#divide_statement}.
	 * @param ctx the parse tree
	 */
	void exitDivide_statement(BabyCobolParser.Divide_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#go_to_statement}.
	 * @param ctx the parse tree
	 */
	void enterGo_to_statement(BabyCobolParser.Go_to_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#go_to_statement}.
	 * @param ctx the parse tree
	 */
	void exitGo_to_statement(BabyCobolParser.Go_to_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#evaluate_statement}.
	 * @param ctx the parse tree
	 */
	void enterEvaluate_statement(BabyCobolParser.Evaluate_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#evaluate_statement}.
	 * @param ctx the parse tree
	 */
	void exitEvaluate_statement(BabyCobolParser.Evaluate_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#if_statement}.
	 * @param ctx the parse tree
	 */
	void enterIf_statement(BabyCobolParser.If_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#if_statement}.
	 * @param ctx the parse tree
	 */
	void exitIf_statement(BabyCobolParser.If_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#loop_statement}.
	 * @param ctx the parse tree
	 */
	void enterLoop_statement(BabyCobolParser.Loop_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#loop_statement}.
	 * @param ctx the parse tree
	 */
	void exitLoop_statement(BabyCobolParser.Loop_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#move_statement}.
	 * @param ctx the parse tree
	 */
	void enterMove_statement(BabyCobolParser.Move_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#move_statement}.
	 * @param ctx the parse tree
	 */
	void exitMove_statement(BabyCobolParser.Move_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#multiply_statement}.
	 * @param ctx the parse tree
	 */
	void enterMultiply_statement(BabyCobolParser.Multiply_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#multiply_statement}.
	 * @param ctx the parse tree
	 */
	void exitMultiply_statement(BabyCobolParser.Multiply_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#next_sentence_statement}.
	 * @param ctx the parse tree
	 */
	void enterNext_sentence_statement(BabyCobolParser.Next_sentence_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#next_sentence_statement}.
	 * @param ctx the parse tree
	 */
	void exitNext_sentence_statement(BabyCobolParser.Next_sentence_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#perform_statement}.
	 * @param ctx the parse tree
	 */
	void enterPerform_statement(BabyCobolParser.Perform_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#perform_statement}.
	 * @param ctx the parse tree
	 */
	void exitPerform_statement(BabyCobolParser.Perform_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#signal_statement}.
	 * @param ctx the parse tree
	 */
	void enterSignal_statement(BabyCobolParser.Signal_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#signal_statement}.
	 * @param ctx the parse tree
	 */
	void exitSignal_statement(BabyCobolParser.Signal_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#stop_statement}.
	 * @param ctx the parse tree
	 */
	void enterStop_statement(BabyCobolParser.Stop_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#stop_statement}.
	 * @param ctx the parse tree
	 */
	void exitStop_statement(BabyCobolParser.Stop_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#subtract_statement}.
	 * @param ctx the parse tree
	 */
	void enterSubtract_statement(BabyCobolParser.Subtract_statementContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#subtract_statement}.
	 * @param ctx the parse tree
	 */
	void exitSubtract_statement(BabyCobolParser.Subtract_statementContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#call_types}.
	 * @param ctx the parse tree
	 */
	void enterCall_types(BabyCobolParser.Call_typesContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#call_types}.
	 * @param ctx the parse tree
	 */
	void exitCall_types(BabyCobolParser.Call_typesContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#display_types}.
	 * @param ctx the parse tree
	 */
	void enterDisplay_types(BabyCobolParser.Display_typesContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#display_types}.
	 * @param ctx the parse tree
	 */
	void exitDisplay_types(BabyCobolParser.Display_typesContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#move_types}.
	 * @param ctx the parse tree
	 */
	void enterMove_types(BabyCobolParser.Move_typesContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#move_types}.
	 * @param ctx the parse tree
	 */
	void exitMove_types(BabyCobolParser.Move_typesContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#loop_types}.
	 * @param ctx the parse tree
	 */
	void enterLoop_types(BabyCobolParser.Loop_typesContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#loop_types}.
	 * @param ctx the parse tree
	 */
	void exitLoop_types(BabyCobolParser.Loop_typesContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#evaluate_WhenClause}.
	 * @param ctx the parse tree
	 */
	void enterEvaluate_WhenClause(BabyCobolParser.Evaluate_WhenClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#evaluate_WhenClause}.
	 * @param ctx the parse tree
	 */
	void exitEvaluate_WhenClause(BabyCobolParser.Evaluate_WhenClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#anyExpression}.
	 * @param ctx the parse tree
	 */
	void enterAnyExpression(BabyCobolParser.AnyExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#anyExpression}.
	 * @param ctx the parse tree
	 */
	void exitAnyExpression(BabyCobolParser.AnyExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#arithmeticExpression}.
	 * @param ctx the parse tree
	 */
	void enterArithmeticExpression(BabyCobolParser.ArithmeticExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#arithmeticExpression}.
	 * @param ctx the parse tree
	 */
	void exitArithmeticExpression(BabyCobolParser.ArithmeticExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#arithmeticAtomic}.
	 * @param ctx the parse tree
	 */
	void enterArithmeticAtomic(BabyCobolParser.ArithmeticAtomicContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#arithmeticAtomic}.
	 * @param ctx the parse tree
	 */
	void exitArithmeticAtomic(BabyCobolParser.ArithmeticAtomicContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#stringExpression}.
	 * @param ctx the parse tree
	 */
	void enterStringExpression(BabyCobolParser.StringExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#stringExpression}.
	 * @param ctx the parse tree
	 */
	void exitStringExpression(BabyCobolParser.StringExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#stringAtomic}.
	 * @param ctx the parse tree
	 */
	void enterStringAtomic(BabyCobolParser.StringAtomicContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#stringAtomic}.
	 * @param ctx the parse tree
	 */
	void exitStringAtomic(BabyCobolParser.StringAtomicContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#atomic}.
	 * @param ctx the parse tree
	 */
	void enterAtomic(BabyCobolParser.AtomicContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#atomic}.
	 * @param ctx the parse tree
	 */
	void exitAtomic(BabyCobolParser.AtomicContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#booleanExpression}.
	 * @param ctx the parse tree
	 */
	void enterBooleanExpression(BabyCobolParser.BooleanExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#booleanExpression}.
	 * @param ctx the parse tree
	 */
	void exitBooleanExpression(BabyCobolParser.BooleanExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#booleanTerm}.
	 * @param ctx the parse tree
	 */
	void enterBooleanTerm(BabyCobolParser.BooleanTermContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#booleanTerm}.
	 * @param ctx the parse tree
	 */
	void exitBooleanTerm(BabyCobolParser.BooleanTermContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#booleanFactor}.
	 * @param ctx the parse tree
	 */
	void enterBooleanFactor(BabyCobolParser.BooleanFactorContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#booleanFactor}.
	 * @param ctx the parse tree
	 */
	void exitBooleanFactor(BabyCobolParser.BooleanFactorContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#booleanValue}.
	 * @param ctx the parse tree
	 */
	void enterBooleanValue(BabyCobolParser.BooleanValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#booleanValue}.
	 * @param ctx the parse tree
	 */
	void exitBooleanValue(BabyCobolParser.BooleanValueContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#comparisonExpression}.
	 * @param ctx the parse tree
	 */
	void enterComparisonExpression(BabyCobolParser.ComparisonExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#comparisonExpression}.
	 * @param ctx the parse tree
	 */
	void exitComparisonExpression(BabyCobolParser.ComparisonExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#additiveExpression}.
	 * @param ctx the parse tree
	 */
	void enterAdditiveExpression(BabyCobolParser.AdditiveExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#additiveExpression}.
	 * @param ctx the parse tree
	 */
	void exitAdditiveExpression(BabyCobolParser.AdditiveExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void enterMultiplicativeExpression(BabyCobolParser.MultiplicativeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void exitMultiplicativeExpression(BabyCobolParser.MultiplicativeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterPrimaryExpression(BabyCobolParser.PrimaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitPrimaryExpression(BabyCobolParser.PrimaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(BabyCobolParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(BabyCobolParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#factor}.
	 * @param ctx the parse tree
	 */
	void enterFactor(BabyCobolParser.FactorContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#factor}.
	 * @param ctx the parse tree
	 */
	void exitFactor(BabyCobolParser.FactorContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#int}.
	 * @param ctx the parse tree
	 */
	void enterInt(BabyCobolParser.IntContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#int}.
	 * @param ctx the parse tree
	 */
	void exitInt(BabyCobolParser.IntContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(BabyCobolParser.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(BabyCobolParser.LiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#anyOperation}.
	 * @param ctx the parse tree
	 */
	void enterAnyOperation(BabyCobolParser.AnyOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#anyOperation}.
	 * @param ctx the parse tree
	 */
	void exitAnyOperation(BabyCobolParser.AnyOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#comparisonOp}.
	 * @param ctx the parse tree
	 */
	void enterComparisonOp(BabyCobolParser.ComparisonOpContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#comparisonOp}.
	 * @param ctx the parse tree
	 */
	void exitComparisonOp(BabyCobolParser.ComparisonOpContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#arithmeticOp}.
	 * @param ctx the parse tree
	 */
	void enterArithmeticOp(BabyCobolParser.ArithmeticOpContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#arithmeticOp}.
	 * @param ctx the parse tree
	 */
	void exitArithmeticOp(BabyCobolParser.ArithmeticOpContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#logicalOp}.
	 * @param ctx the parse tree
	 */
	void enterLogicalOp(BabyCobolParser.LogicalOpContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#logicalOp}.
	 * @param ctx the parse tree
	 */
	void exitLogicalOp(BabyCobolParser.LogicalOpContext ctx);
	/**
	 * Enter a parse tree produced by {@link BabyCobolParser#booleanOp}.
	 * @param ctx the parse tree
	 */
	void enterBooleanOp(BabyCobolParser.BooleanOpContext ctx);
	/**
	 * Exit a parse tree produced by {@link BabyCobolParser#booleanOp}.
	 * @param ctx the parse tree
	 */
	void exitBooleanOp(BabyCobolParser.BooleanOpContext ctx);
}