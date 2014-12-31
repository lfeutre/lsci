from scipy.interpolate import interpolate

from cytoolz.functoolz import compose

from lsci import logger

from lfe.encoders import encode as lfe_encode


def interp1d(value):
    if isinstance(value, interpolate.interp1d):
        logger.debug(value)
        kind = bytes(value._kind, "utf-8")
        data = (value.x, value.y, kind, value.axis, value.copy,
                value.bounds_error)
        value = (b"interp1d", data)
    return value


def encode(value):
    return compose(lfe_encode,
                   interp1d)(value)
