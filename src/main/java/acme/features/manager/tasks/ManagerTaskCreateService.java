package acme.features.manager.tasks;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.roles.Manager;
import acme.entities.tasks.Task;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.services.AbstractCreateService;

@Service
public class ManagerTaskCreateService implements AbstractCreateService<Manager, Task> {
	
	@Autowired
	protected ManagerTaskRepository repository;

	@Override
	public boolean authorise(final Request<Task> request) {
		assert request != null;

		return true;
	}

	@Override
	public void bind(final Request<Task> request, final Task entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors);
	}

	@Override
	public void unbind(final Request<Task> request, final Task entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "initialTime", "finalTime", "workload", "description", "link", "publicTask");
	}

	@Override
	public Task instantiate(final Request<Task> request) {
		assert request != null;

		Task result;
		Manager manager;

		manager = this.repository.findOneManagerById(request.getPrincipal().getActiveRoleId());
		result = new Task();
		result.setManager(manager);

		return result;
	}

	@Override
	public void validate(final Request<Task> request, final Task entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;
		
		if (!errors.hasErrors("initialTime")) {
			Calendar calendar;
			Date actualDate;
						
			calendar = new GregorianCalendar();
			actualDate = calendar.getTime();
			errors.state(request, entity.getInitialTime().after(actualDate), "initialTime", "manager.task.form.error.initialTime");
		}
		
		if (!errors.hasErrors("finalTime")) {
			Calendar calendar;
			Date actualDate;
						
			calendar = new GregorianCalendar();
			actualDate = calendar.getTime();
			errors.state(request, entity.getFinalTime().after(actualDate), "finalTime", "manager.task.form.error.finalTime");
			errors.state(request, entity.getFinalTime().after(entity.getInitialTime()), "finalTime", "manager.task.form.error.finalTimeInitial");
		}
		
	}

	@Override
	public void create(final Request<Task> request, final Task entity) {
		assert request != null;
		assert entity != null;

		this.repository.save(entity);
	}

}
