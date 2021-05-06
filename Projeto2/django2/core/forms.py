from django import forms
from django.core.mail.message import EmailMessage

class ContatoForms(forms.Form):
    nome = forms.CharField(label='Nome', max_length=100)
    email = forms.CharField(label='E-mail', max_length=120)
    assunto = forms.CharField(label='Assunto', max_length=150)
    mensagem = forms.CharField(label='Mensagem', widget=forms.Textarea())

    def senf_mail(self):
        nome = self.cleaned_data['nome']
        email = self.cleaned_data['email']
        assunto = self.cleaned_data['assunto']
        mensagem = self.cleaned_data['mensagem']
        conteudo = f'Nome: {nome}\nE-mail: {email}\nAssunto: {assunto}\nMensagem: {mensagem}'

        mail = EmailMessage(
            subject=assunto,
            body=conteudo,
            to=['thor.souzajesus@gmail.com'],
            from_email='thor.souzajesus@seudominio.com.br',
            headers={'Replay-to': email}
        )

        mail.send()