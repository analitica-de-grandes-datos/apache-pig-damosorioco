/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
DATOS = LOAD './data.tsv' AS (letter:chararray, setTuplesLetters:bag{}, arrayLetters:map[]);
DATOS_1 = FOREACH DATOS GENERATE letter, (int)COUNT(setTuplesLetters) AS totalCol2 , (int) SIZE(arrayLetters) AS totalCol3;
DATOS_2 = ORDER DATOS_1 BY letter, totalCol2, totalCol3;
STORE DATOS_2 INTO 'output/' using PigStorage(',');