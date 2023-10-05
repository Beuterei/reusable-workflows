lint:
	@echo "Lint all yaml files in repository"
	yamllint . -s
	actionlint