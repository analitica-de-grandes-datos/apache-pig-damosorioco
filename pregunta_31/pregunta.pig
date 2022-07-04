/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

DATOS = LOAD './data.csv' using PigStorage(',') AS (id:int, name:chararray, second_name:chararray, date:chararray, color:chararray, other_inf:int);
DATOS_1 = FOREACH DATOS GENERATE SUBSTRING(date, 0, 4) AS yearBirthday;
DATOS_2 = GROUP DATOS_1 BY yearBirthday;
DATOS_3 = FOREACH DATOS_2 GENERATE $0, COUNT($1);
STORE DATOS_3 INTO 'output/' using PigStorage(',');
