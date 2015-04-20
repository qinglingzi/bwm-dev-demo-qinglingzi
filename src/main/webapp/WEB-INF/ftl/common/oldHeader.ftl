<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<meta http-equiv="X-UA-Compatible" content="IE=10" >
	<title>用户中心</title>
	<link rel="stylesheet" href="http://static-web.b5m.com/common/css/common.css?v=20150409050129" />
    <link rel="stylesheet" href="http://static-web.b5m.com/ucenter/css/login.css?v=20150409050129">
	<script src="${domain}/static/js/jquery/jquery-1.7.2.js" type="text/javascript"></script>
	<script src="${domain}/static/js/validation/jquery.validate.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		var domain="${domain}";
		var staticDomain = "${staticDomain}";
	</script>
	<#list js as file>
		<#if file?lower_case?starts_with('http://')>
			<script type="text/javascript" src="${file}"></script>
		<#else>
			<script type="text/javascript" src="${domain}${file}"></script>
		</#if>
	</#list>
	<#list css as file>   		
		<#if file?lower_case?starts_with('http://')>
			<link rel="stylesheet" type="text/css" href="${file}" />
		<#else>
			<link rel="stylesheet" type="text/css" href="${domain}${file}" />
		</#if>
	</#list>
</head>
