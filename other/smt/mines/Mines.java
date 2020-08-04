
public class Mines {
	
	public static void main(String[] args) {

		Solver solver = new Solver();
		
		/*int successes = 0;
		int failures = 0;
		for (int i = 0; i < 100; i++) {*/

			Board board = new Board();
			Player player = new ComputerPlayer(board, solver, true);

			board.print();

			try {
				while (!board.isComplete()) {
					int[] rowCol = player.computePlay();

					board.play(rowCol[0], rowCol[1]);

					board.print();
				}
				//successes++;
				System.out.println("Completed!");
			} catch (MineException e) {
				//failures++;
				System.out.println("Hit a mine!");
				//board.print();
				//return;
			}
		/*}
		System.out.println("Sucesses = " + successes);
		System.out.println("Failures = " + failures);*/
	}
	
}
