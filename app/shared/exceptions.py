from rest_framework.views import exception_handler
from rest_framework.response import Response
from rest_framework import status

def custom_exception_handler(exc, context):
    response = exception_handler(exc, context)

    if response is None:
        exc_list = str(exc).split("DETAIL: ")[1].split('CONTEXT: ')
        response = Response({'error' : [exc_list[0]]}, status=status.HTTP_400_BAD_REQUEST)

    return response