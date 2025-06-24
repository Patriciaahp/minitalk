#include "libft/libft.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

#define END_CHAR '\0'

void handle_signal(int signal)
{
    static unsigned char current_char = 0;
    static int bit_index = 0;

    current_char |= (signal == SIGUSR1);
    bit_index++;
    if (bit_index == 8)
    {
        if (current_char == END_CHAR)
            ft_printf("\n");
        else
            ft_printf("%c", current_char);
        bit_index = 0;
        current_char = 0;
    }
    else
        current_char <<= 1;
}

int main(void)
{
    ft_printf("%d\n", getpid());
    signal(SIGUSR1, handle_signal);
    signal(SIGUSR2, handle_signal);
    while (1)
        pause();
    return (0);
}
