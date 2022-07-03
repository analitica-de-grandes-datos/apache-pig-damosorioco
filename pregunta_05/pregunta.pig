/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
DATOS = LOAD 'data.tsv' USING PigStorage('\t')  AS (row:chararray, col2:bag{dict:TUPLE(letter:chararray)}, col3:MAP[]);

DATOS_1 = FOREACH DATOS GENERATE col2; 
DATOS_2 = FOREACH DATOS_1 GENERATE FLATTEN(col2) AS word; 
DATOS_3 = FOREACH DATOS_2 BY word;
DATOS_4 = FOREACH DATOS_3 GENERATE group, COUNT(DATOS_2);

STORE DATOS_4 INTO 'output' USING PigStorage(',');