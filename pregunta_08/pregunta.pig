/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

DATOS = LOAD 'data.tsv'
    AS (r1:CHARARRAY, r2:BAG{t: TUPLE(p:CHARARRAY)}, r3:MAP[]);
DATOS_1 = FOREACH DATOS  GENERATE r2, r3;
DATOS_2 = FOREACH DATOS_1 GENERATE FLATTEN(r2),FLATTEN(r3);
DATOS_3 = GROUP DATOS_2 BY ($0, $1);
DATOS_4 = FOREACH DATOS_3 GENERATE group , COUNT($1);
DUMP DATOS_4;

STORE DATOS_4 INTO 'output/' using PigStorage(',') ;
