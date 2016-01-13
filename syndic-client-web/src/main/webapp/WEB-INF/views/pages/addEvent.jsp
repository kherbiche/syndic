<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/tiles/template/includes.jsp"%>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

	<style>
		.error {
			color: #ff0000;
		}
		.errorblock {
			color: #000;
			background-color: #ffEEEE;
			border: 3px solid #ff0000;
			padding: 8px;
			margin: 16px;
		}
		.input:focus {
			width: 350px;
		}
	</style>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<!--<link rel="stylesheet" href="/resources/demos/style.css">-->
	<script>
		$(function() {
			$("#dateEvent").datepicker({
				minDate : 0
			});
		});
	</script>

</head>
<body>

<div class="container">

	<div class="row">
		<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
			<h3><fmt:message key="event.H3" /></h3>
		</div>
	</div>

	<form:form method="POST" commandName="eventCommand"
			   action="addevent.ldz">
		<form:errors path="*" cssClass="errorblock" element="div" />

		<!-- W add list (select) -->
		<div class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<form:select class="form-control" path="typeEvent" id="typeEvent" >
					<option selected><spring:message code="event.Type"/></option>
					<option value="AG"><spring:message code="event.Type.AG"/></option>
					<option value="Intervention"><spring:message code="event.Type.Intervention"/></option>
					<option value="Incident"><spring:message code="event.Type.Incident"/></option>
				</form:select>
				<form:errors path="typeEvent" cssClass="error" />
			</div>
		</div>
		<!-- End W-->

		<div class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<spring:message code="event.Name" var="eventName" />
				<form:input type="text" class="form-control" path="eventName"
							id="eventName" placeholder="${eventName}" />
				<form:errors path="eventName" cssClass="error" />
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<spring:message code="event.Date" var="dateEvent" />
				<form:input type="text" class="form-control" path="dateEvent"
							id="dateEvent" placeholder="${dateEvent}" />
				<form:errors path="dateEvent" cssClass="error" />
			</div>
		</div>

		<div class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<spring:message code="event.Descr" var="descrEvent" />
				<form:input type="text" class="form-control" path="descEvent"
							id="descEvent" placeholder="${descrEvent}" />
				<form:errors path="descEvent" cssClass="error" />
			</div>
		</div>

		<!-- The specific input -->
		<div id="eventform" class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<spring:message code="event.sp1" var="Sp1Event" />
				<form:input type="text" class="form-control" path="descEvent" id="descEvent" placeholder="${Sp1Event}" />
				<form:errors path="descEvent" cssClass="error" />
			</div>
		</div>
		<div id="eventform2" class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<spring:message code="event.sp2" var="Sp2Event" />
				<form:input type="text" class="form-control" path="descEvent" id="descEvent" placeholder="${Sp2Event}" />
				<form:errors path="descEvent" cssClass="error" />
			</div>
		</div>
		<div id="AGform" class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<spring:message code="event.sp3" var="Sp3Event" />
				<form:input type="text" class="form-control" path="descEvent" id="descEvent" placeholder="${Sp3Event}" />
				<form:errors path="descEvent" cssClass="error" />
				<a href="#" id="addNew">+Question</a>
			</div>
		</div>
		<!-- End specific input -->

		<div class="form-group row" id="addinput">
			<p>
			</p>
		</div>


		<div class="form-group row">
			<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
				<button type="submit" class="btn btn-default"><spring:message code="button.submit"/></button>
			</div>
		</div>
	</form:form>

</div>

</body>

<script>
	jQuery(document).ready(function(){
		$('#AGform').hide();
		$('#eventform').hide();
		$('#eventform2').hide();
		$('#typeEvent').change(function()
		{
			if (document.getElementById("typeEvent").value == 'AG') {
				$('#AGform').toggle(400);
				$('#eventform').hide();
				$('#eventform2').hide();
			}
			else if (document.getElementById("typeEvent").value == 'Intervention') {
				$('#eventform').toggle(400);
				$('#eventform2').toggle(400);
				$('#AGform').hide();
			}
			else
			{
				$('#AGform').hide();
				$('#eventform').hide();
				$('#eventform2').hide();
			}
		});
	});
</script>
<!--script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script-->
<script>
	$(function() {
		var addDiv = $('#addinput');
		var i = $('#addinput p').size() + 1;

		$('#addNew').live('click', function() {
			$('<p>'+
					'<div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">'+
					'<input type="text" name="p_new_' + i +'" class="form-control" placeholder="Question" />'+
					'</div></p>').appendTo(addDiv);
			//'<input type="text" id="p_new" size="40" name="p_new_' + i +'" value="" placeholder="I am New" />'+
			//'<a href="#" id="remNew">Remove</a> </p>').appendTo(addDiv);
			i++;

			return false;
		});

		$('#remNew').live('click', function() {
			if( i > 2 ) {
				$(this).parents('p').remove();
				i--;
			}
			return false;
		});
	});
</script>

</html>


