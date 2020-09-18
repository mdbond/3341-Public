
int factR(int n) {
  if (n <= 1)
    return 1;
  return factR(n - 1) * n;
}

int main(int arg) {
  return factR(arg);
}
