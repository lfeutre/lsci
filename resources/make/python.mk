ERL_PORT_LIB=deps/erlport/priv/python3
LFE_PY=deps/py/python
LIB=python
VENV=$(LIB)/.venv
REQS=$(LIB)/requirements.txt
GET_PIP=$(LIB)/get-pip.py

venv:
	python3 -m venv --without-pip $(VENV)

$(GET_PIP):
	wget -O $(GET_PIP) https://bootstrap.pypa.io/get-pip.py
	. $(VENV)/bin/activate && \
	python3 $(GET_PIP)

get-py-deps: $(GET_PIP)
	. $(VENV)/bin/activate && \
	pip3 install -r $(REQS)

python: venv get-py-deps
	@-ln -s ../$(LFE_PY)/lfe $(LIB)/

interp:
	@. $(VENV)/bin/activate && \
	PYTHONPATH=$(LIB):$(ERL_PORT_LIB):$(LFE_PY) \
	python3
