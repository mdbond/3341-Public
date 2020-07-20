package ast;

public class Location {
    final int line;
    final int column;

    public Location(int line, int column) {
        this.line = line;
        this.column = column;
    }

    @Override
    public String toString() {
        return line + ":" + column;
    }
}
