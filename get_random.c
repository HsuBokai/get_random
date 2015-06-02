#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h> //for open
#include <unistd.h> //for close

int main (int argc, char *argv[])
{
		if(argc < 2){
			printf("Usage: %s <length>\n", argv[0]);
			return -1;
		}
		int length = atoi(argv[1]);
		
		int fd = open("/dev/urandom", O_RDONLY);
		if(fd < 0)
			return -1;

		unsigned char c;
		int i;
		for(i=0; i<length; ++i)
			if(read(fd, &c, 1)>0)
				printf("%02X",c);
		
		if(close(fd)<0)
			return -1;
		return 0;
}
