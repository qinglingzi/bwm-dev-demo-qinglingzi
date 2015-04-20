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
	<#include "/fontend/toolbar.ftl"/>
    <#include "/fontend/head.ftl"/>
  	 <#nested>
	</body>
</html>
</#macro>