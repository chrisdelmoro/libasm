#include <stdio.h>
#include <unistd.h>

extern int ft_write(int fd, char *buf, size_t count);

int main()
{
	printf("Retorno ft_write: %i\n", ft_write(1, "Hello, World! :DDD\n", 19));
	printf("Retorno write: %li\n", write(1, "Hello, World! :DDD\n", 19));
	return 0;
}