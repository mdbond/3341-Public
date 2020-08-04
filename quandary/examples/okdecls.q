Q main(mutable int arg) {

mutable int x = 5;
arg = 22 * x; /* x hasn't been defined yet */
return arg;
}
