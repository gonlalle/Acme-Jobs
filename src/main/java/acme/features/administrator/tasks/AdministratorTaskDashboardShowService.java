package acme.features.administrator.tasks;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.forms.TaskDashboard;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Administrator;
import acme.framework.services.AbstractShowService;

@Service
public class AdministratorTaskDashboardShowService implements AbstractShowService<Administrator, TaskDashboard> {
	
	@Autowired
	protected AdministratorTaskDashBoardRepository repository;

	@Override
	public boolean authorise(final Request<TaskDashboard> request) {
		assert request != null;
		
		return true;
	}

	@Override
	public void unbind(final Request<TaskDashboard> request, final TaskDashboard entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model,
			"publicTaskNumber", "privateTaskNumber", "finishedTaskNumber", "notFinishedTaskNumber", 
			"averageOfExecutionTaskPeriod", "deviationOfExecutionTaskPeriod", "minExecutionTaskPeriod", 
			"maxExecutionTaskPeriod", "averageOfTaskWorkload", "deviationOfTaskWorkload", 
			"minTaskWorkload", "maxTaskWorkload","finishedTask","titleTask","avgFinishedTasks","publicWeekTasksCounts"
			,"privateWeekTasksCounts","workPlanTasksNumber","workPlanTasksNumberIds","avgworkPlanTasksNumber"
			,"publicWorkloadTasks","publicWorkloadTasksTitle","privateWorkloadTasks",
			"privateWorkloadTasksTitle","numberOfTasksManagerYearQuery","tasksThisWeekWeekExecutuionPeriod");
	}

	@Override
	public TaskDashboard findOne(final Request<TaskDashboard> request) {
		assert request != null;

		final TaskDashboard result;
		
		final Long publicTaskNumber;
		final Long privateTaskNumber;
		final Long finishedTaskNumber;
		final Long notFinishedTaskNumber;
		final Double averageOfExecutionTaskPeriod;
		final Double deviationOfExecutionTaskPeriod;
		final Double minExecutionTaskPeriod;
		final Double maxExecutionTaskPeriod;
		final Double averageOfTaskWorkload;
		final Double deviationOfTaskWorkload;
		final Double minTaskWorkload;
		final Double maxTaskWorkload;
		final List<Double> finishedTask;
		final List<String> titleTask;
		final Double avgFinishedTasks;
		
		final List<Integer[]> publicWeekTasks;
		final List<Integer> publicWeekTasksDays;
		final List<Integer> publicWeekTasksCounts;
		final List<Integer[]> privateWeekTasks;
		final List<Integer> privateWeekTasksDays;
		final List<Integer> privateWeekTasksCounts;
		
		final List<Object[]> workPlanTasksNumberQuery;
		final List<Long> workPlanTasksNumberIds;
		final List<Long> workPlanTasksNumber;
		final Double avgworkPlanTasksNumber;
		final List<Double> publicWorkloadTasks;
		final List<String> publicWorkloadTasksTitle;
		final List<Double> privateWorkloadTasks;
		final List<String> privateWorkloadTasksTitle;
		final List<Object[]> numberOfTasksManagerYearQuery;
		final List<Object[]> tasksThisWeekWeekExecutuionPeriodQuery;
		
		Calendar calendar;
		Date inicioSemana;
		Date finSemana;
		calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR, 12);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.add(Calendar.DATE, -8);
		
		//Ver que día de la semana es y según el día q sea hacer x
		final Integer dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		
		switch(dayOfWeek) {
		case 1:
			calendar.add(Calendar.DATE, -6);
			break;
		case 2:
			break;
		case 3:
			calendar.add(Calendar.DATE, -1);
			break;
		case 4:
			calendar.add(Calendar.DATE, -2);
			break;
		case 5:
			calendar.add(Calendar.DATE, -3);
			break;
		case 6:
			calendar.add(Calendar.DATE, -4);
			break;
		case 7:
			calendar.add(Calendar.DATE, -5);
			break;
		default:
			break;
		}
		
		inicioSemana = calendar.getTime();
		final Integer lunes = calendar.get(Calendar.DATE);
		calendar.add(Calendar.DATE, 7);
		finSemana = calendar.getTime();
		
		publicWeekTasks = this.repository.getTaskPublicInitialLastWeek(inicioSemana,finSemana);
		privateWeekTasks = this.repository.getTaskPrivateInitialLastWeek(inicioSemana,finSemana);
		
		final List<Integer> diasSemana = new ArrayList<Integer>(Arrays.asList(lunes,lunes+1,lunes+2,lunes+3,lunes+4,lunes+5,lunes+6));
		List<Integer> diasSemanaQNoEstan = new ArrayList<Integer>(Arrays.asList(lunes,lunes+1,lunes+2,lunes+3,lunes+4,lunes+5,lunes+6));
		
		publicWeekTasksDays = publicWeekTasks.stream().map(x->x[0]).collect(Collectors.toList());
		publicWeekTasksCounts = publicWeekTasks.stream().map(x->x[1]).collect(Collectors.toList());
		
		privateWeekTasksDays = privateWeekTasks.stream().map(x->x[0]).collect(Collectors.toList());
		privateWeekTasksCounts = privateWeekTasks.stream().map(x->x[1]).collect(Collectors.toList());
		diasSemanaQNoEstan.removeAll(publicWeekTasksDays);
		
		for (int i = 0; i< diasSemanaQNoEstan.size();i++) {
			publicWeekTasksCounts.add(diasSemana.indexOf(diasSemanaQNoEstan.get(i)),0);
		}
		
		diasSemanaQNoEstan = diasSemana;
		diasSemanaQNoEstan.removeAll(privateWeekTasksDays);
		
		for (int i = 0; i< diasSemanaQNoEstan.size();i++) {
			privateWeekTasksCounts.add(diasSemana.indexOf(diasSemanaQNoEstan.get(i)),0);
		}
		
		publicTaskNumber = this.repository.getPublicTaskNumber();
		privateTaskNumber = this.repository.getPrivateTaskNumber();
		finishedTaskNumber = this.repository.getFinishedTaskNumber();
		notFinishedTaskNumber = this.repository.getNotFinishedTaskNumber();
		averageOfExecutionTaskPeriod = this.repository.averageOfExecutionTaskPeriod();
		deviationOfExecutionTaskPeriod = this.repository.deviationOfExecutionTaskPeriod();
		minExecutionTaskPeriod = this.repository.minExecutionTaskPeriod();
		maxExecutionTaskPeriod = this.repository.maxExecutionTaskPeriod();
    	averageOfTaskWorkload = this.repository.averageOfTaskWorkload();
		deviationOfTaskWorkload = this.repository.deviationOfTaskWorkload();
		minTaskWorkload = this.repository.minTaskWorkload();
		maxTaskWorkload = this.repository.maxTaskWorkload();
		finishedTask = this.repository.getExecutionPeriodFinishedTask();
		titleTask =  this.repository.getTitleTask();
		avgFinishedTasks =  this.repository.getExecutionPeriodFinishedAverangeTask();
		
		
		workPlanTasksNumberQuery = this.repository.getWorkPlanTasksNumber();
		workPlanTasksNumberIds = workPlanTasksNumberQuery.stream()
			.map(x -> ((Integer) x[0]).longValue()).collect(Collectors.toList());
		
		workPlanTasksNumber = workPlanTasksNumberQuery.stream()
			.map(x -> ((Long) x[1]).longValue()).collect(Collectors.toList());
		
		avgworkPlanTasksNumber = this.repository.getWorkPlanTasksNumberAvg();
		
		publicWorkloadTasks = this.repository.getPublicWorkloadTasks(inicioSemana, finSemana);
		publicWorkloadTasksTitle = this.repository.getPublicWorkloadTasksTitle(inicioSemana, finSemana);
		privateWorkloadTasks = this.repository.getPrivateWorkloadTasks(inicioSemana, finSemana);
		privateWorkloadTasksTitle = this.repository.getPrivateWorkloadTasksTitle(inicioSemana, finSemana);
		
		
		numberOfTasksManagerYearQuery = this.repository.getNumberOfTasksManagerYear();
		
		tasksThisWeekWeekExecutuionPeriodQuery = this.repository.getTasksThisWeekWeekExecutuionPeriod(inicioSemana, finSemana);
		
		result = new TaskDashboard();
		result.setPublicTaskNumber(publicTaskNumber);
		result.setPrivateTaskNumber(privateTaskNumber);
		result.setFinishedTaskNumber(finishedTaskNumber);
		result.setNotFinishedTaskNumber(notFinishedTaskNumber);
		result.setAverageOfExecutionTaskPeriod(averageOfExecutionTaskPeriod);
		result.setDeviationOfExecutionTaskPeriod(deviationOfExecutionTaskPeriod);
		result.setMinExecutionTaskPeriod(minExecutionTaskPeriod);
		result.setMaxExecutionTaskPeriod(maxExecutionTaskPeriod);
		result.setAverageOfTaskWorkload(averageOfTaskWorkload);
		result.setDeviationOfTaskWorkload(deviationOfTaskWorkload);
		result.setMinTaskWorkload(minTaskWorkload);
		result.setMaxTaskWorkload(maxTaskWorkload);
		result.setFinishedTask(finishedTask);
		result.setTitleTask(titleTask);
		result.setAvgFinishedTasks(avgFinishedTasks);
		result.setPublicWeekTasksCounts(publicWeekTasksCounts);
		result.setPrivateWeekTasksCounts(privateWeekTasksCounts);
		result.setWorkPlanTasksNumber(workPlanTasksNumber);
		result.setWorkPlanTasksNumberIds(workPlanTasksNumberIds);
		result.setWorkPlanTasksNumberIds(workPlanTasksNumberIds);
		result.setAvgworkPlanTasksNumber(avgworkPlanTasksNumber);
		result.setPublicWorkloadTasks(publicWorkloadTasks);
		result.setPublicWorkloadTasksTitle(publicWorkloadTasksTitle);
		result.setPrivateWorkloadTasks(privateWorkloadTasks);
		result.setPrivateWorkloadTasksTitle(privateWorkloadTasksTitle);
		result.setNumberOfTasksManagerYearQuery(numberOfTasksManagerYearQuery);
		result.setTasksThisWeekWeekExecutuionPeriod(tasksThisWeekWeekExecutuionPeriodQuery);
		return result;
	}

}
