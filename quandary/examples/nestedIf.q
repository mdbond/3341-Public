int main (int arg){
    if (40 < arg && arg <= 50){
        int x = 2;
        if (x ==2 ){
            int y = 3;
            if (y ==3){
                if (x == y){
                    return -29;
                } else {
                    return x;
                }
            }
        }
    } else if (31 <= arg && arg <= 40){
        int x = 2;
        if (x ==2 ){
            int y = 3;
            if (y ==3){
                if (x == y){
                    return -139;
                } else {
                    return y;
                }
            }
        }
    }  else if (20 < arg && arg <= 30){
        int x = 2;
        if (x ==2 ){
            int y = 3;
            if (y ==3){
                if (x == y){
                    return -100;
                }
            }
        }
    }  else if (10 <= arg && arg <= 20){
        int x = 2;
        if (x ==2 ){
            int y = 3;
            if (y ==3){
                if (x == y){
                    return -1000;
                } else if (x > y) {
                    return 5;
                } else {
                    return -y * -y;
                }
            }
        }
    } else {
        int x = 2;
        if (x ==2 ){
            int y = 3;
            if (y ==3){
                if (x == y){
                    return -1000;
                } else {
                    return x + y + arg;
                }
            }
        }
    }

    return arg * -1;
}