"""
WSGI config for prediksicovidjatim project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "main.settings")

from django.core.wsgi import get_wsgi_application

application = get_wsgi_application()

from whitenoise import WhiteNoise

application = WhiteNoise(application, root=os.path.join(os.path.dirname(__file__), 'static'))

app = application
