mutable Q main(int arg) {
  mutable Ref list = nil;
  list = add(list, 4);
  list = add(list, 3);
  list = add(list, 5);
  list = add(list, 42);
  return list;
}

/* mutating add */
mutable Ref add(Ref list, Q elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  mutable Ref curr = list;
  while (isNil(right(curr)) == 0) {
    curr = (Ref)right(curr);
  }
  setRight(curr, elem . nil);
}

/* non-mutating add */
Ref addR(Ref list, int elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  return left(list) .
         addR((Ref)right(list), elem);
}
