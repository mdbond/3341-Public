package ast;

import java.io.PrintStream;

public class Program extends ASTNode {

    final Expr expr;

    public Program(Expr expr, Location loc) {
        super(loc);
        this.expr = expr;
    }

    public void println(PrintStream ps) {
        ps.println(expr);
    }

    public Object exec(long argument) {
        return expr.eval();
    }
}
