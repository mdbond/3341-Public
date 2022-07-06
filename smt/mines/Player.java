
public abstract class Player {

	protected final Board board;

	public Player(Board board) {
		this.board = board;
	}
	
	public abstract int[] computePlay();
}
