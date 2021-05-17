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
	
	List<Integer> idTask;
	
	Double avgFinishedTasks;
	
	List<Double> publicWeekTasks;
	 
	List<Double> privateWeekTasks;
	
	List<Long> workPlanTasksNumber;
	
	List<Long> workPlanTasksNumberIds;

	Double avgworkPlanTasksNumber;
	
	List<Double> publicWorkloadTasks;
	
	List<Integer> publicWorkloadTasksIds;
	
	List<Double> privateWorkloadTasks;
	
	List<String> privateWorkloadTasksIds;
}
