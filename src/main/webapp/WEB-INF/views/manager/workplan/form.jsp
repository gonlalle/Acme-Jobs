

<%@page language="java"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	<acme:form-hidden path="workPlanId" />
	
	<acme:form-moment code="manager.workplan.form.label.initialTime" path="initialTime"/>
	<acme:form-moment code="manager.workplan.form.label.finalTime" path="finalTime"/>
	<acme:form-textbox code="manager.workplan.form.label.manager" path="manager"/>
	
	<jstl:if test="${command == 'show'}">
	<acme:form-submit code="manager.workplan.form.button.update"
			action="/manager/workplan/update" />
	<acme:form-submit code="manager.workplan.form.button.delete" action="/manager/workplan/delete"/>
	</jstl:if>
	<jstl:if test="${command == 'create'}">
		<acme:form-submit code="manager.workplan.form.button.create"
			action="/manager/workplan/create" />
	</jstl:if>
	<jstl:if test="${command == 'update'}">
		<acme:form-submit code="manager.workplan.form.button.update"
			action="/manager/workplan/update" />
	</jstl:if>
	<jstl:if test="${command == 'delete'}">
	<acme:form-submit code="manager.workplan.form.button.delete" action="/manager/workplan/delete"/>
	</jstl:if>
	<jstl:if test="${command == 'publish'}">
	<acme:form-submit code="manager.workplan.form.button.publish" action="/manager/workplan/publish"/>
	</jstl:if>
	
	
	<acme:form-submit code="manager.workplan.form.button.create" action="/manager/workplan/create"/>
  	<acme:form-return code="manager.workplan.form.button.return"/>
</acme:form>