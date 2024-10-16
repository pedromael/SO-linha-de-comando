#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CMD_LENGTH 1024
#define MAX_ARG_LENGTH 100

void execute_command(char *cmd) {
    char *args[MAX_ARG_LENGTH];
    char *token = strtok(cmd, " \n");
    int i = 0;

    // Divide a linha de comando em argumentos
    while (token != NULL && i < MAX_ARG_LENGTH - 1) {
        args[i++] = token;
        token = strtok(NULL, " \n");
    }
    args[i] = NULL; // O último argumento deve ser NULL

    // Simula a execução do comando
    printf("Comando a ser executado: ");
    for (int j = 0; j < i; j++) {
        printf("%s ", args[j]);
    }
    printf("\n");
}

int main() {
    char cmd[MAX_CMD_LENGTH];

    while (1) {
        printf("my_shell> ");
        // Lê a linha de comando
        if (fgets(cmd, sizeof(cmd), stdin) == NULL) {
            break; // Sai se houver erro na leitura
        }

        // Verifica se o comando é "exit" ou "quit"
        if (strncmp(cmd, "exit", 4) == 0 || strncmp(cmd, "quit", 4) == 0) {
            printf("Saindo do shell...\n");
            break;
        }

        execute_command(cmd);
    }

    return 0;
}
