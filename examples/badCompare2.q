Q main(int arg) {
  int a = 3;
  Q b = 8 + a * 7;
  if (a < b) {
    Q c = b;
    return c;
  }
  return nil;
}
