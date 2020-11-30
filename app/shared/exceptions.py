from rest_framework.views import exception_handler
from rest_framework.response import Response
from rest_framework import status
from django.db.models import ProtectedError


def custom_exception_handler(exc, context):
    response = exception_handler(exc, context)

    try:
        if isinstance(exc, ProtectedError):
            return Response({'Error de integridad': ['la entidad esta siendo utilizada en otro registro']}, status=status.HTTP_400_BAD_REQUEST)

        if response is None:
            exc_list = str(exc).split("DETAIL: ")[1].split('CONTEXT: ')
            return Response({'error': [exc_list[0]]}, status=status.HTTP_400_BAD_REQUEST)
        
        return response
    except:
        return response
