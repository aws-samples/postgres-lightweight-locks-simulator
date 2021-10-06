#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys
import signal
import time

def sighandler(signum,frame):
  print('Signal hanlder called with signal',signum)


def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'django_app.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    print('registering sighandler')
    print(signal.SIGTERM)
    signal.signal(signal.SIGTERM, sighandler)
    print('registering sighandler')
    print(signal.SIGINT)
    signal.signal(signal.SIGINT, sighandler)
    print('sighandlers are registered')
    main()
