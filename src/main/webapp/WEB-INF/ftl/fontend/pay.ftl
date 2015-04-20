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
    <div class="wp ucenter cfx">
		<#nested>
	</div>
	</body>
</html>
</#macro>