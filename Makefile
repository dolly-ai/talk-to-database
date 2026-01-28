.PHONY: help setup install-backend install-frontend run-backend run-frontend run-all test clean docker-up docker-down

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

setup: ## Run setup script
	@chmod +x setup.sh
	@./setup.sh

install-backend: ## Install backend dependencies
	@echo "Installing backend dependencies..."
	@cd backend && python -m venv venv && . venv/bin/activate && pip install -r requirements.txt

install-frontend: ## Install frontend dependencies
	@echo "Installing frontend dependencies..."
	@cd frontend && npm install

run-backend: ## Run backend server
	@echo "Starting backend server..."
	@cd backend && . venv/bin/activate && python app.py

run-frontend: ## Run frontend dev server
	@echo "Starting frontend dev server..."
	@cd frontend && npm run dev

run-all: ## Run both backend and frontend (requires tmux or run in separate terminals)
	@echo "Please run 'make run-backend' in one terminal and 'make run-frontend' in another"

test: ## Run API tests
	@echo "Running API tests..."
	@cd backend && . venv/bin/activate && python test_api.py

clean: ## Clean up generated files
	@echo "Cleaning up..."
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@find . -type f -name "*.pyc" -delete
	@find . -type f -name "*.pyo" -delete
	@find . -type d -name "node_modules" -exec rm -rf {} +
	@find . -type d -name "dist" -exec rm -rf {} +
	@find . -type d -name "build" -exec rm -rf {} +
	@echo "Clean complete!"

docker-up: ## Start Docker containers
	@echo "Starting Docker containers..."
	@docker-compose up -d
	@echo "Containers started! Frontend: http://localhost:3000"

docker-down: ## Stop Docker containers
	@echo "Stopping Docker containers..."
	@docker-compose down

docker-logs: ## View Docker logs
	@docker-compose logs -f

docker-rebuild: ## Rebuild and restart Docker containers
	@echo "Rebuilding Docker containers..."
	@docker-compose up -d --build

db-backup: ## Backup database
	@echo "Backing up database..."
	@docker-compose exec db mysqldump -u root -prootpassword talk_to_data > backup_$(shell date +%Y%m%d_%H%M%S).sql
	@echo "Backup complete!"

db-restore: ## Restore database from backup (use BACKUP=filename)
	@echo "Restoring database from $(BACKUP)..."
	@docker-compose exec -T db mysql -u root -prootpassword talk_to_data < $(BACKUP)
	@echo "Restore complete!"

db-reset: ## Reset database (warning: deletes all data)
	@echo "Resetting database..."
	@docker-compose down -v
	@docker-compose up -d
	@echo "Database reset complete!"
