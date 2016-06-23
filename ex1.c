#include <stdio.h>
#include <stdlib.h>
#include <string.h>

main(){
	int loop = 1, integerToPrint, input;


	while(loop){
		scanf("%d", input);

		integerToPrint = fibonacci(input);

		if(integerToPrint == 0){
			loop = 0;
		}

		printf("%d\n", integerToPrint);
	}
}

int fibonacci(int n){
	if(n == 0){
		return 0;
	}
	else if(n == 1){
		return 1;
	}
	else{
		return fibonacci(n-1) + fibonacci(n-2);
	}
}