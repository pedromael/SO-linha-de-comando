# Meu Sistema Operacional Simples

Este projeto é um sistema operacional minimalista que inclui um bootloader, um kernel básico e um shell simples.

## Estrutura do Projeto

- **boot.asm**: Bootloader escrito em Assembly que exibe uma mensagem e carrega o kernel.
- **kernel.c**: Código principal do kernel, que pode ser expandido para inicializar mais funcionalidades.
- **main.c**: Shell simples que aceita comandos do usuário.
- **Makefile**: Automação da compilação e geração da imagem do sistema operacional.

## Como Compilar e Rodar

### Requisitos
- `nasm` (Montador para Assembly)
- `gcc` (Compilador C)
- `qemu` (Emulador para testar o OS)

### Compilação
Para compilar o projeto, execute:
```sh
make
```
Isso irá gerar o arquivo `os-image.bin`.

### Execução
Para testar no QEMU:
```sh
qemu-system-x86_64 -drive format=raw,file=os-image.bin
```

## Melhorias Futuras
- Implementar um sistema de arquivos básico.
- Melhorar o shell com mais comandos.
- Adicionar suporte a múltiplas tarefas e gerenciamento de memória.

## Licença
Este projeto é de código aberto e pode ser modificado e distribuído livremente.

