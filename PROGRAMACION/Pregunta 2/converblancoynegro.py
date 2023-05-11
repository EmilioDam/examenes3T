# IMPORTAR LIBRERIAS
from PIL import Image
import math

# ABRE LA IMAGEN "Mono.jpg" UBICADA EN LA RAIZ DEL PROGRAMA
imagen = Image.open("jv.jpg")
pixeles = imagen.load()
print(imagen.size) # MUESTRA POR PANTALLA EL TAMAÑO DE LA IMAGEN

print(pixeles[0,0])

altura = imagen.size[1]
anchura = imagen.size[0]

# RECORRE TODOS LOS PIXELES DE LA IMAGEN

for x in range(0,anchura):
    for y in range(0,altura):
        rojo = pixeles[x,y][0]
        verde = pixeles[x,y][1]
        azul = pixeles[x,y][2]
        color = math.floor((rojo+verde+azul)/3)

        if color > 127:
            rojo = 255
            verde = 255
            azul = 255
        else:
            rojo = 0
            verde = 0
            azul = 0

        pixeles[x,y] = (rojo,verde,azul)
        
# GUARDA UNA COPIA EN BLANCO Y NEGRO CON EL NOMBRE ESPECIFICADO EN LA RAIZ DEL PROGRAMA
imagen.save("jvblancoynegro.png")
