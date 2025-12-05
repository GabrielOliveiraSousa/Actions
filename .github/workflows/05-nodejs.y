name: Pipeline Node.js
on:
  push:
    branches:
      - main
      - develop
      
jobs:
# Início da fase CI
  testes:
  name: Job 1 Teste
  runs-on: ubuntu-latest
  steps:
    - name: Passo 1 - Task de Checkout
      uses: actions/checkout@v5
    
    - name: Passo 2 - Task de Set up node.js
      uses: actions/setup-node@v4
      with:
        node-version: '22.x'
      
    - name: Passo 3 - Task de Install Dependencies
      run: npm ci
      
    - name: Passo 4 - Task de Run Testes
      run: npm run test
      
      
  build:
    name: Job 2 Build
    runs-on: ubuntu-latest
    needs: testes # needs - precisa de testes finalizado para ser executado
    steps:
      - run: npm run build
      
  # Início da fase CD
  qa:
    name: Fase de QA 
    runs-on: ubuntu-latest
    needs: [testes, build]
    steps:
      - name: Passo QA
        run: echo "Testes de QA"
        
  prod:
    name: Em Produção
    runs-on: ubuntu-latest
    needs: qa
    steps:
      - run: echo "npm run deploy"
        name: Fase de Produção
