#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[] )
{
	if( argc <= 1 )
	{
		fprintf( stderr, "Need number of GOSUBs to make\n" );
		exit(-1);
	}

	printf("1 GOSUB 4\n");
	printf("2 PRINT \"END\"\n");
	printf("3 END\n");

	int i;

	int limit = atoi(argv[1]);
	for( i=0; i<limit*2; i += 2 )
	{
		printf("%d PRINT \"%d \";MEM:GOSUB %d\n", i+4, i/2, i+6 );
		printf("%d PRINT \"%d \";MEM:RETURN\n", i+5, i/2 );
	}

	printf("%d RETURN\n", i+4 );
}
