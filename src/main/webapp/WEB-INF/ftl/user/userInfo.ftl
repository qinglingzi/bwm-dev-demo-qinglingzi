<#include "/fontend/useCenter.ftl"/>
<@web 
	title="个人中心" 
	js=["/static/lib/user/userInfo.js"] 
	css=["http://static-web.b5m.com/ucenter/css/user-info.css?v=20150413031938"]>
	
	<div class="ucenter-main fr">
	<div class="ucenter-account">
		<h2 class="ucenter-title">
			<strong>账户信息</strong>
		</h2>
		<div class="ui-tab">
			<ul class="ui-tab-nav border cfx">
				<li class="ui-tab-active">基本信息<i></i></li>
				<li class="">安全设置<i></i></li>
			</ul>
			<div class="ui-tabs-content">
				<div class="ui-tab-item">
					<div class="account-info" id="basicInfo">
					<div class="user-progress user-progress-account cfx">
					<div class="progress">
						<div class="progress-inner">
							<div alt="资料完成度50" style="width:50%;" class="progress-current">
								<i> 
									<div class="progress-tooltips">
									<span class="c-yellow">50%</span>完成真实姓名<span class="c-yellow">+10%</span>
									<em></em>
									</div>
								</i>
							</div>
						</div>
					</div>
					<span class="progress-h">资料完整度：</span>
					<span class="progress-a">100%</span>
				</div>
				<form class="form-h form-information" id="userBasicInfoForm" method="post" novalidate="novalidate">
				<div class="control-group">
				<label class="control-label" for="u-emai">当前邮箱：</label>
				<div class="controls selecter">
				<p class="cl-eb7 useremail">
				${userInfo.data.email}
				</p>
				</div>
				<input type="hidden" name="email" id="email" value="${userInfo.data.email}"></div>
				<div class="control-group">
					<label class="control-label" for="u-name">昵称：</label>
					<div class="controls selecter">
						<input type="text" value="${userInfo.data.nickName}" name="nickName" id="nickName" class="input-big txt">
						<span class="errorBox info"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="u-name">真实姓名：</label>
					<div class="controls selecter">
						<input type="text" maxlength="20" value="" name="realName" id="realName" class="input-big txt">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="u-name">性别：</label>
					<div class="controls radio selecter">
						<input type="radio" value="male" name="gender" <#if !userInfo.data.gender?exists || userInfo.data.gender=='male'> checked="checked"</#if>>男
						<input type="radio" style="margin-left: 6px;" value="female" name="gender" <#if userInfo.data.gender=='female'>  checked="checked"</#if> >女
					</div>
				</div>
				<div class="control-group"><div class="controls"><a href="javascript:void(0);" id="editBasicInfoSub" class="btn btn-yellow">保存</a></div></div>
				</div>
				</div>
				<div style="display: none;" class="ui-tab-item">
					<div class="account-info center-account-safe" id="user-security">
						<h6>我的安全服务</h6>
						<table cellspacing="0" cellpadding="0" border="0" id="userSecurityItem" class="table table-account">
					<colgroup><col width="74"><col width="165"><col width="370"><col width="119"></colgroup>
					<tbody>
						<tr>
							<td><i class="icon-safe-psw-act"></i></td>
							<td>登录密码</td>
							<td class="center-account-intro">安全性高的密码可以使用账号更安全。建议您经常更换密码，且设置一个包含数字和字母，并长度超过6位以上的密码</td>
							<td>
							<a class="btn btn-yellow" href="${domain}/user/changePwd.htm">修改密码</a>
							</td>
						</tr>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
    </div>
    
</@web>