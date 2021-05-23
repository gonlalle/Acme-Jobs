package acme.features.administrator.tasks;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.framework.repositories.AbstractRepository;

@Repository
public interface AdministratorTaskDashBoardRepository extends AbstractRepository {
	
	@Query("select t.title,t.initialTime,t.finalTime from Task t where t.publicTask = false and t.initialTime >= ?1 and t.initialTime <= ?2")
	List<Object[]> getTasksThisWeekWeekExecutuionPeriod(Date inicioSemana, Date finSemana);
	
	@Query("select t.manager.userAccount.username,year(t.initialTime),count(*) from Task t group by t.manager, year(t.initialTime) order by t.manager.id")
	List<Object[]> getNumberOfTasksManagerYear();
	
	@Query("select t.title from Task t where t.publicTask = false and t.finalTime >= ?1 and t.finalTime <= ?2")
	List<String> getPrivateWorkloadTasksTitle(Date inicioSemana, Date finSemana);
	
	@Query("select t.workload from Task t where t.publicTask = false and t.finalTime >= ?1 and t.finalTime <= ?2")
	List<Double> getPrivateWorkloadTasks(Date inicioSemana, Date finSemana);
	
	@Query("select t.title from Task t where t.publicTask = true and t.finalTime >= ?1 and t.finalTime <= ?2")
	List<String> getPublicWorkloadTasksTitle(Date inicioSemana, Date finSemana);
	
	@Query("select t.workload from Task t where t.publicTask = true and t.finalTime >= ?1 and t.finalTime <= ?2")
	List<Double> getPublicWorkloadTasks(Date inicioSemana, Date finSemana);
	
	@Query("select count(*)/count(distinct c.workPlan.id) from ConsistsOf c")
	Double getWorkPlanTasksNumberAvg();
	
	@Query("select c.workPlan.id,count(*) from ConsistsOf c group by c.workPlan.id")
	List<Object[]> getWorkPlanTasksNumber();
	
	@Query("select day(t.initialTime),count(t) from Task t where t.initialTime >= ?1 and t.initialTime < ?2 and t.publicTask = true group by day(t.initialTime)")
	List<Integer[]> getTaskPublicInitialLastWeek(Date inicioSemana, Date finSemana);
	
	@Query("select day(t.initialTime),count(t) from Task t where t.initialTime >= ?1 and t.initialTime < ?2 and t.publicTask = false group by day(t.initialTime)")
	List<Integer[]> getTaskPrivateInitialLastWeek(Date inicioSemana, Date finSemana);
	
	@Query("select datediff(t.finalTime, t.initialTime) from Task t where t.finalTime > CURRENT_DATE")
	List<Double> getExecutionPeriodFinishedTask();
	
	@Query("select avg(datediff(t.finalTime, t.initialTime)) from Task t where t.finalTime > CURRENT_DATE")
	Double getExecutionPeriodFinishedAverangeTask();
	
	@Query("select t.title from Task t where t.finalTime > CURRENT_DATE")
	List<String> getTitleTask();
	
	@Query("select count(t) from Task t where t.publicTask = true")
	Long getPublicTaskNumber();
	
	@Query("select t.id from Task t where t.finalTime <= CURRENT_DATE")
	List<Integer> getIdWorkPlan();
	
	@Query("select count(c) from ConsistsOf c group by c.workPlan")
	Long getPublicTaskNumberByWorkPlan();
	
	@Query("select count(t) from Task t where t.publicTask = false")
	Long getPrivateTaskNumber();
	
	@Query("select count(t) from Task t where t.finalTime <= current_date()")
	Long getFinishedTaskNumber();
	
	@Query("select count(t) from Task t where t.finalTime > current_date()")
	Long getNotFinishedTaskNumber();
	
	@Query("select avg(datediff(t.finalTime, t.initialTime)) from Task t ")
	Double averageOfExecutionTaskPeriod();
	
	@Query("select sqrt(sum((datediff(t.finalTime, t.initialTime)- (select avg(datediff(t.finalTime, t.initialTime)) from Task t))*(datediff(t.finalTime, t.initialTime) - (select avg(datediff(t.finalTime, t.initialTime)) from Task t)))) from Task t")
	Double deviationOfExecutionTaskPeriod();
	
	@Query("select min(datediff(t.finalTime, t.initialTime)) from Task t ")
	Double minExecutionTaskPeriod();
	
	@Query("select max(datediff(t.finalTime, t.initialTime)) from Task t ")
	Double maxExecutionTaskPeriod();

	@Query("select avg(t.workload) from Task t ")
	Double averageOfTaskWorkload();
	
	@Query("select avg(t.workload) from Task t ")
	Double deviationOfTaskWorkload();
	
	@Query("select min(t.workload) from Task t ")
	Double minTaskWorkload();
	
	@Query("select max(t.workload) from Task t ")
	Double maxTaskWorkload();


}
