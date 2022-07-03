/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/

DATOS = LOAD './data.csv' using PigStorage(',') AS (num:int, name:chararray, second_name:chararray, time:chararray, color:chararray, other_inf:int);
DATOS_1 = FOREACH DATOS GENERATE color;
DATOS_2 = FILTER DATOS_1 BY ($0 matches '.*b.*');
DUMP DATOS_1;
STORE DATOS_2 INTO 'output/' using PigStorage(',');
