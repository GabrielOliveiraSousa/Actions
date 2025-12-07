name: GitHub Actions - Workflow Dispatch Template
run-name: Running - ${{ github.event_name }}
on:
  workflow_dispatch:
    inputs:
      resposta:
        description: Esta foi a melhor matéria que você teve?
        type: boolean
jobs:
  on-workflow_dispatch:
    runs-on: ubuntu-latest
    steps:
      - name: Comentário
        run: |
          echo "Comentário WORKFLOW DISPATCH - Boleano"
          echo "Melhor matéria que cursei: ${{ inputs.resposta }} !"
