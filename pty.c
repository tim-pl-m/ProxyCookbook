#include <stdio.h>
#include <stdlib.h>
#include <sysexits.h>
#include <unistd.h>
#include <pty.h>

int main(int argc, char **argv) {
    int master;
    struct winsize win = {
        .ws_col = 80, .ws_row = 24,
        .ws_xpixel = 480, .ws_ypixel = 192,
    };
    pid_t child;

    if (argc < 2) {
        printf("Usage: %s cmd [args...]\n");
        exit(EX_USAGE);
    }

    child = forkpty(&master, NULL, NULL, &win);
    if (child == -1) {
        perror("forkpty failed");
        exit(EX_OSERR);
    }
    if (child == 0) {
        execvp(argv[1], argv + 1);
        perror("exec failed");
        exit(EX_OSERR);
    }

    /* now the child is attached to a real pseudo-TTY instead of a pipe,
     * while the parent can use "master" much like a normal pipe */
}