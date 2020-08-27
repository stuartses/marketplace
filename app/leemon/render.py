from io import BytesIO
from django.http import HttpResponse
from django.template.loader import get_template
import xhtml2pdf.pisa as pisa
import os


class Render:

    @staticmethod
    def render(path: str, params: dict):
        template = get_template(path)
        html = template.render(params)
        response = BytesIO()
        file = open("my.file.pdf", "wb")
        pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), file)
        file.close()
        if not pdf.err:
            return HttpResponse(response.getvalue(),
                                content_type='application/pdf')
        else:
            return HttpResponse("Error Rendering PDF", status=400)

    @staticmethod
    def render_to_file(path: str, params: dict):
        template = get_template(path)
        html = template.render(params)
        file_name = "{}-{}.pdf".format('Recibo_de_compra',
                                       params['purchase_id'])
        file_path = os.path.join(os.path.abspath(os.path.dirname("__file__")),
                                 "", file_name)
        with open(file_path, 'wb') as pdf:
            pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), pdf)

        return [file_name, file_path]
