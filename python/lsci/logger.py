import logging


logging.basicConfig(
    format='[%(asctime)s] [lsci:py] [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M',
    level=logging.DEBUG)


warn = logging.warning
info = logging.info
debug = logging.debug
err = logging.error
crit = logging.critical
