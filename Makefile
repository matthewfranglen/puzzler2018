
# anaconda requires the use of pythonw for pygame, so check for that
pythonType=python
ifneq (, $(shell which pythonw))
pythonType=pythonw
endif

init:
	pipenv install --skip-lock

test-visualizer:
	pipenv run $(pythonType) -m pygame.examples.aliens

run-visualizer:
	pipenv run ${pythonType} -m visualizer

test-server:
	pipenv run nosetests tests

print-routes:
	FLASK_APP=server.py pipenv run flask routes

run-server-simple:
	pipenv run python -m server 100

run-server-submission:
	pipenv run python -m server 1000

run-base-bot:
	pipenv run python -m baseBot

run-your-bot:
	./yourBot.vim
