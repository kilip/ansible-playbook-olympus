#!make
.DEFAULT_GOAL := development

install-role:
	ansible-galaxy install -r dependencies.yml

ping:
	ansible all -i inventory/prod.yaml -m ping
	
production:
	ansible-playbook -i inventory/production -K playbook.yml --verbose

development:
	ansible-playbook -i inventory/development/hosts.ini -K playbook.yml