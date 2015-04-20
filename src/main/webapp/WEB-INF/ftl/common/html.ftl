<#assign domain="${rc.contextPath}" />
<#macro web 
	title="" 
	header="/common/header.ftl" 
	js=[] 
	css=[] 
	>
	
<!doctype html>
	<#include header>
	<body>
		<#nested>
	</body>
</html>
</#macro>