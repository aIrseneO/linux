/*
* Copyright (c) 2020 Arsene Temfack
*
* SPDX-License-Identifier: MIT
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#ifndef TIME
# define TIME 10
#endif

//gcc -D TIME=10 -Wall -Wextra -Werror -o wastemem wastemem.c
//./wastemem 5000

/*
*  Given a number a number of Megabytes X (argument passed to the program),
*  this program gradually allocotes up to X Megabytes and set them to zero.
*  Allocations are done in TIME secondes.
*/
int main(int argc, char **argv) {
	int		i, j;
	size_t	allocatePerSec;
	char	*allocatedAddr[TIME];

	if (argc != 2) {
		printf("Usage: wastmemory memory_size(MB)\n");
		return (1);
	}
	if (!strcmp(argv[1], "--help")) {
		printf("Usage: wastememory memory_size(MB)\n	--help  display this help and exit\nGiven a number of Megabytes X (argument passed to the program), this program gradually allocotes up to X Megabytes and set them to zero. Allocations are done in TIME secondes.");
		return (0);
	}
	allocatePerSec = atoi(argv[1]) / TIME;
	for (i = 0; i < TIME; i++) {
		if (!(allocatedAddr[i] = (char *)malloc(allocatePerSec * 1000000))) {
			printf("Failed after %i allocations of %luM, total: %luM"
					, i, allocatePerSec, i * allocatePerSec);
			break;
		}
		printf("%d - %luM allocated...\n", i, allocatePerSec);
		bzero(allocatedAddr[i], allocatePerSec * 1000000);
		sleep(1);
	}
	printf("Total of %luM allocated\n", i * allocatePerSec);
	printf("Deallocation...\n");
	for (j = 0; j < i; j++) {
		free(allocatedAddr[j]);
		printf("%d - %luM free...\n", j, allocatePerSec);
		sleep(1);
	}
	printf("Total of %luM free\n", j * allocatePerSec);
	return (0);
}
