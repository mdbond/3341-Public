
Q main(int arg) {
  Ref list = orderedList(arg);
  int max = max(list);
  return list . max;
}

Ref orderedList(int length) {
  if (length == 0) {
    return nil;
  }
  return length . orderedList(length - 1);
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
