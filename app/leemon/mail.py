from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives

def send(to_email, purchase_id, attach_pdf, attach_txt):
    subject = 'Leemon Market - Recibo de compra {}'.format(purchase_id)
    from_email = 'test@stupacode.com'
    to = to_email
    text_content = 'Gracias por su compra en Leemon Market, se adjunta datos personales y recibo de compra'
    html_content = 'Gracias por su compra en Leemon Market, se adjunta datos personales y recibo de compra'
    message = EmailMultiAlternatives(subject, text_content, from_email, [to])
    message.attach_alternative(html_content, "text/html")

    message.attach_file(attach_pdf)
    message.attach_file(attach_txt)
    message.send()
