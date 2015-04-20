<#include "/fontend/findPwd.ftl"/>
<@web 
	title="邮箱找回密码" 
	js=["/static/lib/user/findPwd.js"] 
	css=["http://static-web.b5m.com/ucenter/css/ucenter-index.css?v=20150419151130","http://staticcdn.b5m.com/css/ucenter/ucenter.css?v=20150419151130","http://ucenter.b5m.com/css/ucenter.css?t=20150419151130"]>
	
	
	
	<#if step!"-1" == -1 || step ==0 ><#-- 初始化-->
	<div id="wrapper">
	<div class="login resetpwd">
           <div class="hr"></div>
           <!-- 不出现提示 -->
           <div class="resetpwd-info"></div>
           <form id="emailForm" method="post" action="http://ucenter.b5m.com/user/info/forgotPwd1.do">
            <div class="login-form losepwd">
                <span class="title">忘记密码</span>
                <div class="rows">
                    <label>邮箱：</label>
                    <span class="value"><input type="text" maxlength="45" class="text" name="email" id="email"></span>
                    <span class="errorBox info"></span>
                </div>
                <span class="introtext">请填写您注册的Email地址</span>
                <a href="javascript:void(0)" id="next" class="saveBtn">下一步</a>
                <a style="display:none" href="javascript:void(0)" class="gray-btn saveBtn" id="now_send"><img src="http://ucenter.b5m.com/images/ajax-loader.gif">正在发送</a>
            </div>
           </form>
       </div>	
	</div>
	<#elseif step == 1><#-- 发送成功-->
	<div id="wrapper">
		<div class="login resetpwd">
            <div class="hr"></div>
            <!-- 不出现提示,出现提示需隐藏 resetpwd-info 层 -->
            <div class="resetpwd-info"></div>
            <!-- 验证邮件已重新发送  -->
            <div style="display:none" class="avatar-succ">
                    <img src="http://ucenter.b5m.com/images/ucenter/blank.png" class="ui-icon ui-icon-right">&nbsp;&nbsp;验证邮件已重新发送
            </div>
           
            <!-- 链接过期 -->
            <div class="login-form sendmail">
                <span class="title">重置密码</span>
                <span class="result">我们已将重设密码的链接发送到您的邮箱(Email)：<b>qinglingzi@b5m.com</b></span>
                <a href="http://mail.b5m.com" class="goto_email">进入邮箱查收</a>
                <a style="display:none" href="javascript:void(0)" class="goto_email_btn" id="now_send"><img src="http://ucenter.b5m.com/images/ajax-loader.gif">正在发送</a>
                <div class="line"></div>
                <span class="">没有收到邮件？</span>
                <p>
                    1. 到广告邮件、垃圾邮件目录找找看<br>
                    2. 若还没收到，请点击 <a id="cxfs" href="javascript:void(0)">重新发送邮件</a><br>
                    3. 不小心填错了Email？ <a href="http://ucenter.b5m.com/forward.htm?method=/user/info/forgotPwd1">重新输入验证邮箱</a>
                </p>
            </div>
            
        </div>		
	</div>
	
	<#elseif step == 2><#-- 重置密码-->
	<div class="login">
	<div class="hr"></div>
	<div style="display:none;width:100%;height:37px;width:100%;position:relative;" id="serror">
		<div class="avatar-fail" style="display:block;width:855px;left:62px;top:20px;position:absolute;">
			<img src="http://ucenter.b5m.com/images/ucenter/blank.png" class="ui-icon ui-icon-error">&nbsp;
			<span></span>
		</div>
	</div>
	<form id="findPw" method="post" action="http://ucenter.b5m.com/user/info/forgotPwd3.htm" novalidate="novalidate">
	<input type="hidden" value="qinglingzi@b5m.com" name="email">
	<input type="hidden" value="" id="newPassword" name="newPassword">
	<input type="hidden" value="j61X8nIz09dP1s69R9vC92" name="code">
		<div class="login-form">
			<span class="title">重置密码</span>
			<div class="rows">
				 <label>新密码：</label><span class="value"><input type="password" class="text" maxlength="15" name="newPassword1" id="newPassword1"></span><span class="errorBox info"></span>
			</div>
			<span class="introtext">请输入6-15位字母、数字或符号</span>
			<div class="rows">
				<label>确认密码：</label><span class="value"><input type="password" class="text" maxlength="15" name="confirmPassword"></span><span class="errorBox info"></span>
			</div>
			<span class="introtext">再次输入您的密码</span> <a href="javascript:void(0)" id="submit" class="saveBtn">确定</a>
		</div>
	</form>
	</div>
	<#elseif step == 3><#-- code 失效-->
	<div id="wrapper">
	<div class="login resetpwd">
           <div class="hr"></div>
           <!-- 不出现提示 -->
           <div class="resetpwd-info"></div>
           
           <div class="avatar-fail"><img src="http://ucenter.b5m.com/images/ucenter/blank.png" class="ui-icon ui-icon-error">&nbsp;&nbsp;链接已失效</div>
           
           <form id="signupForm" method="post" action="http://ucenter.b5m.com/user/info/forgotPwd1.do" novalidate="novalidate">
            <div class="login-form losepwd">
                <span class="title">忘记密码</span>
                <div class="rows">
                    <label>邮箱：</label><span class="value"><input type="text" maxlength="45" class="text" name="email" id="email"></span><span class="errorBox info"></span>
                </div>
                <span class="introtext">请填写您注册的Email地址</span>
                <a href="javascript:void(0)" id="submit" class="saveBtn">下一步</a>
                <a style="display:none" href="javascript:void(0)" class="gray-btn saveBtn" id="now_send"><img src="http://ucenter.b5m.com/images/ajax-loader.gif">正在发送</a>
            </div>
           </form>
       </div>	
</div>
	</#if>
    
</@web>