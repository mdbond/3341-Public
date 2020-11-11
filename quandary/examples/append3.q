mutable Q main(int arg) {
  Ref list = 8 . nil;
  add(list, 4);
  add(list, 3);
  add(list, 5);
  add(list, 42);
  mutable Ref list2 = nil;
  list2 = addR(list2, 8);
  list2 = addR(list2, 4);
  list2 = addR(list2, 3);
  list2 = addR(list2, 5);
  list2 = addR(list2, 42);
  return list . list2;
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
  return list;
}

/* non-mutating add */
Ref addR(Ref list, int elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  return left(list) .
         addR((Ref)right(list), elem);
}
