package acme.forms;

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TaskDashboard implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	// Atributos
	
	Long publicTaskNumber;
	
	Long privateTaskNumber;
	
	Long finishedTaskNumber;
	
	Long notFinishedTaskNumber;
	
	Double averageOfExecutionTaskPeriod;
	
	Double deviationOfExecutionTaskPeriod;
	
	Double minExecutionTaskPeriod;
	
	Double maxExecutionTaskPeriod;
	
	Double averageOfTaskWorkload;
		
	Double deviationOfTaskWorkload;
	
	Double minTaskWorkload;
	
	Double maxTaskWorkload;
	
	List<Double> finishedTask;
	
	List<String> titleTask;
	
	Double avgFinishedTasks;
	
	List<Integer> publicWeekTasksCounts;
	 
	List<Integer> privateWeekTasksCounts;
	
	List<Long> workPlanTasksNumber;
	
	List<Long> workPlanTasksNumberIds;

	Double avgworkPlanTasksNumber;
	
	List<Double> publicWorkloadTasks;
	
	List<String> publicWorkloadTasksTitle;
	
	List<Double> privateWorkloadTasks;
	
	List<String> privateWorkloadTasksTitle;
	
	List<Object[]> numberOfTasksManagerYearQuery;
	
	List<Object[]> tasksThisWeekWeekExecutuionPeriod;
}		
