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
	<div class="top-hdbanner"></div>
	<#include "/fontend/toolbar.ftl"/>
    <#include "/fontend/head.ftl"/>
    <div class="wp ucenter cfx">
		<#nested>
	</div>
	</body>
</html>
</#macro>