
public class ComputerPlayer extends Player {

	final boolean verbose;

	final private Solver solver;
	
	public ComputerPlayer(Board board, Solver solver, boolean verbose) {
		super(board);
		this.solver = solver;
		this.verbose = verbose;
		init();
	}
	
	void init() {
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {
				solver.toSolver().println("(declare-const hasMine_" + row + "_" + col + " Int)");
			}
		}
		// Each cell must be 0 or 1 (must have 0 or 1 mines, essentially)
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {
				solver.toSolver().println("(assert (<= 0 hasMine_" + row + "_" + col + " 1))");
			}
		}
		// Specify total number of mines
		solver.toSolver().print("(assert (= (+");
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {
				solver.toSolver().print(" hasMine_" + row + "_" + col);
			}
		}
		solver.toSolver().println(") " + Board.MINES + "))");
	}


	@Override
	public int[] computePlay() {
		// Specify revealed info
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {
				if (board.getRevealed(row, col) != Board.NOT_REVEALED) {
					solver.toSolver().println("(assert (= hasMine_" + row + "_" + col + " 0))");
					solver.toSolver().print("(assert (= (+");
					for (int r = row - 1; r <= row + 1; r++) {
						for (int c = col - 1; c <= col + 1; c++) {
							if (r >= 0 && r < Board.ROWS && c >= 0 && c < Board.COLS) {
								if (!(r == row && c == col)) {
									solver.toSolver().print(" hasMine_" + r + "_" + c);
								}
							}
						}
					}
					solver.toSolver().print(") " + board.getRevealed(row, col) + "))");
				}
			}
		}
		// Now try each available play (to an unrevealed cell)
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {		
				if (board.getRevealed(row, col) == Board.NOT_REVEALED) {
					solver.toSolver().println("(push)");
					solver.toSolver().println("(assert (= hasMine_" + row + "_" + col + " 1))");
					solver.toSolver().println("(check-sat)");
					solver.toSolver().println("(pop)");
					solver.toSolver().flush();
					String line = solver.readLine();
					assert line.equals("sat") || line.equals("unsat");
					if (line.equals("unsat")) {
						//solver.toSolver().println("(exit)");
						//solver.toSolver().flush();
						if (verbose) {
							System.out.println("(" + row + ", " + col + ") definitely doesn't have a mine");
						}
						return new int[] { row, col };
					}
				}
			}
		}
		
		// No guaranteed move, so try a cell that we don't definitely know has a mine
		
		// Compute known mines
		boolean[][] mustHaveMine = new boolean[Board.ROWS][Board.COLS];
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {		
				if (board.getRevealed(row, col) == Board.NOT_REVEALED) {
					solver.toSolver().println("(push)");
					solver.toSolver().println("(assert (= hasMine_" + row + "_" + col + " 0))");
					solver.toSolver().println("(check-sat)");
					solver.toSolver().println("(pop)");
					solver.toSolver().flush();
					String line = solver.readLine();
					assert line.equals("sat") || line.equals("unsat");
					if (line.equals("unsat")) {
						mustHaveMine[row][col] = true;
					}
				}
			}
		}
		//solver.toSolver().println("(exit)");
		//solver.toSolver().println("(flush)");
		
		// Compute adjusted revealed numbers excluding known mines
		int[][] revealedAdjusted = new int[Board.ROWS][Board.COLS];
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {		
				if (board.getRevealed(row, col) != Board.NOT_REVEALED) {
					assert !mustHaveMine[row][col];
					int neighboringMines = 0;
					for (int r = row - 1; r <= row + 1; r++) {
						for (int c = col - 1; c <= col + 1; c++) {
							if (r >= 0 && r < Board.ROWS && c >= 0 && c < Board.COLS) {
								if (mustHaveMine[r][c]) {
									neighboringMines++;
								}
							}
						}
					}
					revealedAdjusted[row][col] = board.getRevealed(row, col) - neighboringMines;
				}
			}
		}
		
		// Compute a likelihood score for each unrevealed cell
		int[] bestRowCol = new int[] { -1, -1 };
		double bestScore = Double.POSITIVE_INFINITY;
		for (int row = 0; row < Board.ROWS; row++) {
			for (int col = 0; col < Board.COLS; col++) {		
				if (board.getRevealed(row, col) == Board.NOT_REVEALED && !mustHaveMine[row][col]) {
					int sum = 0;
					int neighbors = 0;
					for (int r = row - 1; r <= row + 1; r++) {
						for (int c = col - 1; c <= col + 1; c++) {
							if (r >= 0 && r < Board.ROWS && c >= 0 && c < Board.COLS) {
								if (!(r == row && c == col)) {
									neighbors++;
									if (board.getRevealed(r, c) != Board.NOT_REVEALED) {
										sum += revealedAdjusted[r][c];
									}
								}
							}
						}
					}
					double likelihood = (double)sum / neighbors;
					int distFromCorner = Math.min(row, Board.ROWS - 1 - row) + Math.min(col,  Board.COLS - 1 - col);
					double score = likelihood * 1000 + distFromCorner; // weigh the neighbors more than the closeness to corner
					
					if (score < bestScore) {
						bestScore = score;
						bestRowCol[0] = row;
						bestRowCol[1] = col;
					}
				}
			}
		}
		if (verbose) {
			System.out.println("(" + bestRowCol[0] + ", " + bestRowCol[1] + ") may be safe; score is " + bestScore);
		}
		return bestRowCol;
	}

}
