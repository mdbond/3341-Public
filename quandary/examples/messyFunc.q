int main(int arg){
    int x = 12;
    return func1(arg) + func2(arg) * func3(arg) - func4(arg, x) + func4(x, func2(func1(arg)));
}

int func1(int a){
    return a * a + a;
}

int func2(int a){
    return a - a * a;
}

int func3(int a){
    return 15;
}

int func4(int a, int b){
    return a * b;
}