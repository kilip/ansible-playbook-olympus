#!make
.DEFAULT_GOAL := development

deps:
	pip install -r requirements.txt
	ansible-galaxy install -r dependencies.yml

ping:
	ansible all -i inventory/prod.yaml -m ping
	
production:
	ansible-playbook -i inventory/production/hosts.ini -K playbook.yml --verbose

hercules:
	ansible-playbook -i inventory/development/hosts.ini -K playbook-hercules.yml --verbose

development:
	ansible-playbook -i inventory/development/hosts.ini -K playbook.yml