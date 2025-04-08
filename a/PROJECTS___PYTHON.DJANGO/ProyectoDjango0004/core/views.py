from django.http import HttpResponse
from django.shortcuts import render

# ------------------------------------------------------------------------------
html_base = """
   <h1>Mi web personal</h1>
   <ul>
      <li><a href="/">Portada</a></li>
      <li><a href="/about-me/">Acerca de mí</a></li>
      <li><a href="/portafolio/">Portafolio</a></li>
      <li><a href="/contact/">Contacto</a></li>
   </ul>
"""
# ------------------------------------------------------------------------------
def home(request):
    return HttpResponse(html_base + """
                        <h2>Portada</h2>
                        <p>Esto es la portada</p> 
                        """) 

def about(request):
    return HttpResponse(html_base + """
                        <h2>Acerca de mí</h2>
                        <p>Esto es la página acerca de mí</p>
                        <p>Me llamo Walter y soy programador Python</p>
                        """)
# ------------------------------------------------------------------------------
def portafolio(request):
    return HttpResponse(html_base + """
                        <h2>Portafolio</h2>
                        <p>Alguno de mis trabajos</p> 
                        """)    

def contact(request):
    return HttpResponse(html_base + """
                        <h2>Contact</h2>
                        <p>Aquí os dejo mi email para preguntarme dudas: <a href="mailto:walter@gmail.com">walter@gmail.com</a></p>
                        <p>Me llamo Walter y soy programador Python</p>
                        """)
# ------------------------------------------------------------------------------

