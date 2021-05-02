package acme.features.anonymous.tasks;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import acme.components.CustomCommand;
import acme.entities.tasks.Task;
import acme.framework.components.BasicCommand;
import acme.framework.controllers.AbstractController;
import acme.framework.entities.Anonymous;

@Controller
@RequestMapping("/anonymous/task/")
public class AnonymousTaskController extends AbstractController<Anonymous, Task> {

	// Internal state ---------------------------------------------------------

	@Autowired
	private AnonymousTaskListService listService;
	
	@Autowired
	private AnonymousTaskListWorkPlanService listWorkPlanService;
	
	@Autowired
	private AnonymousTaskShowService showService;

	// Constructors -----------------------------------------------------------

	@PostConstruct
	private void initialise() {
		super.addBasicCommand(BasicCommand.LIST, this.listService);
		super.addBasicCommand(BasicCommand.SHOW, this.showService);
		super.addCustomCommand(CustomCommand.LIST_TASKS_WORKPLAN, BasicCommand.LIST, this.listWorkPlanService);
	}

}