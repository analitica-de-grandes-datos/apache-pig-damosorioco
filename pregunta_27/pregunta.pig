/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       LOCATE('ia', firstname) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

DATOS = LOAD './data.csv' using PigStorage(',') AS (id:int, name:chararray, second_name:chararray, date:chararray, color:chararray, other_inf:int);
DATOS_1 = FOREACH DATOS GENERATE INDEXOF(name, 'ia');
STORE DATOS_1 INTO 'output/' using PigStorage(',');
