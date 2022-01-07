/* Test memory management */
mutable Q main(int arg) {
  mutable Ref list = 2 . nil;
  list = addR(list, 3);
  list = addR(list, 5);
  list = addR(list, 7);
  list = addR(list, 11);
  list = addR(list, 13);
  list = addR(list, 17);
  list = addR(list, 19);
  list = addR(list, 23);
  return list;
}

Ref addR(Ref list, int elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  Q left = left(list);
  Ref right = (Ref)right(list);
  free list;
  return left . addR(right, elem);
}
