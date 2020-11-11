mutable Ref main(int arg) {
  Ref list = create(arg);
  return process(list, 2);
}

Ref create(int length) {
  if (length == 0) {
    return nil;
  }
  return length . create(length - 1);
}

mutable Ref process(mutable Ref l, mutable int h) {
     	h = h+1;	
	setRight(l , (h . nil));
	return l;
}
