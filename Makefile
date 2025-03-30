.PHONY = \
    build-dist \
    default \
    check-all \
    check-lint \
    check-lock \
    clean \
    fix-all \
    fix-lint \
    lock \
    sync \
    test

default: check-lock test

build-dist:
	uv build

check-all: check-lint check-lock

check-lint:
	uv run ruff check

check-lock:
	uv lock --locked

clean:
	rm -rf .ruff_cache .venv build

fix-all: fix-lint lock

fix-lint:
	uv run ruff format

lock:
	uv lock

sync:
	uv sync --no-install-workspace

test:
	uv run python -m unittest discover -v -s ./choldate -p *test*.py

