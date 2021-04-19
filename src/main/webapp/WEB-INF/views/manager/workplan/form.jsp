

<%@page language="java"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	<acme:form-moment code="manager.workplan.form.label.initialTime" path="initialTime"/>
	<acme:form-moment code="manager.workplan.form.label.finalTime" path="finalTime"/>
	<acme:form-textarea code="manager.workplan.form.label.tasks" path="tasks"/>
	<acme:form-textbox code="manager.workplan.form.label.manager" path="manager"/>
	
	<acme:form-submit code="manager.workplan.form.button.create" action="/manager/workplan/create"/>
  	<acme:form-return code="manager.workplan.form.button.return"/>
</acme:form>