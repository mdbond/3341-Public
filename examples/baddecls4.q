Q main(mutable int arg) {

int x = 5;
mutable int arg = 22 * x; /* x hasn't been defined yet */
return x;
}
