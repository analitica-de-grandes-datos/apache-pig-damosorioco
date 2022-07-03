/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

DATOS  = LOAD 'data.csv' USING PigStorage(',') AS (Id:int, name:chararray, second_name:chararray, date:datetime, color:chararray, cant:int);

DATOS_1 = FOREACH DATOS GENERATE second_name , SIZE(second_name) AS size_sn;
DATOS_2 = ORDER DATOS_1 BY size_sn desc, second_name;
DATOS_3 = LIMIT DATOS_2 5;
STORE DATOS_3 INTO 'output' USING PigStorage(',');