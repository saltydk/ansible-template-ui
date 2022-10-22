# ansible-template-ui
Web UI for testing ansible templates

## Docker Container

### Pull

```
docker pull saltydk/ansible-template-ui:latest
```

### Build

```
docker build -t ansible-template-ui:latest docker/stable
```

## Web App

### Dev

```
python -m ansible_template_ui
```

### Production

```
pip install -r requirements.txt -r deploy-requirements.txt
gunicorn -k gevent ansible_template_ui:app
```
