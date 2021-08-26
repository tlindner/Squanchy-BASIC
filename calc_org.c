#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main( int argc, char *argv[] )
{
	if( argc < 2 )
	{
		fprintf( stderr, "%s needs filename to parse\n", argv[0] );
		exit( -1 );
	}

	FILE *file = fopen(argv[1], "r" );

	if( file == NULL )
	{
		fprintf( stderr, "%s could not open file %s\n", argv[0], argv[1] );
		exit( -1 );
	}

	char *line = NULL;
	size_t len = 0;
	ssize_t read;

	while ((read = getline(&line, &len, file)) != -1)
	{
		if( strncmp( "BASIC_END", line, 9) == 0 )
		{
			long value = strtol( line+read-5, NULL, 16 );
			printf( "%ld\n", 0xff00 - value - 1 );
			break;
		}
	}

	fclose( file );
	if (line) free( line );

	return 0;
}
