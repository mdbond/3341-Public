int main (int arg){
    if (5 != 10 && arg > 0){  /* Result depends on second condition */
        return arg;
    }else {
        return -arg * 238;
    }
    return 0;
}