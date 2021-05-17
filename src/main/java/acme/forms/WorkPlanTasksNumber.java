package acme.forms;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class WorkPlanTasksNumber implements Serializable {

	private static final long serialVersionUID = 1L;
	
	// Atributos
	
	Integer workPlanId;
	Integer tasksNumber;
	
}
