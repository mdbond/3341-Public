mutable Q main(int arg) {
  Ref c = arg . (arg + 1);
  return left(c) . swapAndGetLeft(c) . left(c);
}

mutable Ref swap(Ref c) {
  Q tmp = left(c);
  setLeft(c, right(c));
  setRight(c, tmp);
  return c;
}

mutable Q swapAndGetLeft(Ref c) {
  swap(c);
  return left(c);
}  
