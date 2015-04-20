<#include "/common/html.ftl"/>
<@web 
	title="登录" 
	js=["/static/lib/user/login.js"] 
	css=["http://static-web.b5m.com/ucenter/css/login.css?v=20150409050129"]>
<div class="login-register-bg">
    <h1 class="lr-logo"><a href="javascipt:void(0)"><img width="69" height="87" src="http://static-web.b5m.com/ucenter/img/m.png" alt="帮5买" title="帮5买" /></a></h1>
    <!-- <div class="lr-banner">
        <a href="http://www.b5m.com/bangdou.html?hmsr=b5m_ucenter_login_banner&hmmd=banner" target="_blank">
            <span id="closeBanner" title="关闭">关闭</span>
        </a>
    </div> -->
    <h2 class="lr-title">一个帐号，享受所有帮5买优惠</h2>
    <!-- <div class="lr-exchange">
      <p class="lr-exchange-link"><a href="http://www.b5m.com/bangdou.html?hmsr=b5m_ucenter_login_quanwangduihuan&hmmd=link" target="_blank"><i></i>全网商品,免费兑换</a></p>
  </div> -->
    <div class="lr-keywords">
        <!-- <a href="http://www.b5m.com/ban
        gdou.html?hmsr=b5m_ucenter_login_bi&hmmd=link" target="_blank">赚帮钻</a> -->
        <a href="javascript:void(0);">淘特价</a>
        <a href="javascript:void(0);">换Ipad mini</a>
        <a href="javascript:void(0);">商品降价提醒</a>
        <a href="javascript:void(0);">值得买</a>
    </div>
    <div class="lr-mark"><p>使用B5M账户登录</p></div>
    <div class="lr-box login-pop-window" id="login-view">
        <form id="loginForm"  action="${domain}/user/login.htm" method="post">
            <input type="hidden" id="loginReferer" name="loginReferer" value="">
            <input type="hidden" id="password2" name="password" value="">
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
                    <input id="password" class="kv-text" type="password" placeholder="密码" rel="" onpaste="return false" oncopy="return false;" oncut="return false;"/>
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
                    <p class="kv-verify-refresher">看不清？<a id="refreshCode" href="javascript:void(0)">换一张</a>
                    </p>
                </div>
                <div class="msg-box"></div>
            </div>
            <div id="serror" class="kv-item kv-item-server cfx"></div>
            <div class="kv-item kv-item-forget cfx">
				        <span class="forget-link">
				            <em>忘记密码？</em>
				            <span class="forget-link-detail">
				                <a class="icon-forget-mobile" href="javascript:void(0)"><i></i>手机账号</a>
				                <a class="icon-forget-email" href="${domain}/forward.htm?method=/user/findPwdByEmail"><i></i>邮箱账号</a>
				                <i class="arr-forget-outer"></i>
				                <i class="arr-forget-inner"></i>
				            </span>
				        </span>
                <div class="fast-login">
                    <span class="">使用其它账号登录：</span>
                    <a href="http://ucenter.b5m.com/user/third/login/auth.htm?type=1&refererUrl=" class="qq">&nbsp;</a>
                    <a href="http://ucenter.b5m.com/user/third/login/auth.htm?type=5&refererUrl=" class="weixin">&nbsp;</a>
                    <a href="http://ucenter.b5m.com/user/third/login/auth.htm?type=2&refererUrl=" class="weibo">&nbsp;</a>
                </div>
            </div>
            <div class="kv-item kv-item-handler cfx">
                <a id="submit_btn" class="kv-submit kv-submit-yellow" target="_self" href="javascript:void(0);">登录</a>
            </div>
            <div class="kv-item kv-item-handler cfx">
                <a class="kv-submit kv-submit-white" href="javascript:void(0);" onclick="this.href = '${domain}/forward.htm?method=/user/register'">注册</a>
            </div>
        </form>
    </div>
</div>
</@web>