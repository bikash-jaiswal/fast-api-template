# Makefile
SHELL = /bin/bash

clean: style
	@echo "Cleaning the files"
	find . -type f -name "*.DS_Store" -ls -delete
	find . | grep -E "(__pycache__|\.pyc|\.pyo)" | xargs rm -rf
	find . | grep -E ".pytest_cache" | xargs rm -rf
	find . | grep -E ".ipynb_checkpoints" | xargs rm -rf
	find . | grep -E ".trash" | xargs rm -rf
	rm -f .coverage


style:
	black .
	python3 -m isort .

.ONESHELL:
venv:
	python3 -m venv venv
	source env/bin/activate && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

run:
	uvicorn app.main:app --reload 

help:
    @echo "Commands:"
    @echo "venv    : creates a virtual environment."
    @echo "style   : executes style formatting."
    @echo "clean   : cleans all unnecessary files."
	@echo "run     : run flask application."

.PHONY: venv style clean