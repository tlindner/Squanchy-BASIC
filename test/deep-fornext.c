#include <stdio.h>
#include <stdlib.h>

char var[3];

void make_var( int i )
{
    /* Reserved two letter words */
    // AS
    // GO
    // IF
    // OR
    // ON

	if( i >= (('A'-'A') * 26) + 'S'-'A' ) i++;
	if( i >= (('G'-'A') * 26) + 'O'-'A' ) i++;
	if( i >= (('I'-'A') * 26) + 'F'-'A' ) i++;
	if( i >= (('O'-'A') * 26) + 'R'-'A' ) i++;
	if( i >= (('O'-'A') * 26) + 'N'-'A' ) i++;

	var[2] = 0;
	var[1] = 'A' + (i % 26);
	var[0] = 'A' + (i / 26);
}

int main(int argc, char *argv[] )
{
	if( argc <= 1 )
	{
		fprintf( stderr, "Need number of GOSUBs to make\n" );
		exit(-1);
	}

	make_var(0);
	printf("1 FOR %s = 0 TO 1\n", var);
	printf("2 GOSUB 6\n");
	printf("3 NEXT %s\n", var);
	printf("4 PRINT \"END\"\n");
	printf("5 END\n");

	int i;

	int limit = atoi(argv[1]);
	for( i=1; i<limit; i++ )
	{
		make_var(i);
		printf("%d FOR %s = 0 TO 1\n", i*4+2, var);
		printf("%d PRINT \"%d \";%s;MEM:GOSUB %d\n", i*4+3, i, var, i*4+6 );
		printf("%d NEXT %s\n", i*4+4, var );
		printf("%d PRINT \"%d DONE\";MEM:RETURN\n", i*4+5, i );
	}

	printf("%d RETURN\n", i*4+2 );

	return 0;
}
