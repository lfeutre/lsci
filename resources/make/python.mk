ERL_PORT_LIB=deps/erlport/priv/python3
LFE_PY=deps/py/python
LIB=python
VENV=$(LIB)/.venv
REQS=$(LIB)/requirements.txt

venv:
	python3 -m venv $(VENV)

get-py-deps:
	. $(VENV)/bin/activate && \
	pip3 install -r $(REQS)

python: venv get-py-deps
	@-ln -s ../$(LFE_PY)/lfe $(LIB)/

interp:
	@. $(VENV)/bin/activate && \
	PYTHONPATH=$(LIB):$(ERL_PORT_LIB):$(LFE_PY) \
	python3
