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

<div id="container" class="container"></div>
<div id="container2" class="container2"></div>
<div id="container3" class="container3"></div>
<div id="container4" class="container4"></div>
<div id="container5" class="container5"></div>
<div id="container6" class="container6"></div>

<!-- Highcharts JS -->
	<script type="text/javascript"
		src="//code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Task DashBoard'
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
	        text: 'Task DashBoard'
	    },
	    xAxis: {
	        categories: <jstl:out value="${idTask}"/>,
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
	
Highcharts.chart('container3', {
	    chart: {
	        type: 'areaspline'
	    },
	    title: {
	        text: 'Public and private tasks started last week'
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
	        data: <jstl:out value="${publicWeekTasks}"/>
	    }, {
	        name: 'Private',
	        data: <jstl:out value="${privateWeekTasks}"/>
	    }]
	});
	
Highcharts.chart('container4', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Number of Tasks for WorkPlan'
    },
    xAxis: {
        categories: <jstl:out value="${workPlanTasksNumberIds}"/>,
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

Highcharts.chart('container5', {
	    chart: {
	        type: 'pie'
	    },
	    title: {
	        text: 'Workload Public Tasks'
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y} workload</b></td></tr>',
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
	        name: "workload",
	        data: chartData(<jstl:out value="${publicWorkloadTasksIds}"/>,<jstl:out value="${publicWorkloadTasks}"/>)

	    }]
	});
	
	    Highcharts.chart('container6', {
		    chart: {
		        type: 'pie'
		    },
		    title: {
		        text: 'Workload Private Tasks'
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		            '<td style="padding:0"><b>{point.y} workload</b></td></tr>',
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
		        name: "workload",
		        data: chartData(<jstl:out value="${privateWorkloadTasksIds}"/>,<jstl:out value="${privateWorkloadTasks}"/>)

		    }]
		});
	    
function chartData(ids,tasksNumber) {
	var counts = {};
	
	for(var i=0;i<ids.length;i++){
		counts[ids[i]] = tasksNumber[i];
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
</script>
