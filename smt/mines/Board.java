import java.util.Random;

public class Board {

	public static final int ROWS = 18;
	public static final int COLS = 18;
	public static final int MINES = 50;

	public static final int NOT_REVEALED = -1;
	
	private final boolean[][] board;
	private final int[][] revealed;
	
	int numPlays;
	int numRevealed;
	private final Random rand;

	Board() {
		board = new boolean[ROWS][COLS];
		revealed = new int[ROWS][COLS];
		for (int row = 0; row < ROWS; row++) {
			for (int col = 0; col < COLS; col++) {
				revealed[row][col] = NOT_REVEALED;
			}
		}
		rand = new Random();
	}

	int getRevealed(int row, int col) {
		return revealed[row][col];
	}
	
	void play(int row, int col) throws MineException {
		if (numPlays == 0) {
			initBoard(row, col);
		}
		assert revealed[row][col] == NOT_REVEALED;
		if (board[row][col]) {
			throw new MineException();
		}
		reveal(row, col);
		numPlays++;
	}

	void initBoard(int playedRow, int playedCol) {
		int minesToPlace = MINES;
		while (minesToPlace > 0) {
			int row = rand.nextInt(ROWS);
			int col = rand.nextInt(COLS);
			if (!(row == playedRow && col == playedCol) && !board[row][col]) {
				board[row][col] = true;
				minesToPlace--;
			}
		}
	}
	
	void reveal(int row, int col) {
		int neighbors = neighboringMines(row, col);
		assert revealed[row][col] == NOT_REVEALED;
		revealed[row][col] = neighbors;
		numRevealed++;
		if (neighbors == 0) {
			for (int r = row - 1; r <= row + 1; r++) {
				for (int c = col - 1; c <= col + 1; c++) {
					if (r >= 0 && r < ROWS && c >= 0 && c < COLS) {
						if (revealed[r][c] == NOT_REVEALED) {
							reveal(r, c);
						}
					}
				}
			}
		}
	}
	
	int neighboringMines(int row, int col) {
		assert !board[row][col]; // row, col has no mine
		int neighbors = 0;
		for (int r = row - 1; r <= row + 1; r++) {
			for (int c = col - 1; c <= col + 1; c++) {
				if (r >= 0 && r < ROWS && c >= 0 && c < COLS) {
					if (board[r][c]) {
						neighbors++;
					}
				}
			}
		}
		return neighbors;
	}
	
	void print() {
		System.out.println();
		for (int row = 0; row < ROWS; row++) {
			for (int col = 0; col < COLS; col++) {
				System.out.print(revealed[row][col] == NOT_REVEALED ? "  " : revealed[row][col] + " ");
			}
			System.out.println();
		}
		System.out.println();
	}
	
	boolean isComplete() {
		return numRevealed + MINES == ROWS * COLS;
	}

}
