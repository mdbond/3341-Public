#include <iostream>
using namespace std;

void fib (int n, int *result) {
  int temp;
  if (n < 2) {
    *result = n;
  } else {
    fib(n-2, result);
    fib(n-1, &temp);
    /* OR:
    fib(n-2, &temp);
    fib(n-1, result);
    */
    *result += temp;
  }
}

int main() {
  int result;
  fib(2, &result);
  cout << result << endl;
  return 0;
}

