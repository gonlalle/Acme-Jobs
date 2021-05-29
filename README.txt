# README.txt
#
# Copyright (C) 2012-2021 Rafael Corchuelo.
#
# In keeping with the traditional purpose of furthering education and research, it is
# the policy of the copyright owner to permit non-commercial use and redistribution of
# this software. It has been tested carefully, but it is not guaranteed for any particular
# purposes.  The copyright owner does not offer any warranties or representations, nor do
# they accept any liabilities with respect to them.

This is the Acme-Planner.

Link GitHub Repository: https://github.com/gonlalle/Acme-Planner
Link GitHub Release: 1.0.0

For Clever Cloud:
Git username: gonlalle
Git password: acme-plannerDP2ç

Instrucciones para poder ver datos variados en aquellas gráficas que son de una semana concreta:

Para ello habrá que modificar las tasks desde la task23 a la task43 :

Modificando tanto initialTime como finalTime (creo q la forma más cómoda es la siguiente):

En primer lugar, identificar que día del año es el lunes de la semana pasada (en el momento en el que queremos observar los datos de las gráficas). Ejemplo: en el momento en el que estoy redactando este documento (29/05/2021), el lunes de la semana pasada cae en 17/05/2021, lo que habría que hacer ahora es identificar cuantas semanas me separan del lunes que está inidicado en la task23 (por ejemplo imaginemos que está el 10/05/2021).

Sabiendo el número de semanas, conocemos el número de días y lo único que habrá que hacer es sumar ese número de días a todas las fechas tanto initial como final (ya que algunas gráficas usan esta segunda), desde la task23 hasta la task43. Por último, decir que aquellas tareas que tengan finalTime en julio, no es necesario modificar ese finalTime, solamente el initialTime.