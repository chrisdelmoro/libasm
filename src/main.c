#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

extern int ft_write(int fd, char *buf, size_t nbyte);
extern int ft_strlen(char *buf);
extern char* ft_strdup(char *s);
extern int ft_strcmp(const char *s1, const char *s2);
extern char* ft_strcpy(char *restrict dst, const char *src);
extern size_t ft_read(int fd, void *buf, size_t nbyte);

int main()
{
	char	*new_str;
	int		ret_value;

	/*ft_strlen*/
	printf("ft_strlen tests:\n");
	printf("ft_strlen for \"\": %i\n", ft_strlen(""));
	printf("ft_strlen for \"123\": %i\n", ft_strlen("123"));
	printf("\n");

	/*ft_strcpy*/
	printf("ft_strcpy tests:\n");
	new_str = (char *) malloc(sizeof(char) * strlen("") + 1);
	printf("ft_strcpy for \"\": %s\n", ft_strcpy(new_str, ""));
	free(new_str);
	new_str = (char *) malloc(sizeof(char) * strlen("Batata") + 1);
	printf("ft_strcpy for \"Batata\": %s\n", ft_strcpy(new_str, "Batata"));
	free(new_str);
	printf("\n");

	/*ft_strcmp*/
	printf("ft_strcmp tests:\n");
	printf("ft_strcmp for \"\" and \"\": %i / expected: 0\n", ft_strcmp("", ""));
	printf("ft_strcmp for \"Batata\" and \"Batata\": %i / expected: 0\n", ft_strcmp("Batata", "Batata"));
	printf("ft_strcmp for \"Batata\" and \"batata\": %i / expected: <0\n", ft_strcmp("Batata", "batata"));
	printf("ft_strcmp for \"Batata\" and \"BaTata\": %i / expected: >0\n", ft_strcmp("Batata", "BaTata"));
	printf("\n");

	/*ft_write*/
	printf("ft_write tests:\n");
	printf("ft_write for \"Batata\", fd=1, nbyte=3 : ");
	sleep(1);
	ret_value = ft_write(1, "Batata", 3);
	printf(" - expected: \"Bat\" - return value: %i\n", ret_value);
	printf("\n");

	/*ft_read*/


	/*ft_strdup*/
	printf("ft_strdup tests:\n");
	new_str = ft_strdup("");
	printf("ft_strdup for \"\": %s\n", new_str);
	printf("strcmp of both strings: %i\n", strcmp("", new_str));
	free(new_str);
	new_str = ft_strdup("1");
	printf("ft_strdup for \"1\": %s\n", new_str);
	printf("strcmp of both strings: %i\n", strcmp("1", new_str));
	free(new_str);
	new_str = ft_strdup("Batata Batata");
	printf("ft_strdup for \"Batata Batata\": %s\n", new_str);
	printf("strcmp of both strings: %i\n", strcmp("Batata Batata", new_str));
	free(new_str);
	return 0;
}