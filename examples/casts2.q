int foo(int i, Q q, Ref c) {
  int i1 = i;
  if (isAtom(q) != 0 && isNil(q) == 0) {
    int i2 = (int)q;
  }

  Q q1 = i;
  Q q2 = q;
  Q q3 = c;

  Ref c2 = (Ref)q;
  Ref c3 = c;

  return 0;
}

int main(int arg) {
  if (arg == 42) {
    return foo (arg, arg, arg . arg);
  }
  return foo (arg, arg . arg, arg . arg);
}
