name: Pipeline Experimental
on: 
  push:
    branches: # [main, develop]
    - main
    - develop
    # trigga quando fazer o push da branch main ou na develop
jobs:
  build:
    name: Job 1 build
    runs-on: ubuntu-latest
    steps:
    - name: Passo 1 - Task de Checkout
      uses: actions/checkout@v5
    - name: Passo 2 - Task de Setup node.js  
      uses: actions/setup-node@v3
      with: 
        node-version: "16"
    - name: Passo 3 - Task de Install Dependencias
      run: echo "npm install"

    - name: Passo 4 - Task de Run Testes 
      run: echo "npm run test"
