name: GitHub Actions Variaveis
run-name: ${{ github.actor }} está testando GitHub Actions
on: [push]
jobs:
	Explore-GitHub-Actions:
	runs-on: ubuntu-latest
	steps:
		- run: echo "O job disparou um ${{ github.ev }} evento"
		- run: echo "Rodando em um ${{ runner.os }} servidor"
		- run: echo "O nome da branch é ${{ github.ref }} do repositório ${{github.repository}}"
		
		- name: Check out no repositório do código
		  uses: actions/checkout@v4
		  
		- run: echo "Repositório ${{github.repository}} clonado."
		
		
		- name: Lista arquivos no repositorio 
		  run: |
		    ls ${{github.workspace}}
		    echo "O status do hob é ${{job.status}}"
