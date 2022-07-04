/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

DATOS = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, second_name:chararray,   date:chararray,  color:chararray, other_inf:int);
DATOS_1 = FILTER DATOS BY second_name matches '[D-K].*' ;
DATOS_2 = FOREACH DATOS_1 GENERATE second_name;
STORE DATOS_2 INTO 'output/' using PigStorage(',');

