<#include "/fontend/findPwd.ftl"/>
<@web 
	title="手机找回密码" 
	js=["/static/lib/user/findPwd.js"] 
	css=["http://static-web.b5m.com/ucenter/css/ucenter-index.css?v=20150419151130","http://staticcdn.b5m.com/css/ucenter/ucenter.css?v=20150419151130","http://ucenter.b5m.com/css/ucenter.css?t=20150419151130"]>
	
	<div class="wp">
		<div class="center-unbind">
			<h2>
				<i class="unbind-phone"></i>验证手机
			</h2>
			<div id="sendMessageToMobile"><div class="unbind-detail">
    <form id="sendMsgToMobileForm" novalidate="novalidate">
        <div class="unbind-item cfx">
            <label for="mobile">输入手机号码：</label>
            <input type="text" maxlength="11" id="mobile" name="mobile" class="unbind-txt">
            <input type="button" value="获取验证码" class="btn-get-code" id="getValidatCode">
            <span class="unbind-error"></span>
        </div>
    </form>
    <form id="validateCodeForm" novalidate="novalidate">
        <div class="unbind-item cfx">
            <label for="code">验&#12288; 证&#12288; 码：</label>
            <input type="text" disabled="disabled" id="code" name="code" maxlength="6" autocomplete="off" class="unbind-txt unbind-txt-disabled">
            <span class="unbind-error"></span>
        </div>
        <div class="unbind-item unbind-item-btn">
            <input type="button" value="下一步" disabled="disabled" class="btn-unbind-next btn-unbind-next-disabled" id="validateMobileCode">
        </div>
    </form>
</div></div>
		</div>
	</div>
    
</@web>