<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<%@ page session="false" %>
<o:header title="Resource"/>
<o:topbar pageName="Resource"/>
<div class="container-fluid main">
	<div class="row-fluid">
		<div class="span10 offset1">

			<h1>
				Hello world!
			</h1>
			
			<h3>Resource: ${ resource }</h3>
		
		</div>
	</div>
</div>


<o:footer />