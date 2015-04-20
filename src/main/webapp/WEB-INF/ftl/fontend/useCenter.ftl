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
    <div class="wp ucenter cfx">
    	<#include "/fontend/user/left.ftl"/>
		<#nested>
	</div>
	</body>
</html>
</#macro>