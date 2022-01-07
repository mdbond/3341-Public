int main(int s) { 
	return recurSum(s);
}

int recurSum(int s) { 
    if (s <= 1) 
        return s; 
    return recurSum(s - 1) + s;
}
