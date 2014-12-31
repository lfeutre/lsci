from erlport.erlang import set_encoder, set_decoder

from lfe import obj as lfe_obj

from lsci import decoders, encoders, logger


def setup():
    logger.info("Setting up lsci Python ...")
    lfe_obj.init()
    setup_encoders()
    setup_decoders()


def setup_encoders():
    set_encoder(encoders.encode)


def setup_decoders():
    set_decoder(decoders.decode)
