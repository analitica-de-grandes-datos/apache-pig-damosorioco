/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/

DATOS = LOAD './data.csv' using PigStorage(',') AS (driverId:int, truckId:int, eventTime:chararray, eventType:chararray, longitude:double, latitude: double, eventKey:chararray, correlationId:chararray, driverName:chararray, routeId:biginteger, eventDate:chararray)

DATOS_1: limit DATOS 10;
DATOS_2: FOREACH DATOS_1 GENERATE driverId, truckId, eventTime;
DATOS_3: ORDER DATOS_2 BY driverId, truckId, eventTime;

STORE DATOS_3 INTO 'output/' using PigStorage(',');
