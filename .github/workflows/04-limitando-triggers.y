name: Pipeline Experimental
on: 
  push:
    branches: # [main, develop]
    - main
    - develop
    # trigga quando fazer o push da branch main ou na develop
jobs:
  ci-continuous-integration:
    name: Teste de Integração
    runs-on: ubuntu-latest
    steps:
      - run: echo "Olá fatec"
      
