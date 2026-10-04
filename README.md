# Optimización de Empaque de Productos mediante Arquitectura MIPS

**Asignatura:** UCOM250_81 - Organización y Arquitectura de Computadores  
**Integrantes:** Alex Andrés Naranjo Ordóñez, Dimas Daniel Borbor Pozo  
**Año:** 2026  
**Fecha:** 3 de octubre de 2026

---

## Descripción

### Escenario

Una empresa tiene productos que deben colocarse en cajas de igual capacidad, teniendo una cantidad inicial de productos (125 unidades) y una capacidad máxima fijada por caja (12 unidades). El problema reside en que no todas las cajas quedan completas al ser empacadas. La solución consiste en calcular y separar el número de cajas completas de los productos sobrantes, imprimiendo en pantalla la cantidad de productos sin empacar.

### Resultado

El programa debe calcular el cociente entero (cajas completas) y el residuo (productos sobrantes) a partir de los datos almacenados en memoria. Posteriormente, debe evaluar mediante un salto condicional si existen sobrantes: si los hay, muestra el mensaje `"Productos sin empacar: "` seguido del valor del residuo (`5`); en caso contrario, imprime `"Empaque completo"`. Además, actualiza los resultados correspondientes en la memoria de datos.

---

## Análisis

### Datos del programa

| Dato | Valor inicial | Propósito |
|---|---:|---|
| Dato 1 (`dato1`) | `125` | Almacena la cantidad total de productos a empacar. |
| Dato 2 (`dato2`) | `12` | Almacena la capacidad máxima de cada caja. |
| Resultado 1 (`resultado1`) | `0` | Reservado en memoria para guardar las cajas completas calculadas (`10`). |
| Resultado 2 (`resultado2`) | `0` | Reservado en memoria para guardar la cantidad de productos sobrantes (`5`). |
| Resultado 3 (`resultado3`) | `0` | Reservado para indicar si coincide exactamente productos y capacidad (`0` = Falso). |

### Operaciones requeridas

| Datos / Resultados | Propósito | Operación requerida | Instrucción MIPS |
|---|---|---|---|
| Dato 1 | Cargar la cantidad de productos desde memoria | Carga | `lw` |
| Dato 2 | Cargar la capacidad por caja desde memoria | Carga | `lw` |
| Resultado 1 | Calcular la cantidad de cajas completas (125 / 12) | División entera | `div` |
| Resultado 2 | Calcular los productos sobrantes sin empacar (125 % 12)[cite: 12, 15] | Residuo / Módulo[cite: 12, 15] | `rem`[cite: 12, 15] |
| Resultado 3 | Verificar si la cantidad de productos coincide con la capacidad[cite: 12, 15] | Comparación de igualdad[cite: 12, 15] | `seq`[cite: 12, 15] |
| Almacenamiento | Guardar los resultados calculados de vuelta en la memoria[cite: 12, 15] | Almacenamiento[cite: 12, 15] | `sw`[cite: 12, 15] |
| Control de flujo | Evaluar si existen productos sobrantes (residuo != 0)[cite: 12, 15] | Salto condicional[cite: 12, 15] | `bne`[cite: 12, 15] |
| Salida por consola | Imprimir texto y valores enteros en pantalla[cite: 12, 15] | Llamada al sistema[cite: 12, 15] | `syscall`[cite: 12, 15] |

---

## Implementación

El código está completo, comentado e implementado en ensamblador MIPS[cite: 12, 15].

### Versión base

La carpeta `version_base/` contiene la plantilla y el programa inicial proporcionado como punto de partida[cite: 12, 15].

**Archivo:**

```text
version_base/programa_base.s