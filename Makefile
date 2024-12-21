.PHONY: install run-frontend run-backend clean test

install:
	python -m venv env
	. venv/bin/activate && pip install -r requirements.txt
	npm install

run-frontend:
	npm run dev

run-backend:
	. env/bin/activate && uvicorn server:app --reload --port 8000

clean:
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm -rf node_modules
	rm -rf .next
	rm -rf build
	find . -type f -name "*.pyc" -delete

test:
	. venv/bin/activate && python -m pytest tests/

.DEFAULT_GOAL := help

help:
	@echo "Available commands:"
	@echo "  install      - Create virtual env and install dependencies"
	@echo "  run-frontend - Start Next.js dev server"
	@echo "  run-backend  - Start FastAPI dev server" 
	@echo "  clean        - Remove build artifacts and caches"
	@echo "  test         - Run test suite"