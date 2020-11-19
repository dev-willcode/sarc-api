from sarcapi.settings import STATICFILES_DIRS
from weasyprint import HTML, CSS
from django.template.loader import get_template
from django.http import HttpResponse

# separador en localhost
# separador = '\\'
# separador en producción
separador = '/'


def generar_reporte(source, data):
    html_template = get_template(source + '.html').render(data)
    pdf_file = HTML(string=html_template).render(stylesheets=[CSS(
        STATICFILES_DIRS[0] + separador + 'css'+separador + source + '.css')]).write_pdf()
    response = HttpResponse(pdf_file, content_type='application/pdf')
    response['Content-Disposition'] = 'filename="' + source + '.pdf"'
    return response
