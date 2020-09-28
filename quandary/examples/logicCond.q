int main (int arg){
    if (arg > 0 && (5 != 10)){ /* Result depends on first condition */
        return arg;
    }else {
        return -arg * 238;
    }
    return 0;
}