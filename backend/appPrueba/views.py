from django.http import JsonResponse

def saludo(request):
    return JsonResponse({"saludo": "Hola desde Django 👋"})
