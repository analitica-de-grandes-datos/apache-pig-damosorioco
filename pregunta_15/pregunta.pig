/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

DATOS = LOAD 'data.csv' USING PigStorage(',') AS (id:int, name:chararray, second_name:chararray, date:datetime, color:chararray, cant:int);

DATOS_1 = FOREACH DATOS GENERATE name, color;
DATOS_2 = FILTER DATOS_1 BY color == 'blue' AND STARTSWITH(name,'Z');
DATOS_3 = FOREACH DATOS_2 GENERATE CONCAT(name,' ',color);
STORE DATOS_3 INTO 'output' USING PigStorage(',');
