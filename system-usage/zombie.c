/*
* Copyright (c) 2020 Arsene Temfack
*
* SPDX-License-Identifier: MIT
*/

/*
*  This program is made to observe a process when it's at its zombie state
*  for the amount of time given as input, after that time its state is inquired
*  by its father process and it's terminated properly
*/

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main(int argc, char **argv) {
	pid_t zombie;
	if (argc != 2) {
		printf("Usage: %s time(in sec)\n", argv[0]);
		return 1;
	}
	if ((zombie = fork()) == -1) {
		printf("Couldn't fork\n");
		return 1;
	}
	if (zombie == 0)
		exit(0);
	printf("Zombie PID: %d\n", zombie);
	printf("Check state with `ps`: ps -elf | grep %d\n", zombie);
	sleep(atoi(argv[1]));
	wait(NULL);
	return 0;
}
