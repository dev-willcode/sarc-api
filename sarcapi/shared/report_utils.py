# from ...sarcapi.settings import TEMPLATES_DIR
from weasyprint import HTML, CSS
from django.template.loader import get_template
from django.http import HttpResponse

TEMPLATES_DIR = ''

def generar_reporte(source, data):
    html_template = get_template(TEMPLATES_DIR + source + 'template.html').render()
    pdf_file = HTML(string=html_template).render(stylesheets=[CSS(TEMPLATES_DIR)]).write_pdf()
    response = HttpResponse(pdf_file, content_type='application/pdf')
    response['Content-Disposition'] = 'filename="home_page.pdf"'
    return response
    