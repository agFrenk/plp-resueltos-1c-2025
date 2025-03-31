
# Table of Contents

1.  [funciones utiles](#orgc185ad8)
    1.  [instalacion haskell mode](#org28acfe2)
2.  [Ejercicio 1](#orgcfe77f4)
3.  [Ejercicio 2](#orgdb68591)


<a id="orgc185ad8"></a>

# funciones utiles


<a id="org28acfe2"></a>

## instalacion haskell mode

    ;; Primero, eliminamos el paquete si está instalado
    (let ((pkg-desc (cadr (assoc 'haskell-mode package-alist))))
       (when pkg-desc
        (package-delete pkg-desc t)))  ; El argumento t fuerza la eliminación sin preguntar

    ;; Luego, instalamos el paquete
    (package-install 'haskell-mode)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((haskell . t)))


<a id="orgcfe77f4"></a>

# Ejercicio 1

Dar el tipo y describir el comportamiento de las siguientes funciones del módulo Prelude de Haskell:

null head tail init last take drop (++) concat reverse elem
null)

    main = print (:t null)

head)

    print (:t head)


<a id="orgdb68591"></a>

# Ejercicio 2

Definir las siguientes funciones:
a. valorAbsoluto :: Float → Float, que dado un número devuelve su valor absoluto.

    -- Función valorAbsoluto: devuelve el valor absoluto de un número.
    valorAbsoluto :: a -> a
    valorAbsoluto x = if x >= 0 then x else -x
    valorAbsoluto (-7)

b. bisiesto :: Int → Bool, que dado un número que representa un año, indica si el mismo es bisiesto.

    -- Función bisiesto: determina si un año es bisiesto.
    esSecular :: Int -> Bool
    esSecular x = if mod x 100 == 0 then (if mod x 400 == 0 then True else False) else True

    bisiesto :: Int -> Bool
    bisiesto x = if mod x 4 == 0 then (esSecular x) else False   -- Reemplaza 'undefined' con tu implementación

    bisiesto 2020
    bisiesto 200
    bisiesto 300
    bisiesto 400

c. factorial :: Int → Int, definida únicamente para enteros positivos, que computa el factorial.

    -- Función factorial: computa el factorial de un entero positivo.
    :{
    factorial :: Int -> Int
    factorial 1 = 1
    factorial x = x * factorial (x-1)
    :}
    factorial 2
    factorial 3

d. cantDivisoresPrimos :: Int → Int, que dado un entero positivo devuelve la cantidad de divisores primos.

    -- Función cantDivisoresPrimos: cuenta la cantidad de divisores primos de un entero positivo.
    :{

    cantDivisoresPrimos :: Int -> Int
    cantDivisoresPrimos x = iterarDivisores x x

    iterarDivisores:: Int -> Int -> Int
    iterarDivisores _ 1 = 0
    iterarDivisores x 2 = if mod x 2 == 0 then 1 else 0
    iterarDivisores x y = if mod x y == 0 && (esPrimo y) then (iterarDivisores x (y-1)) + 1 else (iterarDivisores x (y-1))

    esPrimo :: Int -> Bool
    esPrimo x = if x < 2 then False else esPrimoRecursivo x (x - 1)

    esPrimoRecursivo:: Int -> Int -> Bool
    esPrimoRecursivo _ 1 = True
    esPrimoRecursivo x y = if (mod x y == 0) then False else esPrimoRecursivo x (y-1)

    :}
    cantDivisoresPrimos 4141
    cantDivisoresPrimos 100
    cantDivisoresPrimos 42
    cantDivisoresPrimos 7
