// Generated from C:/Users/omer_/IdeaProjects/BabyCobolRecognizer/src/grammars/22goingmerry/BabyCobol.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link BabyCobolParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface BabyCobolVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(BabyCobolParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#identification_division}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdentification_division(BabyCobolParser.Identification_divisionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#identificationEntry}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdentificationEntry(BabyCobolParser.IdentificationEntryContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#data_division}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitData_division(BabyCobolParser.Data_divisionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#line}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLine(BabyCobolParser.LineContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#record}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRecord(BabyCobolParser.RecordContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#field}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitField(BabyCobolParser.FieldContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#identifiers}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdentifiers(BabyCobolParser.IdentifiersContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#procedure_division}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProcedure_division(BabyCobolParser.Procedure_divisionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#paragraph}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParagraph(BabyCobolParser.ParagraphContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#statements}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatements(BabyCobolParser.StatementsContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#using}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUsing(BabyCobolParser.UsingContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(BabyCobolParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#accept_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAccept_statement(BabyCobolParser.Accept_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#add_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdd_statement(BabyCobolParser.Add_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#alter_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAlter_statement(BabyCobolParser.Alter_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#call_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCall_statement(BabyCobolParser.Call_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#copy_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopy_statement(BabyCobolParser.Copy_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#display_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisplay_statement(BabyCobolParser.Display_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#divide_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDivide_statement(BabyCobolParser.Divide_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#go_to_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGo_to_statement(BabyCobolParser.Go_to_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#evaluate_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEvaluate_statement(BabyCobolParser.Evaluate_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#if_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIf_statement(BabyCobolParser.If_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#loop_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLoop_statement(BabyCobolParser.Loop_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#move_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMove_statement(BabyCobolParser.Move_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#multiply_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultiply_statement(BabyCobolParser.Multiply_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#next_sentence_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNext_sentence_statement(BabyCobolParser.Next_sentence_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#perform_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPerform_statement(BabyCobolParser.Perform_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#signal_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSignal_statement(BabyCobolParser.Signal_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#stop_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStop_statement(BabyCobolParser.Stop_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#subtract_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSubtract_statement(BabyCobolParser.Subtract_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#call_types}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCall_types(BabyCobolParser.Call_typesContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#display_types}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisplay_types(BabyCobolParser.Display_typesContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#move_types}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMove_types(BabyCobolParser.Move_typesContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#loop_types}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLoop_types(BabyCobolParser.Loop_typesContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#evaluate_WhenClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEvaluate_WhenClause(BabyCobolParser.Evaluate_WhenClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#anyExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAnyExpression(BabyCobolParser.AnyExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#atomic}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAtomic(BabyCobolParser.AtomicContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#booleanExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBooleanExpression(BabyCobolParser.BooleanExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#booleanTerm}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBooleanTerm(BabyCobolParser.BooleanTermContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#booleanFactor}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBooleanFactor(BabyCobolParser.BooleanFactorContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#booleanValue}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBooleanValue(BabyCobolParser.BooleanValueContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#comparisonExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComparisonExpression(BabyCobolParser.ComparisonExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#additiveExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdditiveExpression(BabyCobolParser.AdditiveExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultiplicativeExpression(BabyCobolParser.MultiplicativeExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#primaryExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimaryExpression(BabyCobolParser.PrimaryExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(BabyCobolParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#factor}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFactor(BabyCobolParser.FactorContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#int}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInt(BabyCobolParser.IntContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#literal}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLiteral(BabyCobolParser.LiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#anyOperation}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAnyOperation(BabyCobolParser.AnyOperationContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#comparisonOp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComparisonOp(BabyCobolParser.ComparisonOpContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#arithmeticOp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithmeticOp(BabyCobolParser.ArithmeticOpContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#logicalOp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogicalOp(BabyCobolParser.LogicalOpContext ctx);
	/**
	 * Visit a parse tree produced by {@link BabyCobolParser#booleanOp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBooleanOp(BabyCobolParser.BooleanOpContext ctx);
}