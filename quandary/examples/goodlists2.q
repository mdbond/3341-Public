
Q main(int arg) {
  Ref list = randomList(100);
  int max = max(list);
  return max;
}

Ref randomList(int length) {
  if (length == 0) {
    return nil;
  }
  if (length == 50) {
      return 100 . randomList(length - 1);
  }
  return randomInt(100) . randomList(length - 1);
}

int max(Ref list) {
  int first = (int)left(list);
  Ref rest = (Ref)right(list);
  if (isNil(rest) != 0) {
    return first;
  }
  int max_of_rest = max(rest);
  if (first > max_of_rest) {
    return first;
  }
  return max_of_rest;
}
