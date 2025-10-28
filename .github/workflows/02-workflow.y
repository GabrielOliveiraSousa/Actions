# 1. Gatilho (trigger)
name: Pipeline Experimental
on: push

# 2. Definição dos Jobs
jobs:
  ci-continious-integracion:
    name: Teste de CI
    runs-on: ubuntu-latest

    steps:
    - run: echo "Olá,Fatec!"
      name: Mensagem Especial
    - uses: actions/checkout@v5
      name: Fazendo clone e checkout no meu repositório nesta maquina virtual
    - name: Zipar os arquivos do meu repositório
      run: zip -r arquivo.zip .
    - name: listar os arquivos do meu repositório
      run: ls -la
