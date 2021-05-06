from django.shortcuts import render
from .forms import ContatoForms
from django.contrib import messages


def index(request):
    return render(request, 'index.html')


def contato(request):
    form = ContatoForms(request.POST or None)

    if str(request.method) == 'POST':
        if form.is_valid():
            form.senf_mail()
            messages.success(request, "Formulário enviado com sucesso")
            form = ContatoForms()
        else:
            messages.error(request, "Erro ao enviar o formulário")

    context = {
        "form": form
    }
    return render(request, 'contato.html', context)


def produto(request):
    return render(request, 'produto.html')
