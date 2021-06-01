/*
* Copyright (c) 2020 Arsene Temfack
*
* SPDX-License-Identifier: MIT
*/

/*
*	An example of a program that overflow the stack
*/

void stackOverflow(int a){
	stackOverflow(a);
}

int main(void){
	stackOverflow(42);
	return (1);
}
