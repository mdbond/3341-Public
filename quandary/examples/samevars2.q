int main(int s) { 
	return s(s);
}

int s(int s) { 
    if (s <= 1) 
        return s; 
    return s(s - 1) + s; 
}
