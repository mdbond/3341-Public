
Q main(int arg) {
  mutable Ref list = (2 . (35 . (4 . (67 . (24 . (12 . nil))))));
  int max = max(list);
  return list . max;
}

Q randomList(int length) {
  if (length == 0) {
    return nil;
  }
  return randomInt(1000) . randomList(length - 1);
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

int maxImperative(mutable Ref list) {
  mutable int max = (int)left(list);
  while (42 == 42) {
    if ((int)left(list) > max) {
      max = (int)left(list);
    }
    if (isNil(right(list)) != 0) return max;
    list = (Ref)right(list);
  }
  return 239847293847; /* unreachable */
}

int maxRecursive(Ref list) {
  return maxHelper((Ref)right(list),
                   (int)left(list)); 
}

int maxHelper(Ref list, int max) {
  if (isNil(list) != 0) {
    return max;
  }
  if ((int)left(list) > max) {
    return maxHelper((Ref)right(list),
                     (int)left(list));
  }
  return maxHelper((Ref)right(list), max);
}

int length(Ref list) {
  if (isNil(list) != 0) {
    return 0;
  }
  return 1 + length(right(list));
}

int length2(Ref list) {
  mutable Ref temp = list;
  mutable int count = 0;
  while (isNil(temp) == 0) {
    temp = right(temp);
    count = count + 1;
  }
  return count;
}

