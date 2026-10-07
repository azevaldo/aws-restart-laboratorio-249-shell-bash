# AWS re/Start — Laboratório 249: Shell Bash

## Sobre o laboratório

Neste laboratório do **AWS re/Start**, foram praticados conceitos do shell Bash relacionados à criação de aliases e ao gerenciamento da variável de ambiente `PATH`.

O exercício teve como foco criar um alias para realizar backups de diretórios utilizando `tar` e adicionar um diretório ao `PATH` para permitir a execução de scripts sem precisar informar o caminho completo.

## Objetivos

* Criar e utilizar um alias no Bash.
* Criar um alias para realizar backups de diretórios.
* Utilizar o comando `tar` para criar arquivos compactados.
* Consultar a variável `PATH`.
* Adicionar um novo diretório ao `PATH`.
* Executar um script utilizando diferentes formas de chamada.

## Ambiente

* **Programa:** AWS re/Start
* **Lab:** 249 — Shell Bash
* **AWS:** Vocareum
* **Serviço:** Amazon EC2
* **Sistema operacional:** Amazon Linux
* **Acesso:** SSH
* **Sistema utilizado:** Windows
* **Cliente SSH:** PuTTY
* **Chave:** `labsuser.ppk`
* **Usuário:** `ec2-user`

## Conexão com a instância

Como o laboratório foi realizado no Windows, a conexão com a instância EC2 foi feita utilizando o **PuTTY**.

Configuração utilizada:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

Na configuração da autenticação do PuTTY:

```text
Connection
└── SSH
    └── Auth
        └── Credentials
            └── Private key file: labsuser.ppk
```

Depois da conexão, foi utilizado o usuário:

```text
ec2-user
```

> A chave privada `labsuser.ppk` não deve ser adicionada ao repositório.

## Tarefa 2 — Criar um alias para backup

Primeiro, foi verificado o diretório atual:

```bash
pwd
```

O resultado esperado é:

```text
/home/ec2-user/
```

### Criando o alias

Foi criado um alias chamado `backup`:

```bash
alias backup='tar -cvzf '
```

O objetivo do alias é facilitar a criação de um backup utilizando o comando `tar`.

O laboratório apresenta o seguinte formato de utilização:

```text
backup "arquivo-de-backup.tar.gz" "caminho-para-backup"
```

### Entendendo o tar

O comando utilizado pelo alias é:

```bash
tar -cvzf
```

Cada opção possui uma função:

| Opção | Função                               |
| ----- | ------------------------------------ |
| `-c`  | Cria um novo arquivo de arquivamento |
| `-v`  | Exibe os arquivos processados        |
| `-z`  | Utiliza compressão gzip              |
| `-f`  | Define o nome do arquivo de saída    |

O laboratório também destaca que `tar -cf` poderia criar o arquivo, mas não apresentaria o conteúdo processado nem utilizaria a compressão gzip.

### Criando o backup da CompanyA

Para realizar o backup do diretório `CompanyA`:

```bash
backup backup_companyA.tar.gz CompanyA
```

O comando cria:

```text
backup_companyA.tar.gz
```

contendo a estrutura do diretório:

```text
CompanyA/
├── Management/
├── Employees/
├── Finance/
├── HR/
├── IA/
├── SharedFolders/
└── bin/
    └── hello.sh
```

O `-v` utilizado pelo `tar` faz com que os arquivos e diretórios processados sejam exibidos no terminal.

### Verificando o backup

Para confirmar a criação do arquivo:

```bash
ls
```

Resultado esperado:

```text
backup_companyA.tar.gz
CompanyA
```

## Tarefa 3 — Trabalhar com a variável PATH

A segunda parte do laboratório demonstra como a variável `PATH` influencia a execução de comandos e scripts.

Primeiro, foi acessado o diretório `bin` dentro de `CompanyA`:

```bash
cd /home/ec2-user/CompanyA/bin
```

## Executando o script hello.sh

No diretório `bin`, o script pode ser executado utilizando:

```bash
./hello.sh
```

O resultado esperado é:

```text
hello ec2-user
```

Depois, foi utilizado:

```bash
cd ..
```

para retornar ao diretório `CompanyA`.

A partir daí, o script também pode ser executado informando seu caminho relativo:

```bash
./bin/hello.sh
```

Resultado:

```text
hello ec2-user
```

### Tentativa utilizando apenas o nome

Ao executar:

```bash
hello.sh
```

o sistema apresenta:

```text
bash: hello.sh: command not found
```

Isso acontece porque o diretório que contém o script ainda não está disponível na variável `PATH`.

## Consultando o PATH

Para visualizar o conteúdo atual da variável:

```bash
echo $PATH
```

No laboratório, o resultado apresentado contém diretórios como:

```text
/usr/local/bin
/usr/bin
/usr/local/sbin
/usr/sbin
/home/ec2-user/.local/bin
/home/ec2-user/bin
```

O conceito principal é que `PATH` contém uma lista de diretórios nos quais o sistema procura executáveis quando um comando é digitado.

## Adicionando um diretório ao PATH

Para adicionar o diretório `CompanyA/bin` ao `PATH`:

```bash
PATH=$PATH:/home/ec2-user/CompanyA/bin
```

Depois disso, o script pode ser executado diretamente pelo nome:

```bash
hello.sh
```

Resultado:

```text
hello ec2-user
```

## Entendendo o PATH

Antes da alteração:

```text
hello.sh
```

não era encontrado porque o diretório onde o script estava localizado não fazia parte do `PATH`.

Depois da alteração:

```bash
PATH=$PATH:/home/ec2-user/CompanyA/bin
```

o Bash passou a procurar executáveis também nesse diretório.

A diferença pode ser resumida assim:

```text
./hello.sh
```

Executa o arquivo indicando sua localização relativa.

```text
./bin/hello.sh
```

Executa o arquivo informando outro caminho relativo.

```text
hello.sh
```

Procura o executável nos diretórios definidos pela variável `PATH`.

## Principais comandos utilizados

| Comando                  | Função                                       |
| ------------------------ | -------------------------------------------- |
| `pwd`                    | Exibe o diretório atual                      |
| `alias`                  | Cria ou consulta aliases                     |
| `tar`                    | Cria e manipula arquivos de arquivamento     |
| `ls`                     | Lista arquivos e diretórios                  |
| `cd`                     | Altera o diretório atual                     |
| `./hello.sh`             | Executa o script a partir do diretório atual |
| `echo $PATH`             | Exibe o conteúdo da variável `PATH`          |
| `PATH=$PATH:<diretório>` | Adiciona um diretório ao `PATH`              |

## Conceitos praticados

### Alias

Um alias permite criar um nome alternativo para um comando ou sequência de comandos.

Exemplo utilizado:

```bash
alias backup='tar -cvzf '
```

Assim, em vez de escrever o comando `tar` completo, pode-se utilizar:

```bash
backup backup_companyA.tar.gz CompanyA
```

### PATH

A variável `PATH` define os diretórios nos quais o shell procura comandos e executáveis.

Para visualizar:

```bash
echo $PATH
```

Para adicionar um diretório:

```bash
PATH=$PATH:/home/ec2-user/CompanyA/bin
```

## O que foi aprendido

Neste laboratório, foram praticados:

* criação e utilização de aliases no Bash;
* criação de backups utilizando `tar`;
* compressão de arquivos com gzip;
* utilização de parâmetros do comando `tar`;
* execução de scripts Bash;
* utilização da variável de ambiente `PATH`;
* diferença entre executar um script pelo caminho e pelo nome;
* adição de diretórios ao `PATH`.

## Conclusão

O laboratório demonstrou como o Bash pode facilitar tarefas administrativas por meio de aliases e variáveis de ambiente.

A criação do alias `backup` simplifica a execução de backups, enquanto o gerenciamento do `PATH` permite executar scripts sem precisar informar o caminho completo, desde que o diretório correspondente esteja incluído na variável.

## Arquivos do repositório

```text
aws-restart-laboratorio-249-shell-bash/
├── README.md
├── comandos.sh
└── .gitignore
```

O arquivo `comandos.sh` reúne os principais comandos praticados durante o laboratório.
