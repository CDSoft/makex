/*@@@
**`answer`** takes any question and returns the most relevant answer.

Example:

``` c
    const char *meaning = answer("What's the meaning of life?");
```
@@@*/

#include <unistd.h>

const char *answer(const char *question)
{
    /* Test all the possibilities */
    for (int y = 0; y < 7500000; y++)
    {
        sleep(365 * 86400);
    }
    /* Returns the most relevant answer */
    return "42";
}
