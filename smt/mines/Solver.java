import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;

public class Solver {
	final private PrintStream toSolver;
	final private BufferedReader fromSolver;
	final private BufferedReader errorFromSolver;

	public Solver() {
		ProcessBuilder pb = new ProcessBuilder(new String[] { "z3",  "-smt2", "-in" });
		Process proc;
		try {
			proc = pb.start();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		toSolver = new PrintStream(proc.getOutputStream());
		fromSolver = new BufferedReader(new InputStreamReader(proc.getInputStream()));
		errorFromSolver = new BufferedReader(new InputStreamReader(proc.getErrorStream()));
	}
	
	PrintStream toSolver() {
		return toSolver;
	}
	
	String readLine() {
		try {
			String line = fromSolver.readLine();
			if (line == null) {
				line = errorFromSolver.readLine();
			}
			return line;
		} catch (IOException ex) {
			throw new RuntimeException(ex);
		}
	}
}
