# ============================================
# Taleem OS - Makefile
# Build orchestration for the project
# ============================================
# Usage: make [target]
# Run 'make help' to see all available targets

# --- Variables ---
SHELL := /bin/bash
PROJECT_NAME := taleem-os
VERSION := $(shell cat VERSION 2>/dev/null || echo "0.1.0-alpha")
PYTHON := python3
PIP := pip3
VENV_DIR := venv
SCRIPTS_DIR := scripts
ISO_DIR := iso
BUILD_LOG := build.log

# Colors for terminal output
GREEN := \033[0;32m
YELLOW := \033[1;33m
RED := \033[0;31m
CYAN := \033[0;36m
NC := \033[0m  # No Color

# ============================================
# Default target
# ============================================
.DEFAULT_GOAL := help

# ============================================
# Help
# ============================================
.PHONY: help
help: ## Show this help message
	@echo ""
	@echo "  $(CYAN)╔══════════════════════════════════════════╗$(NC)"
	@echo "  $(CYAN)║$(NC)   🇵🇰  $(GREEN)Taleem OS$(NC) - Build System v$(VERSION)    $(CYAN)║$(NC)"
	@echo "  $(CYAN)╚══════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "  $(YELLOW)Available targets:$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "    $(GREEN)%-18s$(NC) %s\n", $$1, $$2}'
	@echo ""

# ============================================
# Development Setup
# ============================================
.PHONY: setup
setup: ## Set up the complete development environment
	@echo "$(GREEN)[Taleem OS]$(NC) Setting up development environment..."
	@chmod +x $(SCRIPTS_DIR)/*.sh
	@$(SCRIPTS_DIR)/setup-dev.sh
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Development environment ready!"

.PHONY: venv
venv: ## Create Python virtual environment
	@echo "$(GREEN)[Taleem OS]$(NC) Creating Python virtual environment..."
	@$(PYTHON) -m venv $(VENV_DIR)
	@echo "$(GREEN)[Taleem OS]$(NC) Activating venv and installing dependencies..."
	@source $(VENV_DIR)/bin/activate && $(PIP) install -r requirements.txt
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Virtual environment ready!"
	@echo "$(YELLOW)[Taleem OS]$(NC) Run 'source venv/bin/activate' to activate"

# ============================================
# Build
# ============================================
.PHONY: build-iso
build-iso: ## Build the Taleem OS ISO image
	@echo "$(GREEN)[Taleem OS]$(NC) Starting ISO build v$(VERSION)..."
	@chmod +x $(SCRIPTS_DIR)/build.sh
	@$(SCRIPTS_DIR)/build.sh 2>&1 | tee $(BUILD_LOG)
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Build complete! Check $(ISO_DIR)/ for output."

# ============================================
# Testing
# ============================================
.PHONY: test-vm
test-vm: ## Launch the ISO in QEMU for testing
	@echo "$(GREEN)[Taleem OS]$(NC) Launching test VM..."
	@chmod +x $(SCRIPTS_DIR)/test-vm.sh
	@$(SCRIPTS_DIR)/test-vm.sh

.PHONY: test
test: ## Run Python test suite
	@echo "$(GREEN)[Taleem OS]$(NC) Running tests..."
	@$(PYTHON) -m pytest tests/ -v --tb=short
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ All tests passed!"

.PHONY: test-coverage
test-coverage: ## Run tests with coverage report
	@echo "$(GREEN)[Taleem OS]$(NC) Running tests with coverage..."
	@$(PYTHON) -m pytest tests/ -v --cov=src --cov-report=html --cov-report=term
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Coverage report saved to htmlcov/"

# ============================================
# Code Quality
# ============================================
.PHONY: lint
lint: ## Run code linting (flake8)
	@echo "$(GREEN)[Taleem OS]$(NC) Linting code..."
	@$(PYTHON) -m flake8 src/ tests/ --max-line-length=100
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Linting passed!"

.PHONY: format
format: ## Format code with black + isort
	@echo "$(GREEN)[Taleem OS]$(NC) Formatting code..."
	@$(PYTHON) -m black src/ tests/
	@$(PYTHON) -m isort src/ tests/
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Code formatted!"

# ============================================
# Cleanup
# ============================================
.PHONY: clean
clean: ## Remove build artifacts and temporary files
	@echo "$(GREEN)[Taleem OS]$(NC) Cleaning up..."
	@rm -rf $(ISO_DIR)/*.iso $(ISO_DIR)/*.img
	@rm -rf __pycache__ .pytest_cache htmlcov .coverage
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name "*.pyc" -delete 2>/dev/null || true
	@rm -f $(BUILD_LOG)
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Cleaned!"

.PHONY: clean-all
clean-all: clean ## Remove everything including venv and downloads
	@rm -rf $(VENV_DIR)
	@rm -rf $(ISO_DIR)/*
	@echo "$(GREEN)[Taleem OS]$(NC) ✅ Full clean complete!"

# ============================================
# Info
# ============================================
.PHONY: info
info: ## Show project information
	@echo ""
	@echo "  $(CYAN)Project:$(NC)  $(PROJECT_NAME)"
	@echo "  $(CYAN)Version:$(NC)  $(VERSION)"
	@echo "  $(CYAN)Python:$(NC)   $(shell $(PYTHON) --version 2>/dev/null || echo 'Not installed')"
	@echo "  $(CYAN)OS:$(NC)       $(shell uname -s 2>/dev/null || echo 'Unknown')"
	@echo ""
