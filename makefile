build: test_requirements test

clean:
	-find . -type f -name "*.pyc" -delete

test_requirements:
	pip install pip-tools
	pip-sync tests/requirements.txt

update_requirements:
	pip-compile --output-file tests/requirements.txt tests/requirements.in

upgrade_requirements:
	pip-compile --upgrade --output-file tests/requirements.txt tests/requirements.in

static_analysis: pep8 xenon

pep8:
	@echo "Running flake8 over codebase"
	flake8 --ignore=E501,W391,F999 cnavservices/

xenon:
	@echo "Running xenon over codebase"
	xenon --max-absolute B --max-modules B --max-average A cnavservices/

test: static_analysis
	py.test tests --cov=cnavservices $(pytest_args)


.PHONY: build clean test_requirements test static_analysis pep8 xenon update_requirements upgrade_requirements
