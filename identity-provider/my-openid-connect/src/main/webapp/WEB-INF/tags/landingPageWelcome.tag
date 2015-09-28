<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row-fluid">
	<div class="span2 visible-desktop"><img src="resources/images/bbd.gif"/></div>
	
	<div class="span10">
		<h1><spring:message code="home.welcome.title"/></h1>
		<p><spring:message code="home.welcome.body" arguments='${config.nomadLoginUrl}'/></p>
	</div>
</div>