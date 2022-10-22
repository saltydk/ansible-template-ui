#!/bin/sh

export ANSIBLE_STDOUT_CALLBACK=json
export ANSIBLE_COMMAND_WARNINGS=0
export ANSIBLE_RETRY_FILES_ENABLED=0
export DEFAULT_HOST_LIST=/srv/git/saltbox/inventories/local
export DEFAULT_ROLES_PATH=/srv/git/saltbox/roles:/srv/git/saltbox/resources/roles
export DEFAULT_FILTER_PLUGIN_PATH=/srv/git/saltbox/filter_plugins
export DEFAULT_FACT_PATH=/srv/git/saltbox/ansible_facts.d

echo $VARIABLES | base64 -d > /variables.yml
echo $TEMPLATE | base64 -d > /template.j2

git clone https://github.com/saltyorg/Saltbox.git /srv/git/saltbox
git clone https://github.com/saltyorg/Sandbox.git /opt/sandbox

timeout -s KILL 5 ansible-playbook -e @variables.yml playbook.yml
