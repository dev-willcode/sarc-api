from sarcapi.settings import TEMPLATE_DIR
from weasyprint import HTML, CSS
from django.template.loader import get_template
from django.http import HttpResponse


def generar_reporte(source, data):
    html_template = get_template(source + '.html').render(data)
    pdf_file = HTML(string=html_template).render(stylesheets=[CSS(TEMPLATE_DIR +'\\css\\' + source + '.css')]).write_pdf()
    response = HttpResponse(pdf_file, content_type='application/pdf')
    response['Content-Disposition'] = 'filename="' + source +'.pdf"'
    return response
