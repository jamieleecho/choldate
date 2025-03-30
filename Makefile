.PHONY = \
    build-dist \
    default \
    check-all \
    check-lint \
    check-lock \
    clean \
    fix-all \
    fix-format \
    install-pre-commit \
    lock \
    sync \
    test

default: check-all test

build-dist:
	uv build

check-all: check-lint check-lock

check-lint:
	uv run ruff check

check-lock:
	uv lock --locked

clean:
	rm -rf .ruff_cache .venv build

fix-all: fix-format lock

fix-format:
	uv run ruff format

install-pre-commit:
	uv run pre-commit install

lock:
	uv lock

sync:
	uv sync --no-install-workspace

test:
	uv run python -m unittest discover -v -s ./choldate -p *test*.py

