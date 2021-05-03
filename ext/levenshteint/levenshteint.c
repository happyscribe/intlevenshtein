# include <string.h>
# include <stdlib.h>

# define min(x, y) ((x) < (y) ? (x) : (y))
# define eq(x, y) ((x) == (y))

unsigned int levenshteint(
    const unsigned int *words1, 
    unsigned int len1, 
    const unsigned int *words2, 
    unsigned int len2
) {
    unsigned int *v = calloc(len2 + 1, sizeof(unsigned int));
    unsigned int i, j, current, next, cost;

    /* strip common prefixes */
    while (len1 > 0 && len2 > 0 && eq(words1[0], words2[0]))
        words1++, words2++, len1--, len2--;

    /* handle degenerate cases */
    if (!len1) return len2;
    if (!len2) return len1;
    
    /* initialize the column vector */
    for (j = 0; j < len2 + 1; j++)
        v[j] = j;

    for (i = 0; i < len1; i++) {
        /* set the value of the first row */
        current = i + 1;
        /* for each row in the column, compute the cost */
        for (j = 0; j < len2; j++) {
            /*
             * cost of replacement is 0 if the two chars are the same, or have
             * been transposed with the chars immediately before. otherwise 1.
             */
            cost = !(eq(words1[i], words2[j]) || (i && j &&
                     eq(words1[i-1], words2[j]) && eq(words1[i],words2[j-1])));
            /* find the least cost of insertion, deletion, or replacement */
            next = min(min( v[j+1] + 1,
                            current + 1 ),
                            v[j] + cost );
            /* stash the previous row's cost in the column vector */
            v[j] = current;
            /* make the cost of the next transition current */
            current = next;
        }
        /* keep the final cost at the bottom of the column */
        v[len2] = next;
    }
    free(v);
    return next;
}

# ifdef TEST
# include <stdio.h>
# include "levenshteint.h"
# include <time.h>

int main (int argc, char **argv) {
    unsigned int size = 10000;
    unsigned int* words1 = malloc(sizeof(unsigned int)*size);
    unsigned int* words2 = malloc(sizeof(unsigned int)*size);

    srand(time(NULL)); 

    for (unsigned int i = 0; i < size; ++i) {
        words1[i] = rand()%20;
        words2[i] = rand()%20;
    }

    unsigned int distance = levenshteint(words1, size, words2, size);
    printf("%u", distance);

    free(words1);
    free(words2);
}
# endif
