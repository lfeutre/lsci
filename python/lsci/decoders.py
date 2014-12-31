import numpy as np

from scipy.interpolate import interpolate

from cytoolz.functoolz import compose

from lsci import logger

from lfe import decoders as lfe_decoders


def dicts(value):
    logger.debug("Value: ", value)
    if (isinstance(value, list)
        and len(value) > 0
        and isinstance(value[0], np.ndarray)):
        pass
    else:
        value = lfe_decoders.dicts(value)
    return value


def interp1d(value):
    if (isinstance(value, tuple)
        and len(value) == 2
        and value[0] == b"interp1d"):
        logger.debug(value)
        (x, y, kind, axis, copy, bounds_error) = value[1]
        kind = kind.decode("utf-8")
        value = interpolate.interp1d(
            x, y, kind=kind, axis=axis, copy=copy,
            bounds_error=bounds_error)
    return value


def decode(value):
    return compose(dicts,
                   lfe_decoders.dates,
                   lfe_decoders.datetimes,
                   lfe_decoders.times,
                   lfe_decoders.timedeltas,
                   interp1d)(value)
