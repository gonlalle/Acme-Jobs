package acme.features.manager.tasks;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.consistsOf.ConsistsOf;
import acme.entities.roles.Manager;
import acme.entities.tasks.Task;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Principal;
import acme.framework.services.AbstractShowService;

@Service
public class ManagerTaskShowWorkPlanService implements AbstractShowService<Manager, Task> {
	
	@Autowired
	protected ManagerTaskRepository repository;

	@Override
	public boolean authorise(final Request<Task> request) {
		assert request != null;

		boolean result;
		int taskId;
		Task task;
		Manager manager;
		Principal principal;

		taskId = request.getModel().getInteger("id");
		task = this.repository.findOneTaskById(taskId);
		manager = task.getManager();
		principal = request.getPrincipal();
		result = manager.getUserAccount().getId() == principal.getAccountId();

		return result;
	}

	@Override
	public void unbind(final Request<Task> request, final Task entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;
		
		request.unbind(entity, model, "title", "initialTime", "finalTime", "workload", "description", "link", "publicTask");
		
		ConsistsOf consistsOf;
		consistsOf = this.repository.findOneConsistsOfById(request.getModel().getInteger("id"), request.getModel().getInteger("workPlanId"));
		model.setAttribute("workPlanId", request.getModel().getInteger("workPlanId"));
		model.setAttribute("isWorkPlan", true);
		
		if(consistsOf != null) {
			model.setAttribute("isWorkPlanList", true);
		}
		
	}

	@Override
	public Task findOne(final Request<Task> request) {
		assert request != null;

		Task result;
		int id;

		id = request.getModel().getInteger("id");
		result = this.repository.findOneTaskById(id);

		return result;
	}

}
