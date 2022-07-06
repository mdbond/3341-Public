import java.io.IOException;
import java.io.PrintStream;
import java.util.Random;
import java.util.Scanner;

public class Board {

	public static final int ROWS = 9;
	public static final int COLS = 9;

	private final int[][] board;
	
	Board() {
		board = new int[ROWS][COLS];
	}
	
	void generateInstanceConstraints(PrintStream ps) {
		for (int row = 0; row < ROWS; row++) {
			for (int col = 0; col < COLS; col++) {
				int value = board[row][col];
				if (value > 0) {
					ps.println("(assert (= (grid " + (row + 1) + " " + (col + 1) + ") " + value + "))");
				}
			}
		}
	}

	void applySolution(Solver solver) {
		String line;
		while ((line = solver.readLine()) != null && !line.equals(")")) {
			//System.out.println(line);
			outer:
			for (int row = 0; row < ROWS; row++) {
				for (int col = 0; col < COLS; col++) {
					if (board[row][col] < 1) {
						for (int value = 1; value <= 9; value++) {
							//(ite (and (= x!1 5) (= x!2 5)) 3
							if (line.contains("(= x!1 " + (row + 1) + ") (= x!2 " + (col + 1) + ")) " + value)) {
								board[row][col] = value;
								continue outer;
							}
						}
					}
				}
			}
		}
	}

	void read() throws IOException {
		for (int row = 0; row < ROWS; row++) {
			for (int col = 0; col < COLS; col++) {
				int value;
				do {
					char c = (char)System.in.read();
					value = (int)(c - '0');
					board[row][col] = value;
				} while (value < 0 || value > 9);
			}
		}
	}

	void print() {
		System.out.println();
		for (int row = 0; row < ROWS; row++) {
			for (int col = 0; col < COLS; col++) {
				int value = board[row][col];
				System.out.print((value < 1 ? "?" : value) + " ");
			}
			System.out.println();
		}
		System.out.println();
	}
	
}
