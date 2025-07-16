/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vzurera- <vzurera-@student.42malaga.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/27 14:31:55 by vzurera-          #+#    #+#             */
/*   Updated: 2025/07/16 17:51:21 by vzurera-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma region "Includes"

	#include <stdio.h>
	#include <string.h>
	#include <unistd.h>
	#include <fcntl.h>
	#include <stdlib.h>
	#include <errno.h>
	
#pragma endregion

#pragma region "Colors"

	#define NC   	"\033[0m"		 						//	Default

	#define RD		"\033[0;31m"	 						//	Red
	#define G     	"\033[0;32m"	 						//	Green
	#define Y     	"\033[0;33m"	 						//	Yellow
	#define B     	"\033[0;34m"	 						//	Blue
	#define M     	"\033[0;35m"	 						//	Magenta
	#define C     	"\033[0;36m"	 						//	Cyan
	#define W     	"\033[0;37m"	 						//	White
	#define BR 		"\033[38;5;130m" 						//	Light Brown

	#define BRD		"\033[1;31m"	 						//	Bold Red
	#define BG     	"\033[1;32m"	 						//	Bold Green
	#define BY     	"\033[1;33m"	 						//	Bold Yellow
	#define BB     	"\033[1;34m"	 						//	Bold Blue
	#define BM     	"\033[1;35m"	 						//	Bold Magenta
	#define BCY     "\033[1;36m"	 						//	Bold Cyan
	#define BW     	"\033[1;37m"	 						//	Bold White

	#define UN 		"\033[4m"		 						//	Underline

#pragma endregion

#pragma region "Declarations"

	size_t	ft_strlen(const char *s);
	char	*ft_strcpy(char *dest, const char *src);
	int		ft_strcmp(const char *s1, const char *s2);
	char	*ft_strdup(const char *s);
	ssize_t	ft_write(int fd, const void *buf, size_t count);
	ssize_t	ft_read(int fd, void *buf, size_t count);

#pragma endregion

#pragma region "Methods"

	#pragma region "STRLEN"

		void strlen_test() {
			printf("\n  "UN BM"FT_STRLEN"NC"\n\n");

			const char *str1 = "Hello, world!";
			const char *str2 = "";
			const char *str3 = "Testing with a longer Heeeeeeelloooooo, world! to see if it works correctly";

			printf(C"Correct: "G"%zu"NC" \t\t\t"Y"ft_strlen"BR"("C"\"%s\""BR") "NC"= "G"%zu"NC"\n", strlen(str1), str1, ft_strlen(str1));
			printf(C"Correct: "G"%zu"NC" \t\t\t"Y"ft_strlen"BR"("C"\"%s\""BR") "NC"= "G"%zu"NC"\n", strlen(str2), str2, ft_strlen(str2));
			printf(C"Correct: "G"%zu"NC" \t\t\t"Y"ft_strlen"BR"("C"\"%s\""BR") "NC"= "G"%zu"NC"\n", strlen(str3), str3, ft_strlen(str3));
		}

	#pragma endregion

	#pragma region "STRCPY"

		void strcpy_test() {
			printf("\n  "UN BM"FT_STRCPY"NC"\n\n");

			char dest1[50];
			char dest2[50];
			const char *src1 = "Hello, world!";
			const char *src2 = "";

			printf(C"Correct: "G"\"%s\""NC" \t"Y"ft_strcpy"BR"(dest, "C"\"%s\""BR") "NC"= "G"\"%s\""NC"\n", strcpy(dest2, src1), src1, ft_strcpy(dest1, src1));
			printf(C"Correct: "G"\"%s\""NC" \t\t\t"Y"ft_strcpy"BR"(dest, "C"\"%s\""BR") "NC"= "G"\"%s\""NC"\n", strcpy(dest2, src2), src2, ft_strcpy(dest1, src2));
		}

	#pragma endregion

	#pragma region "STRCMP"

		void strcmp_test() {
			printf("\n  "UN BM"FT_STRCMP"NC"\n\n");

			const char *s1 = "Hello";
			const char *s2 = "Hello";
			const char *s3 = "World";
			const char *s4 = "";

			printf(C"Correct: "G"%d"NC" \t\t\t"Y"ft_strcmp"BR"("C"\"%s\""BR", "C"\"%s\""BR") "NC"= "G"%d"NC"\n", strcmp(s1, s2), s1, s2, ft_strcmp(s1, s2));		
			printf(C"Correct: "G"%d"NC" \t\t\t"Y"ft_strcmp"BR"("C"\"%s\""BR", "C"\"%s\""BR") "NC"= "G"%d"NC"\n", strcmp(s1, s3), s1, s3, ft_strcmp(s1, s3));		
			printf(C"Correct: "G"%d"NC" \t\t\t"Y"ft_strcmp"BR"("C"\"%s\""BR", "C"\"%s\""BR") "NC"= "G"%d"NC"\n", strcmp(s3, s1), s3, s1, ft_strcmp(s3, s1));		
			printf(C"Correct: "G"%d"NC" \t\t\t"Y"ft_strcmp"BR"("C"\"%s\""BR", "C"\"%s\""BR") "NC"= "G"%d"NC"\n", strcmp(s4, s1), s4, s1, ft_strcmp(s4, s1));
		}

	#pragma endregion

	#pragma region "STRDUP"

		void strdup_test() {
			printf("\n  "UN BM"FT_STRDUP"NC"\n\n");

			const char *str1 = "Hello, world!";
			const char *str2 = "";

			char *dup1 = ft_strdup(str1);
			char *dup2 = ft_strdup(str2);

			printf(C"Correct: "G"\"%s\""NC" \t"Y"ft_strdup"BR"("C"\"%s\""BR") "NC"= "G"\"%s\""NC"\n", str1, str1, dup1);
			printf(C"Correct: "G"\"%s\""NC" \t\t\t"Y"ft_strdup"BR"("C"\"%s\""BR") "NC"= "G"\"%s\""NC"\n", str2, str2, dup2);

			free(dup1);
			free(dup2);
		}

	#pragma endregion

	#pragma region "READ" // Pendiente

		void read_test() {
			printf("\n  "UN BM"READ"NC"\n\n");

			int fd = open("test.txt", O_RDONLY | O_CREAT, 0644);
			if (fd < 0) {
				write(2, "Failed to open test.txt\n", 24);
				return;
			}

			write(fd, "Hello, this is a test!", 22);
			close(fd);

			// Open for reading
			fd = open("test.txt", O_RDONLY);
			if (fd < 0) {
				write(2, "Failed to open test.txt for reading\n", 36);
				return;
			}

			char buffer1[100] = {0};
			char buffer2[100] = {0};

			ssize_t ret1 = read(fd, buffer1, 10);
			printf("read(%d, buffer, 10) = %zd, buffer = \"%s\"\n", fd, ret1, buffer1);

			lseek(fd, 0, SEEK_SET);  // Rewind file pointer

			ssize_t ret2 = ft_read(fd, buffer2, 10);
			printf("ft_read(%d, buffer, 10) = %zd, buffer = \"%s\"\n", fd, ret2, buffer2);

			close(fd);

			// Test error case
			printf("\nTesting error case (invalid fd):\n");
			ret1 = read(-1, buffer1, 10);
			int original_errno = errno;

			errno = 0;
			ret2 = ft_read(-1, buffer2, 10);

			printf("read returned: %zd (errno: %d)\n", ret1, original_errno);
			printf("ft_read returned: %zd (errno: %d)\n", ret2, errno);
		}

	#pragma endregion

	#pragma region "WRITE"

		void write_test() {
			printf("\n  "UN BM"WRITE"NC"\n\n");

			char *str = "Testing write to STDOUT";
			printf(C"Correct: "G"%zu"NC" \t\t\t"Y"ft_write"BR"(1, "C"\"%s\""BR", "RD"%zu"BR") "NC"prints in the terminal: "Y, ft_strlen(str), str, ft_strlen(str)); fflush(stdout);
			printf(NC" with a length of: "G"%zd"NC"\n", ft_write(1, str, strlen(str)));

			write(-1, str, strlen(str));
			int orig_errno = errno; errno = 0;

			str = "Testing an invalid fd";
			ft_write(-1, str, strlen(str));
			printf(C"Correct: "G"%d"NC" \t\t\t"Y"ft_write"BR"(-1, "C"\"%s\""BR", "RD"%zu"BR") "NC"sets errno to: "G"%d"NC"\n", orig_errno, str, ft_strlen(str), errno);
		}

	#pragma endregion

#pragma endregion

#pragma region "Main"

	int main() {
		strlen_test();
		strcpy_test();
		strcmp_test();
		strdup_test();
		//read_test();
		write_test();
		printf("\n");
	}

#pragma endregion
