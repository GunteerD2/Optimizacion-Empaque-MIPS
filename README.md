# Optimización de Empaque de Productos mediante Arquitectura MIPS

**Asignatura:** UCOM250_81 - Organización y Arquitectura de Computadores  
**Integrantes:** Alex Andrés Naranjo Ordóñez, Dimas Daniel Borbor Pozo  
**Año:** 2026  
**Fecha:** 3 de octubre de 2026

---

## Descripción

### Escenario

Una empresa tiene productos que deben colocarse en cajas de igual capacidad, teniendo una cantidad inicial de productos (125 productos) y de capacidad por caja (12 unidades). El problema reside en que no todas las cajas están completas, y la manera de solucionarlo es separando las cajas completas de los productos que sobran e imprimiendo la cantidad de productos sobrantes.

### Resultado

El programa calcula de manera automatizada el número de cajas completas empaquetadas (10 cajas) y determina la cantidad sobrante de productos sin empacar (5 productos). Además, verifica mediante una comparación lógica si la cantidad inicial de productos equivale a la capacidad de las cajas. Finalmente, evalúa mediante un salto condicional si existen sobrantes e imprime por pantalla el mensaje correspondiente con la cantidad de productos sin empacar o el mensaje de empaque completo.

---

## Análisis

### Datos del programa

Identificación de los datos proporcionados y almacenados en memoria dentro del escenario planteado:

| Dato | Valor inicial | Propósito |
|---|---:|---|
| `dato1` | 125 | Representa la cantidad total de productos a empaquetar. |
| `dato2` | 12 | Representa la capacidad máxima de cada caja. |
| `resultado1` | 0 | Almacena el número de cajas completas calculadas. |
| `resultado2` | 0 | Almacena la cantidad de productos sobrantes. |
| `resultado3` | 0 | Almacena la verificación de equivalencia entre productos y capacidad (1 = Verdadero, 0 = Falso). |

### Operaciones requeridas

Relación de las operaciones necesarias para resolver el escenario con sus correspondientes instrucciones MIPS:

| Datos / Resultados | Propósito | Operación requerida | Instrucción MIPS |
|---|---|---|---|
| `dato1` | Cargar cantidad de productos desde memoria al registro `$t0` | Carga | `lw` |
| `dato2` | Cargar capacidad de caja desde memoria al registro `$t1` | Carga | `lw` |
| `Resultado 1` | Calcular el número de cajas completas empaquetadas (`$t0 / $t1`) | División | `div` |
| `Resultado 2` | Calcular la cantidad de productos sobrantes sin empacar (`$t0 % $t1`) | Residuo | `rem` |
| `Resultado 3` | Verificar si productos y capacidad son equivalentes (`$t0 == $t1`) | Comparación | `seq` |
| `resultado1`, `2`, `3` | Guardar resultados obtenidos desde registros hacia la memoria | Almacenamiento | `sw` |
| Control de flujo | Evaluar si existe residuo (`$t3 != 0`) para saltar a impresión de sobrantes | Salto condicional | `bne` |
| Impresión | Mostrar mensajes de salida y valores numéricos en la consola | Llamadas al sistema | `syscall` |

---

## Implementación

El código ensamblador MIPS fue desarrollado y probado de manera funcional en el simulador Mipsy.

### Versión base

La carpeta `version_base/` contiene el programa inicial utilizado como punto de partida.

**Archivo:** `version_base/programa_base.s`

### Versión final

La carpeta `version_final/` contiene la solución optimizada y documentada.

**Archivo:** `version_final/programa_final.s`

**Código fuente MIPS:**

```assembly
.data
    dato1:                   .word 125                           # productos
    dato2:                   .word 12                            # capacidad
    resultado1:              .word 0                             # cajas completas
    resultado2:              .word 0                             # producto sobrante 
    resultado3:              .word 0                             # coincidencia entre cajas y productos
    mensaje_productosresiduo:.asciiz "Productos sin empacar: "  # mensaje productos sobrantes
    mensaje_productoscom:    .asciiz "Empaque completo"          # mensaje empaque completo

.text
.globl main

main:
    # Carga de datos desde memoria
    lw $t0, dato1            # cargamos la cantidad de productos en $t0
    lw $t1, dato2            # cargamos la capacidad de las cajas en $t1

    # Operaciones aritméticas y lógicas
    div $t2, $t0, $t1        # operacion para calcular cajas completas
    rem $t3, $t0, $t1        # operacion para calcular el sobrante de los productos
    seq $t4, $t0, $t1        # pregunta si coinciden los productos y las cajas

    # Almacenamiento de resultados en memoria
    sw $t2, resultado1       # guardamos la cantidad de cajas completas
    sw $t3, resultado2       # guardamos la cantidad de producto sobrante
    sw $t4, resultado3       # guardamos coincidencia (0 o 1)

    # Control de flujo e impresión
    bne $t3, $zero, sobrante # si residuo != 0 salta a la etiqueta sobrante

    # Impresión si el empaque está completo (residuo == 0)
    li $v0, 4                # syscall 4: imprimir cadena de texto
    la $a0, mensaje_productoscom
    syscall
    
    li $v0, 10               # finalización limpia del programa
    syscall

sobrante:
    li $v0, 4                # syscall 4: imprimir cadena de texto
    la $a0, mensaje_productosresiduo
    syscall

    li $v0, 1                # syscall 1: imprimir entero
    add $a0, $t3, $zero      # movemos la cantidad sobrante ($t3) a $a0
    syscall

    li $v0, 10               # finalización limpia del programa
    syscall
