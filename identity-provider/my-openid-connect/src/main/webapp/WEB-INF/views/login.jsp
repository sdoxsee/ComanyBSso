<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<o:header title="Log In" />
<script type="text/javascript">
<!--

$(document).ready(function() {
	// select the appropriate field based on context
	$('#<c:out value="${ login_hint != null ? 'j_password' : 'j_username' }" />').focus();
});

//-->
</script>
<o:topbar />

<div class='container' id='container'>
	<script type='text/javascript'>
	var form_errors_prefix_id = "";
	var form_errors = null;
	var flash_notifications = {};
	</script>
	
	<div id='flash'>
		<c:if test="${ param.error != null }">
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<div class="alert alert-error">
       				<spring:message code="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
       				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
		</c:if>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span12">
					<div class="login-form">
						<h2><spring:message code="login.login_with_username_and_password"/></h2>
						<form
							action="<%=request.getContextPath()%>/j_spring_security_check"
							class="new_user" id="new_user" method="post">
							<div class="clearfix ui-hide-label" data-role="fieldcontain">
								<label class="required" for="j_username"><span
									class="required">*</span>Email</label> <input type="text"
									required="required" placeholder="Email" autocorrect="off"
									autocapitalize="off" autocomplete="off" spellcheck="false"
									value="<c:out value="${ login_hint }" />" id="j_username"
									name="j_username">
							</div>
							<div class="clearfix ui-hide-label" data-role="fieldcontain">
								<label class="required" for="user_password"><span
									class="required">*</span>Password</label> <input type="password"
									required="required" placeholder="Password" autocorrect="off"
									autocapitalize="off" autocomplete="off" spellcheck="false"
									id="j_password" name="j_password">
							</div>
							<input class="btn btn-primary" data-disable-with="Please wait..."
								id="submit" name="submit" type="submit" value="Sign in" /> <a
								class="btn" href="http://localhost:3000/forgot_password">Forgot
								Password</a>
						</form>

					</div>

				</div>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$('form#new_user').submit(function() {
		  $(this).find("input[type='submit']").prop('disabled',true);
		  $(this).find("input[type='submit']").prop('value','Please wait...');
	});
});
</script>
<o:footer/>