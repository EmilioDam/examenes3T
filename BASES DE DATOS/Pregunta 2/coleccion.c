/*
    Programa Coleccion de CDs V 1.0 por Emilio Cifuentes Lloret
*/
#include <stdio.h>
#include <string.h>
#define PI 3.1416
#define NOMBREPROGRAMA "Programa Colleccion de CDs"
#define VERSION "1.0"
#define AUTOR "Emilio Cifuentes Lloret"

int main(int argc,char *argv[]){
    
    // CREAMOS UNA ESTRUCTURA Y LE AÑADIMOS LOS REGISTROS
    
    struct RegistroCDs{
        char Titulo[50];
        char Artista[50];
        char Anolanzamiento[50];
        char Generomusical[50];
    };
        
    struct RegistroCDs coleccion [100];

    // INICIALIZAMOS EL NÚMERO DE RESGISTROS A 3, QUE ES EL NÚMERO DE REGISTROS QUE YA HEMOS AÑADIDO
    int numero_registros = 3; 

    strcpy(coleccion[0].Titulo,"Get a Grip");
    strcpy(coleccion[0].Artista,"Aerosmith");
    strcpy(coleccion[0].Anolanzamiento,"1993");
    strcpy(coleccion[0].Generomusical,"Rock");

    

    strcpy(coleccion[1].Titulo,"Zeit");
    strcpy(coleccion[1].Artista,"Rammstein");
    strcpy(coleccion[1].Anolanzamiento,"2019");
    strcpy(coleccion[1].Generomusical,"Metal");

    

    strcpy(coleccion[2].Titulo,"Black");
    strcpy(coleccion[2].Artista,"Metallica");
    strcpy(coleccion[2].Anolanzamiento,"1991");
    strcpy(coleccion[2].Generomusical,"Thrash Metal");
 
    

    int num_registros = 3; // VARIABLE PARA SAVER EL NÚMERO DE REGISTROS QUE TENEMOS
    
    // MENSAJE DE BIENVENIDA
    printf("%s %s \n",NOMBREPROGRAMA,VERSION);
    printf("por %s \n",AUTOR);
    printf("Selecciona una opcion: \n");
    printf("\t1 - Listado de registros \n");
    printf("\t2 - Introducir un registro \n");
    printf("\t3 - Eliminar un registro \n");
    printf("\t4 - Buscar un registro \n");
    printf("\t5 - Actualizar un registro \n");
    printf("Tu opcion: \n");
    
    char opcion = getchar();
    printf("La opcion que has seleccionado es: %c \n",opcion);
    printf("\n");

    // INDICAMOS QUE HACEMOS EN CADA PARTE DEL PROGRAMA
    switch(opcion){
        // EN EL CASO 1 SE OFRECEN LAS OPCIONES
        case '1':
            printf("Listado de registros: \n");
            printf("\n");
            for(int i = 0;i<10;i = i + 1){
                if(strcmp(coleccion[i].Titulo,"")){
                    printf("El Titulo es: %s \n",coleccion[i].Titulo);
                    printf("El Artista es: %s \n",coleccion[i].Artista);
                    printf("Ano de lanzamiento: %s \n",coleccion[i].Anolanzamiento);
                    printf("Genero musical: %s \n",coleccion[i].Generomusical);
                    printf("\n");
                    }
        }
        break;
        // EN EL CASO 2 SE INTRODUCE UN REGISTRO
        case '2':
            printf("Introducir un nuevo registro \n");
            printf("Introduce el titulo del CD: \n");
            scanf("%s",coleccion[numero_registros].Titulo);
            printf("Introduce el artista: \n");
            scanf("%s",coleccion[numero_registros].Artista);
            printf("Introduce el año de lanzamiento: \n");
            scanf("%s",coleccion[numero_registros].Anolanzamiento);
            printf("Introduce el genero musical: \n");
            scanf("%s",coleccion[numero_registros].Generomusical);
            printf("Registro introducido con exito \n");
            numero_registros++;
            break;
        // EN EL CASO 3 SE ELIMINA UN REGISTRO
        case '3':
            printf("Eliminar un registro \n");
            printf("Introduce el titulo del CD a eliminar: \n");
            char titulo_eliminar[50];
            scanf("%s",titulo_eliminar);
            int indice_eliminar = -1;
            for(int i = 0;i<numero_registros;i++){
                if(strcmp(coleccion[i].Titulo,titulo_eliminar)==0){
                    indice_eliminar = i;
                    break;
                }
            }
        if(indice_eliminar == -1){
            printf("No se encontro el registro \n");
        }else{
            for(int i = indice_eliminar;i<numero_registros-1;i++){
                coleccion[i] = coleccion[i+1];
            }
            numero_registros--;
            printf("Registro eliminado con exito \n");
        }
        break;

        // EN EL CASO 4 BUSCA UN REGISTRO INTRODUCIDO
        case '4':
            printf("Buscar un registro \n");
            printf("Introduce el titulo del CD a buscar: \n");
            char titulo_buscar[50];
            scanf("%s",titulo_buscar);
            int indice_buscar = -1;
            for(int i = 0;i<numero_registros;i++){
                if(strcmp(coleccion[i].Titulo,titulo_buscar)==0){
                    indice_buscar = i;
                    break;
                }
            }
            if(indice_buscar == -1){
                printf("No se encontro el registro \n");
            }else{
                printf("Registro encontrado: \n");
                printf("Titulo: %s \n",coleccion[indice_buscar].Titulo);
                printf("Artista: %s \n",coleccion[indice_buscar].Artista);
                printf("Año de lanzamiento: %s \n",coleccion[indice_buscar].Anolanzamiento);
                printf("Genero musical: %s \n",coleccion[indice_buscar].Generomusical);
            }
            break;
        // EN EL CASO 5 ACTUALIZA UN REGISTRO
        case '5':
            printf("Actualizar un registro \n");
            printf("Introduce el titulo del CD a actualizar: \n");
            char titulo_actualizar[50];
            scanf("%s",titulo_actualizar);
            int indice_actualizar = -1;
            for(int i = 0;i<numero_registros;i++){
                if(strcmp(coleccion[i].Titulo,titulo_actualizar)==0){
                    indice_actualizar = i;
                    break;
                }
            }
            if(indice_actualizar == -1){
                printf("No se encontro el registro \n");
            }else{
                printf("Introduce el nuevo titulo: \n");
                scanf("%s",coleccion[indice_actualizar].Titulo);
                printf("Introduce el nuevo artista: \n");
                scanf("%s",coleccion[indice_actualizar].Artista);
                printf("Introduce el nuevo ano de lanzamiento: \n");
                scanf("%s",coleccion[indice_actualizar].Anolanzamiento);
                printf("Introduce el nuevo genero musical: \n");
                scanf("%s",coleccion[indice_actualizar].Generomusical);
                printf("El registro se actualizo con exito! \n");
            }
            break;
        default:
            printf("La opcion seleccionada no es valida \n");
            
    }
    printf("Finalizando la ejecucion del programa... \n");
    printf("\n");
    return 0;
    
}