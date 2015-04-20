<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<meta http-equiv="X-UA-Compatible" content="IE=10" >
	<title>${title}</title>
	<link rel="stylesheet" href="http://static-web.b5m.com/common/css/common.css?v=20150409050129" />
    <link rel="stylesheet" href="">
	<script src="${domain}/static/js/jquery/jquery-1.7.2.js" type="text/javascript"></script>
	<script src="${domain}/static/lib/util.js" type="text/javascript"></script>
	<script src="${domain}/static/lib/validate.js" type="text/javascript"></script>
	<script src="http://static-web.b5m.com/public/js/md5.min.js?v=20150413031938" type="text/javascript"></script>
	<script type="text/javascript">
		var domain="${domain}";
		var ucenter = "${ucentertest}";
		var order = "${ordertest}";
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
