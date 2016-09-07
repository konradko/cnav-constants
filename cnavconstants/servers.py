import os

from cnavconstants.utils import LOCAL_ADDRESS, SERVICE_PORT


LED_MATRIX_PORT = int(os.getenv('LED_MATRIX_PORT', 48643))
LOCAL_LED_MATRIX_ADDRESS = LOCAL_ADDRESS.format(port=LED_MATRIX_PORT)
LED_MATRIX_PORT_ADDRESS = SERVICE_PORT.format(port=LED_MATRIX_PORT)
