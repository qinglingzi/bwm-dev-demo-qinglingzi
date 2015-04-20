<#include "/common/html.ftl"/>
<@web 
	title="注册" 
	js=["/static/lib/user/register.js"] 
	css=["http://static-web.b5m.com/ucenter/css/register.css?v=20150413031938"]>
	
<div class="login-register-bg">
    <h1 class="lr-logo"><a href="http://www.b5m.com/" target="_blank"><img width="69" height="87" src="http://static-web.b5m.com/ucenter/img/m.png" alt="帮5买" title="帮5买" /></a></h1>
    <!-- <div class="lr-banner">
        <a href="http://www.b5m.com/bangdou.html?hmsr=b5m_ucenter_login_banner&hmmd=banner" target="_blank">
            <span id="closeBanner" title="关闭">关闭</span>
        </a>
    </div> -->
    <h2 class="lr-title">一个帐号，享受所有帮5买优惠</h2>
    <div class="lr-keywords">
     	<a href="http://tejia.b5m.com/" target="_blank">淘特价</a>
     	<a href="http://order.b5m.com/dh?hmsr=b5m_ucenter_login_bi&hmmd=link" target="_blank">换Ipad mini</a>
     	<a href="http://t.b5m.com?hmsr=b5m_ucenter_login_bi&hmmd=link" target="_blank">商品降价提醒</a>
     	<a href="http://zdm.b5m.com?hmsr=b5m_ucenter_login_bi&hmmd=link" target="_blank">值得买</a>
    </div>
    <div class="lr-mark"><p>注册账号</p></div>
    <div class="lr-box" id="register-view">
        <form id="registerForm"  action="${domain}/user/register.htm" method="post">
		    <input name="userType" type="hidden" value=""/>
		    <input name="state" type="hidden" value=""/>
		    <input name="userMps" type="hidden" value=""/>
		    <div class="kv-item kv-item-user cfx">
		        <div class="kv-input kv-input-user">
		        	<!--[if lte IE 9 ]>
		            <label for="email">邮箱/手机</label>
		            <![endif]-->
		            <input id="email" class="kv-text" type="text" placeholder="邮箱/手机" autocomplete="off" value="" name="email"/>          
		        </div>
		        <div class="msg-box"></div>
		    </div>
		    <div class="kv-item kv-item-pwd cfx">
		        <div class="kv-input kv-input-pwd">
		        	<!--[if lte IE 9 ]>
		            <label for="password">密码</label>
		            <![endif]-->
		            <input id="password" class="kv-text" type="password" placeholder="密码" onpaste="return false" oncopy="return false;" oncut="return false;"/>           
		        	<input id="password2" name="password" type="hidden" />  
		        </div>
		        <div class="msg-box"></div>
		        <div class="kv-bar" id="testPwd"></div>
		        <div id="capitalTips" class="kv-capital"><p>大写锁定打开<i class="capital-arr-outer"></i><i class="capital-arr-inner"></i></p></div>
		    </div>
		    <div id="dom-vali-code" class="kv-item kv-item-code cfx">
		        <div class="kv-input kv-input-code">
		            <input id="valiCode" class="kv-text" type="text" placeholder="验证码" autocomplete="off" name="code" maxlength="4"/>
		        </div>
		        <div class="kv-verify">
		            <img id="code" width="120" height="44" src="http://ucenter.b5m.com/validateCode.do" />
		            <p class="kv-verify-refresher">
		                看不清？<a id="refreshCode" href="javascript:void(0)">换一张</a>
		            </p>
		        </div>
		        <div class="msg-box"></div>
		    </div>
		    <div id="serror" class="kv-item kv-item-server cfx"></div>
		    <div class="kv-item kv-item-access cfx">
		        <input name="access" type="checkbox" class="kv-chk" value="true"/><label for="J_Access" class="kv-protocol">我已阅读并同意<a id="protocol-but" href="javascript:void(0);">《帮5买用户注册协议》</a></label>
		        <div class="protocol-pop">
		        	<div class="ui-loading">加载中……</div>
		        </div>
		    </div>
		    <div class="kv-item kv-item-handler cfx">
		        <a id="submit_btn" class="kv-submit kv-submit-yellow" target="_self" href="javascript:void(0);">注册</a>
		    </div>
		    <div class="kv-item kv-item-handler cfx">
		        <a class="kv-submit kv-submit-white" href="javascript:void(0);" onclick="this.href = '${domain}/user/login.htm'">登录</a>
		    </div>
		</form>
    </div>
</div>
<script type="text/javascript">
	var userRefer = {
		userType:'',
		userName:'',
		email:'',
		url:''
	}
</script>
</@web>