int main (int arg){
    if (arg > 0 && (5 == 10)){ /* Result depends on first condition */
        return 10;
    }else {
        return -1;
    }
    return 0;
}