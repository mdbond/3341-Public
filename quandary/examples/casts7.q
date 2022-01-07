int main(int arg){
    Q a = getRef(arg);
    Q b = getInt(arg);
    return (int) a + (int)b;
}

Ref getRef(int arg){
    return arg . arg;
}

int getInt(int arg){
    return arg + 1;
}
