/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
DATOS = LOAD './data.tsv' AS (letter:chararray, date:chararray, amount:int);
DATOS_1 = ORDER DATOS BY amount;
DATOS_2 = limit DATOS_1 5;
DATOS_3 = FOREACH DATOS_2 GENERATE amount;

STORE DATOS_3 INTO 'output/' using PigStorage(',');