#include <stdio.h>
#include <unistd.h>
#include <string.h>

extern int ft_write(int fd, char *buf, size_t count);
extern int ft_strlen(char *buf);

int main()
{
	printf("Retorno ft_write: %i\n", ft_write(1, "Hello, World! :DDD\n", 19));
	printf("Retorno write: %li\n", write(1, "Hello, World! :DDD\n", 19));
	printf("ft_strlen: %i\n", ft_strlen("Hello, World! :DDD\n"));
	printf("strlen original: %li\n", strlen("Hello, World! :DDD\n"));
	return 0;
}