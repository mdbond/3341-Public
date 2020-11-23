Q main(int arg) {
    return max(randomList(arg));
}

int max(Ref list) {
  int first = (int)left(list);
  Q rest = right(list);
  int max_of_rest = max((Ref)rest);
  if (first > max_of_rest) {
    return first;
  }
  return max_of_rest;
}


Ref randomList(int length) {
  if (length == 0) {
    return nil;
  }
  return randomInt(1000) . randomList(length - 1);
}
