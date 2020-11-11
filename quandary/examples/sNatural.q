Q main(int arg) {
  Ref list = create(arg);
  return list;
}

Ref create(int length) {
  if (length == 0) {
    return nil;
  }
  return length . create(length - 1);
}

