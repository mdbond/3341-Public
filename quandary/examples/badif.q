int main (int arg){
    return bad_if();
}

int bad_if(){
    if 1 != 2) { /* Missing paren */
        return 3;
    }
    return 0;
}