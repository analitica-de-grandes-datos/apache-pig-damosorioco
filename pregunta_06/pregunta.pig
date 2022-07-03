/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

DATOS = LOAD './data.tsv' AS (letter:chararray, bagArray:chararray, M:map [] );
DATOS_1 = FOREACH DATOS GENERATE M;
DATOS_2 = FOREACH DATOS_2 GENERATE FLATTEN(M);  
DATOS_3 = GROUP DATOS_2 BY $0;
DATOS_4 = FOREACH DATOS_3 GENERATE group, COUNT($1);
STORE DATOS_4 INTO 'output/' using PigStorage(',');