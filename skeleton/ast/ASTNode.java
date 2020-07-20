package ast;

public abstract class ASTNode {

    final Location loc;

    ASTNode(Location loc) {
        this.loc = loc;
    }
}
