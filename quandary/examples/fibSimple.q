int main (int arg){
    return fibRecursive(arg);
}

int fibRecursive(int n) {
  if (n < 2) return n;
  return fibRecursive(n - 1) + fibRecursive(n - 2);
}