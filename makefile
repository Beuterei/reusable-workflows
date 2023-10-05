lint:
	@echo "Lint all yaml files in repository"
	yamllint . -s
	actionlint --ignore "^unexpected key \"options\" for \"inputs at workflow_call event\" section\. expected one of .*" --ignore "^invalid value \"choice\" for input type of workflow_call event. it must be one of .*"