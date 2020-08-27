from io import BytesIO
from django.http import HttpResponse
from django.template.loader import get_template
from django.conf import settings
import xhtml2pdf.pisa as pisa
import os


def link_callback(uri, rel):
    # use short variable names
    sUrl = settings.STATIC_URL      # Typically /static/
    sRoot = settings.STATIC_ROOT    # Typically /home/userX/project_static/
    mUrl = settings.MEDIA_URL       # Typically "" if not defined in settings.py
    mRoot = settings.MEDIA_ROOT     # Typically /home/userX/project_static/media/

    # convert URIs to absolute system paths
    if uri.startswith(sUrl):
        # Replaces 'static/image.png' with 'c:\\my-project\\collected-static/image.png'
        path = os.path.join(sRoot, uri.replace(sUrl, ""))
    elif uri.startswith(mUrl):
        # MEDIA_URL default value is "" so everything matches this
        path = os.path.join(mRoot, uri.replace(mUrl, ""))
    print ("*** {} ****".format(path))
    # make sure that file exists
    if not os.path.isfile(path):
        raise Exception('media URI must start with %s or %s' % (sUrl, mUrl))
    return path

    """
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
    """


def render_to_file(path: str, params: dict):
    template = get_template(path)
    html = template.render(params)
    file_name = "{}-{}.pdf".format('Recibo_de_compra', params['purchase_id'])
    file_path = os.path.join(os.path.abspath(os.path.dirname("__file__")),"",
                             file_name)
    with open(file_path, 'wb') as pdf:
        pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), pdf,
                          link_callback=link_callback)

    return [file_name, file_path]
