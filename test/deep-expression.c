#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stdio.h>

char *expressions[20] = {"(%s + %s)", "(%s - %s)", "(%s * %s)", "(%s / %s)"};

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

double frand()
{
	double f = rand();

	return f / RAND_MAX;
}

int main(int argc, char *argv[] )
{
	srand(time(NULL));

	if( argc <= 1 )
	{
		fprintf( stderr, "Need number of GOSUBs to make\n" );
		exit(-1);
	}

	int limit = atoi(argv[1]), i=1;
	while( i < limit+1 )
	{
		make_var(i-1);
		printf("%d %s=", i*2, var );

		char s1[2048], s2[2048], s3[2048], s4[2048];

		sprintf( s1, "%.3f", frand() * 100 );
		sprintf( s2, "%.3f", frand() * 100 );

		int j = frand()*10;
		s4[0] = 0;

		while (--j)
		{
			int k = frand()*4;

			if( k>3 ) k = 0;

			sprintf( s3, expressions[k], s1, s2 );

			if( strlen(s3) > 250 )
			{
				strcpy(s3, s4);
				break;
			}

			if( frand() > 0.5 )
			{
				strcpy( s1, s3);
				sprintf( s2, "%.3f", frand() * 100 );
			}
			else
			{
				sprintf( s1, "%.3f", frand() * 100 );
				strcpy( s2, s3);
			}

			strcpy(s4, s3 );
		}

		printf( "%s\n", s3 );

		char command[2048];
		sprintf( command, "echo \"scale = 2; %s\" | bc", s3 );
		FILE *fp = popen( command, "r" );

		char result[256];
		if( fp != NULL )
		{

			while (fgets(result, 256, fp) != NULL)
   			{
   			}

    		pclose(fp);
		}

		printf( "%d PRINT %s,%s", i*2+1, var,result );
		i++;
	}

	return 0;
}
