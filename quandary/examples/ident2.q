int main (int input){
    int x = int_const();
    return input; /* expr is an IDENT */
}

int int_const(){
    print 3; /* expr in an INSTCONST */
    return 1;
}