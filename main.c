#include <stdio.h>
#include <stdlib.h>

unsigned char define_error(float d, int x, int y, float epsilon);
void draw_hyperbolas(float d, unsigned char* data, int m, int n, float epsilon);

int main()
{
	float d = 1.4, epsilon = 6;
	int m = 25, n = 100;
	int size = m * n,temp = 0;
	unsigned char* tab = (unsigned char*)malloc(size * sizeof(unsigned char));
	draw_hyperbolas(d, tab, m, n, epsilon);

	for (int i = 0; i < m; i++)
	{
		for (int j = 0; j < n; j++)
		{
			printf("%hhu", tab[temp]);
			temp++;
		}
		printf("\n");
	}

	free(tab);
	return 0;
}