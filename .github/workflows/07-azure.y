name: Aula Workflow Manual

on:
#  push:
 #   branches:
  #    - main
   # schedule: #agendamento
    #  - cron: '0 2 * * *' #cronometrado para as 2am
      
  workflow_dispatch: #botão manual no actions
    inputs:
      rodar_testes:
        description: 'Rodar testes antes do deploy?'
        required: true
        default: 'sim'
        type: choice
        options:
          - sim
          - nao
          

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout código
        uses: actions/checkout@v4
        
      - name: Rodar testes
        if: ${{ github.event.inputs.rodar_testes == 'sim' }}
        run: npm teste
        
      - name: Upload artefato para tarefa de implantação
        uses: actions/upload-artifact@v4
        with:
          name: node-app
          path: .
          
  deploy:
    needs: build
    runs-on: ubuntu-latest
    
    steps: 
      - name: Download artefato do job build
        uses: actions/download-artifact
        with:
          name: node-app
          
      - name: Login no Azure
        uses: azure/login@v2
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS}}
        
      - name: Deploy no Azure Web App
        id: deploy-to-webapp
        uses: azure/webapps-deploy@v3
        with:
          app-name: fatec-teste #nome que está no azure
          slot-name: 'Production'
          package: .
