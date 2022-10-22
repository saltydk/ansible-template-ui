#!/bin/sh

export ANSIBLE_STDOUT_CALLBACK=json
export ANSIBLE_DEPRECATION_WARNINGS=0
export ANSIBLE_RETRY_FILES_ENABLED=0
export ANSIBLE_INVENTORY=/srv/git/saltbox/inventories/local
export ANSIBLE_ROLES_PATH=/srv/git/saltbox/roles:/srv/git/saltbox/resources/roles
export ANSIBLE_FILTER_PLUGINS=/srv/git/saltbox/filter_plugins
export ANSIBLE_FACT_PATH=/srv/git/saltbox/ansible_facts.d
export ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python3

echo $VARIABLES | base64 -d > /variables.yml
echo $TEMPLATE | base64 -d > /template.j2

timeout -s KILL 5 ansible-playbook -e @variables.yml playbook.yml
