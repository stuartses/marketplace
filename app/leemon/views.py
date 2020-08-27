from django.shortcuts import get_list_or_404, render
from django.http import HttpResponse
import json
from leemon import render_pdf
from leemon import save_txt
from leemon import mail

from .models import Category, Product, Customers, Image, Purchases


def index(request):
    category_list = Category.objects.order_by('name')
    context = {'category_list': category_list}

    return render(request, 'leemon/index.html', context)

def products(request, id_cat):
    product_list = get_list_or_404(Product.objects.filter(id_category=id_cat))
    product_dict = {}

    for product in product_list:
        product_data = product.__dict__
        product_data.pop('_state', None)
        product_data['amount'] = 0 # add amount
        product_dict[product.id] = product_data

    product_json = json.dumps(product_dict)

    context = {
        'product_list': product_list,
        'product_json': product_json
    }

    return render(request, 'leemon/products.html', context)

def basket(request):
    return render(request, 'leemon/basket.html')

def new_user(request):
    return render(request, 'leemon/new_user.html')

def register_user(request):
    image_list = Image.objects.all()
    context = {'image_list': image_list}

    if (request.method == "POST"):
        new = Customers()
        new.name = request.POST.get('name')
        new.city = request.POST.get('city')
        new.email = request.POST.get('email')
        new.nit = request.POST.get('nit')
        new.card_number = request.POST.get('card_number')
        new.card_exp = request.POST.get('card_exp')
        new.address = request.POST.get('address')
        new.save()

        id = new.id
        context['id'] = id

    return render(request, 'leemon/register_user.html', context)

def save_image(request):
    context = {}

    if (request.method == "POST"):
        user = Customers.objects.get(id=request.POST.get('id'))
        user.id_image = request.POST.get('image_id')
        user.text_image = request.POST.get('text_image')
        user.save()

        context = {'id': user.id }

    return render(request, 'leemon/purchase.html', context)

def purchase(request):
    details = {}
    if (request.method == "POST"):
        new_purchase = Purchases()
        user = Customers.objects.get(id=request.POST.get('user_id'))
        image = Image.objects.get(id=user.id_image)
        new_purchase.id_customer = user
        new_purchase.products = request.POST.get('products')
        new_purchase.save()

        purchase_id = new_purchase.id
        products = json.loads(new_purchase.products)
        pr = []

        for i in range(len(products) - 1):
            pr.append(products[i])

        total = products[len(products) - 1]

        details = {
            'purchase_id': purchase_id,
            'products': pr,
            'total': total,
            'image_url': image.url,
            'image_text': user.text_image,
            'user_name': user.name,
            'user_nit': user.nit
            }

        txt_path = save_txt.save(user.__dict__)

        pdf_path = render_pdf.render_to_file('leemon/confirmation.html',
                                             details)
        # mail.send(user.email, purchase_id, pdf_path[1], txt_path)

    # return HttpResponse(pdf_path)
    return render(request, 'leemon/confirmation.html', details)
