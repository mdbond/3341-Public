import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Sudoku {
	
	public static void main(String[] args) {

		Solver solver = new Solver();
		Board board = new Board();

		try {
			board.read();
		} catch (IOException ex) {
			throw new RuntimeException(ex);
		}
		board.print();

		try {
			BufferedReader br = new BufferedReader(new FileReader("preamble.smt"));
			String line;
			while ((line = br.readLine()) != null) {
				solver.toSolver().println(line);
			}
		} catch (IOException ex) {
			throw new RuntimeException(ex);
		}

		board.generateInstanceConstraints(solver.toSolver());
		solver.toSolver().println("(check-sat)");
		solver.toSolver().println("(get-model)");
		solver.toSolver().flush();

		board.applySolution(solver);

		board.print();
	}
}
