class Rectangle {

	double width, height;

	Rectangle(double w, double h) { // void <init>(Rectangle this, double w, double h) {
		this.width = w;
		this.height = h;
	}

	double area() { // double area(Rectangle this) {
		return this.width * this.height;
	}

	void setHeight(double newHeight) { // void setHeight(Rectangle this, double newHeight) {
		this.height = newHeight;
	}

	static void main(String[] args) {
		Rectangle r1 = new Rectangle(2.0, 5.0);
		/* Rectangle t = alloc Rectangle;
		   Rectangle.<init>(t, 2.0, 5.0);
		   r1 = t; */
		Rectangle r2 = new Rectangle(5.0, 8.0);
		double a1 = r1.area(); // a1 = Rectangle.area(r1); 
		double a2 = r2.area();
		r1.setHeight(42.0);
	}
}

