mutable Q main(int arg) {
  Ref list = create(arg);
  return rev(list);
}

Ref create(int length) {
  if (length == 0) {
    return nil;
  }
  return length . create(length - 1);
}

mutable Ref rev(Ref list) {
	mutable Ref curr = right(list) . left(list);
	if (isAtom(right(curr)) == 0)
		setRight(curr, rev((Ref)right(curr)));
	if (isAtom(left(curr)) == 0)
		setLeft(curr, rev((Ref)left(curr)));
	return curr;
}
