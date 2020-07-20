int foo(int i, Q q, Ref c) {
  int i1 = i;
  int i2 = (int)q;
  int i3 = (int)(Q)c;

  Q q1 = i;
  Q q2 = q;
  Q q3 = c;

  Ref c1 = (Ref)(Q)i;
  Ref c2 = (Ref)q;
  Ref c3 = c;

  return 0;
}

int main(int arg) {
  return foo (arg, arg, arg . arg);
}
