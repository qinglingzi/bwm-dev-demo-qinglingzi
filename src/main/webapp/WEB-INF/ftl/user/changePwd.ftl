<#include "/fontend/findPwd.ftl"/>
<@web 
	title="更改密码" 
	js=["/static/lib/user/changePwd.js"] 
	css=["http://static-web.b5m.com/ucenter/css/ucenter-index.css?v=20150420135359","http://staticcdn.b5m.com/css/ucenter/ucenter.css?v=20150420135359"]>
	
	<div class="wrap">
	<div class="shadow-box setting-box mt20" id="editPwd"><div class="step-title cf">
	<div class="step-brand l"></div>
	<div class="step-name l "><i class="icon-safe-pwd"></i><strong>修改密码</strong></div>
</div>
<form class="form-h form-set-pwd" id="editPwdForm" method="post" novalidate="novalidate">
    <div class="control-group">
        <label class="control-label" for="u-name">原密码：</label>
        <div class="controls">
        	<input type="password" class="input-big txt" oncut="return false;" oncopy="return false;" onpaste="return false" maxlength="18" name="password" id="password">
        	 <span class="cl-999"></span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="u-name">新密码：</label>
        <div class="controls">
        	<input type="password" class="input-big txt text_error" oncut="return false;" oncopy="return false;" onpaste="return false" maxlength="18" name="newPassword" id="newPassword">
        	<span class="cl-999"></span>
        	<div id="test-pwd"><p class="pwd-power pwd-weak"></p></div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="u-name">确认密码：</label>
        <div class="controls">
        	<input type="password" class="input-big txt" oncut="return false;" oncopy="return false;" onpaste="return false" maxlength="18" name="confirmPassword" id="confirmPassword">
        	 <span class="cl-999"></span>
        </div>
    </div>
    <div class="control-group">
        <div class="controls"><a class="btn btn-yellow" id="editPwdSubmit" href="javascript:void(0);">确认修改</a></div>
    </div>
</form></div>
</div>
    
</@web>