<%--
- form.jsp
-
- Copyright (C) 2012-2021 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<h2>
	<acme:message code="administrator.dashboard.form.title.general-indicators"/>
</h2>

<table class="table table-sm">
	<caption>
		<acme:message code="administrator.dashboard.form.title.general-indicators"/>
	</caption>	
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.publicTaskNumber"/>
		</th>
		<td>
			<acme:print value="${publicTaskNumber}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.privateTaskNumber"/>
		</th>
		<td>
			<acme:print value="${privateTaskNumber}"/>
		</td>
	</tr>
	
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.finishedTaskNumber"/>
		</th>
		<td>
			<acme:print value="${finishedTaskNumber}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.notFinishedTaskNumber"/>
		</th>
		<td>
			<acme:print value="${notFinishedTaskNumber}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.averageOfExecutionTaskPeriod"/>
		</th>
		<td>
			<acme:print value="${averageOfExecutionTaskPeriod}"/>
		</td>
	</tr>	
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.deviationOfExecutionTaskPeriod"/>
		</th>
		<td>
			<acme:print value="${deviationOfExecutionTaskPeriod}"/>
		</td>
	</tr>	
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.minExecutionTaskPeriod"/>
		</th>
		<td>
			<acme:print value="${minExecutionTaskPeriod}"/>
		</td>
	</tr>	
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.maxExecutionTaskPeriod"/>
		</th>
		<td>
			<acme:print value="${maxExecutionTaskPeriod}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.averageOfTaskWorkload"/>
		</th>
		<td>
			<acme:print value="${averageOfTaskWorkload}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.deviationOfTaskWorkload"/>
		</th>
		<td>
			<acme:print value="${deviationOfTaskWorkload}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.minTaskWorkload"/>
		</th>
		<td>
			<acme:print value="${minTaskWorkload}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="administrator.dashboard.form.label.maxTaskWorkload"/>
		</th>
		<td>
			<acme:print value="${maxTaskWorkload}"/>
		</td>
	</tr>
</table>
<h3>Public, Private and Finished or Not Tasks</h3>
<p>In this chart we can see the comparison between the number of public and private tasks, and between finished and not finished tasks</p>
<div id="container" class="container"></div>

<h3>Execution Period of Tasks</h3>
<p>In this chart we can see the number of days each task lasts for the tasks not finished yet</p>
<div id="container2" class="container2"></div>

<h3>Public and Private tasks started last week</h3>
<p>In this chart we can see the number tasks (public or private) that have started in a day of the past week</p>
<div id="container3" class="container3"></div>

<h3>Number of tasks for WorkPlan</h3>
<p>In this chart we can see the number tasks that each work plan has</p>
<div id="container4" class="container4"></div>

<h3>Workload of public tasks</h3>
<p>In this chart we can see the workload of the public tasks that finished last week</p>
<div id="container5" class="container5"></div>

<h3>Workload of private tasks</h3>
<p>In this chart we can see the workload of the private tasks finished last week</p>
<div id="container6" class="container6"></div>

<h3>Number of task by manager group by year</h3>
<p>In this chart we can see the number of tasks that each manager create each year</p>
<div id="container7" class="container7"></div>

<h3>Execution Period of this week tasks</h3>
<p>In this chart we can see the different executions period of tasks that start last week</p>
<div id="container8" class="container8"></div>
<!-- Highcharts JS -->
	<script type="text/javascript"
		src="//code.highcharts.com/highcharts.js"></script>
	<script type="text/javascript"
		src="//code.highcharts.com/highcharts-more.js"></script>

<script type="text/javascript">

Highcharts.chart('container', {
    chart: {
        type: 'column',
    },
    title: {
        text: ''
    },
    xAxis: {
        categories: [
            'Public',
            'Private',
            'Finished',
            'Not Finished',

        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Number of Tasks'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y} tasks</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'tasks',
        data: [<jstl:out value="${publicTaskNumber}"/>,<jstl:out value="${privateTaskNumber}"/>,
        				<jstl:out value="${finishedTaskNumber}"/>,<jstl:out value="${notFinishedTaskNumber}"/>]

    }]
});


Highcharts.chart('container2', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: ''
	    },
	    xAxis: {
	        categories: chartTitleGraf2(),
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Number of days'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">Task {point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0"> Task {series.key}: </td>' +
	            '<td style="padding:0"><b>{point.y} days</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [{
	        name: "Tasks",
	        data: <jstl:out value="${finishedTask}"/>

	    },{
	    	type: "line",
	    	name: "Average",
	    	data: [[0,<jstl:out value="${avgFinishedTasks}"/>], [<jstl:out value="${finishedTask}"/>.length-1,<jstl:out value="${avgFinishedTasks}"/>]],
	    	marker: {
	    		enabled: false
	    	},
	    	states: {
	    		hover: {
	    			lineWidth: 0
	        	}
	    	},
	    	enableMouseTracking: false
	    }]
	});
	
function chartTitleGraf2() {
	var titles = [];
	<jstl:forEach  var="title" items="${titleTask}" >
		titles.push('<jstl:out value="${title}"/>');
	
	</jstl:forEach>
	return titles;
}
	
Highcharts.chart('container3', {
	    chart: {
	        type: 'areaspline'
	    },
	    title: {
	        text: ''
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'left',
	        verticalAlign: 'top',
	        x: 150,
	        y: 100,
	        floating: true,
	        borderWidth: 1,
	        backgroundColor:
	            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF'
	    },
	    xAxis: {
	        categories: [
	            'Monday',
	            'Tuesday',
	            'Wednesday',
	            'Thursday',
	            'Friday',
	            'Saturday',
	            'Sunday'
	        ],
	        plotBands: [{ // visualize the weekend
	            from: 4.5,
	            to: 6.5,
	            color: 'rgba(68, 170, 213, .2)'
	        }]
	    },
	    yAxis: {
	        title: {
	            text: 'Tasks'
	        }
	    },
	    tooltip: {
	        shared: true,
	        valueSuffix: ' tasks'
	    },
	    credits: {
	        enabled: false
	    },
	    plotOptions: {
	        areaspline: {
	            fillOpacity: 0.5
	        }
	    },
	    series: [{
	        name: 'Public',
	        data: <jstl:out value="${publicWeekTasksCounts}"/>
	    }, {
	        name: 'Private',
	        data: <jstl:out value="${privateWeekTasksCounts}"/>
	    }]
	});
	
Highcharts.chart('container4', {
    chart: {
        type: 'column'
    },
    title: {
        text: ''
    },
    xAxis: {
        categories: chartTitleGraf4(),
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Number of tasks'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">WorkPlan {point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0"> Number of tasks {series.key}: </td>' +
            '<td style="padding:0"><b>{point.y} tasks</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: "Number of Task",
        data: <jstl:out value="${workPlanTasksNumber}"/>

    },{
    	type: "line",
    	name: "Average",
    	data: [[0,<jstl:out value="${avgworkPlanTasksNumber}"/>], [<jstl:out value="${workPlanTasksNumber}"/>.length-1,<jstl:out value="${avgworkPlanTasksNumber}"/>]],
    	marker: {
    		enabled: false
    	},
    	states: {
    		hover: {
    			lineWidth: 0
        	}
    	},
    	enableMouseTracking: false
    }]
});

function chartTitleGraf4() {
	var titles = [];
	<jstl:forEach  var="title" items="${workPlanTasksNumberIds}" >
		titles.push('Workplan '+'<jstl:out value="${title}"/>');
	
	</jstl:forEach>
	return titles;
}

Highcharts.chart('container5', {
	    chart: {
	        type: 'pie'
	    },
	    title: {
	        text: ''
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '%'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	            }
	        }
	    },
	    series: [{
	        name: "workload",
	        data: chartDataPublic(<jstl:out value="${publicWorkloadTasks}"/>)

	    }]
	});
	
	
function chartDataPublic(tasksNumber) {
	var counts = {};
	var titles = [];
	var contador = 0;
	var i =0;
	<jstl:forEach  var="title" items="${publicWorkloadTasksTitle}" >
		titles.push('<jstl:out value="${title}"/>');
		contador += tasksNumber[i];
		i++
	</jstl:forEach>
	
	for(var i=0;i<titles.length;i++){
		counts[titles[i]] = tasksNumber[i]/contador;
	}
	
	
	// And map it to the format highcharts uses
 	return $.map(counts,
			function(val, key) {
				return {
					name : key,
					y : val,
				};
			}); 
}
	
	    Highcharts.chart('container6', {
		    chart: {
		        type: 'pie'
		    },
		    title: {
		        text: ''
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    accessibility: {
		        point: {
		            valueSuffix: '%'
		        }
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
		            }
		        }
		    },
		    series: [{
		        name: "workload",
		        data: chartDataPrivate(<jstl:out value="${privateWorkloadTasks}"/>)

		    }] 
		    
		    
		});
	    
function chartDataPrivate(tasksNumber) {
	var counts = {};
	var titles = [];
	var contador = 0;
	var i =0;
	<jstl:forEach  var="title" items="${privateWorkloadTasksTitle}" >
		titles.push('<jstl:out value="${title}"/>');
		contador += tasksNumber[i];
		i++
	</jstl:forEach>
	
	for(var i=0;i<titles.length;i++){
		counts[titles[i]] = tasksNumber[i]/contador;
	}
	
	
	// And map it to the format highcharts uses
 	return $.map(counts,
			function(val, key) {
				return {
					name : key,
					y : val,
				};
			}); 
}

Highcharts.chart('container7', {

    title: {
        text: ''
    },

    yAxis: {
        title: {
            text: 'Number of tasks'
        }
    },
    xAxis: {
        categories: chartData2()[1],
        crosshair: true
    },

    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },
            
        }
    },
	
    series: chartData2()[0],
    responsive: {
        rules: [{
            condition: {
                maxWidth: 500  
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});

var yearsOut = [];

function chartData2() {
	
	var series = [];
	var counts = {};
	var years = {};
	var yearsToUse = new Set();
	var ids = [];
	var contador = 0;
	
	<jstl:forEach  var="id" items="${numberOfTasksManagerYearQuery}" >
		
		if (counts['<jstl:out value="${id[0]}"/>'] == null){
			
			counts['<jstl:out value="${id[0]}"/>'] = [<jstl:out value="${id[2]}"/>];
		}else{
			counts['<jstl:out value="${id[0]}"/>'].push(<jstl:out value="${id[2]}"/>);
		}
		
		if (years['<jstl:out value="${id[0]}"/>'] == null){
			
			years['<jstl:out value="${id[0]}"/>'] = [<jstl:out value="${id[1]}"/>];
		}else{
			years['<jstl:out value="${id[0]}"/>'].push(<jstl:out value="${id[1]}"/>);
		}
		
		yearsToUse.add(<jstl:out value="${id[1]}"/>);
		
	</jstl:forEach>
	
		yearsToUseList = Array.from(yearsToUse);
		yearsToUseList.sort();
	
	for(var i=0; i<Object.keys(years).length;i++){
		var contador = 0;
		for(var j=0; j<yearsToUseList.length;j++){
			
			if(!years[Object.keys(years)[i]].includes(yearsToUseList[j])){
				counts[Object.keys(counts)[i]].splice(contador,0,0);
			}
			contador++;
		};	
		
	}
	
	for(var i = 0; i<Object.keys(counts).length && i<5;i++){
		series.push({
			name: Object.keys(counts)[i],
			data: counts[Object.keys(counts)[i]]
		});
	}	

	// And map it to the format highcharts uses
	return [series,yearsToUseList];
}


Highcharts.chart('container8', {

		    chart: {
		        type: 'columnrange',
		        inverted: true
		    },

		    title: {
		        text: ''
		    },

		    xAxis: {
		        categories: chartData8()[1]
		    },

		    yAxis: {
		        type: 'datetime',
		    	labels: {
		      format: '{value:%Y-%m-%d}',
		    }
		    },

		    plotOptions: {
		        columnrange: {
		        		
		            dataLabels: {
		            		type: 'datetime',
		                enabled: true,
		                format: '{value:%Y-%m-%d}'
		            },
		        	enableMouseTracking: false
		        }
		    },
		    
		    series: chartData8()[0]

		});


function chartData8() {
	var series = [];
	var data = [];
	var titles = [];
	
	<jstl:forEach  var="id" items="${tasksThisWeekWeekExecutuionPeriod}" >
		
		titles.push('<jstl:out value="${id[0]}"/>');
		
		data.push(
			[Date.parse('<jstl:out value="${id[1]}"/>'),Date.parse('<jstl:out value="${id[2]}"/>')]
		);
		
	</jstl:forEach>
	
	series.push({
		name: 'Execution Period',
		data: data
	});
	
	console.log(series);

	// And map it to the format highcharts uses
	return [series,titles];
}
</script>
