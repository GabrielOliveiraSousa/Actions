name: Pipeline Node.js
run-name: ${{ github.actor }} está fazendo a tarefa de casa no GitHub Actions
on:
  push:
    branches:
      - main
      - develop
  pull_request:
    branches:
      - main
      - develop
jobs:
  build:
    name: Primeira Job build
    runs-on: ubuntu-latest
    steps:
    - name: Task de Checkout
      uses: actions/checkout@v5
    - name: Setup node.js  
      uses: actions/setup-node@v3
      with: 
        node-version: "16"
    - name: Instalando Dependencias
      run: echo "npm install"

    - name: Run Testes 
      run: echo "npm run test"
