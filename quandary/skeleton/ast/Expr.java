package ast;

public abstract class Expr extends ASTNode {

    Expr(Location loc) {
        super(loc);
    }

    abstract Object eval();
}
