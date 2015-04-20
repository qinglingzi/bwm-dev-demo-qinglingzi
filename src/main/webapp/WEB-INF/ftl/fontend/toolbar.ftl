<div class="tpbar"> 
   <div data-mps="10002" class="tpbar-cont wp"> 
<div class="l-nav"> 
 <a class="" href="http://www.b5m.com"> 帮5买，享帮帮 </a> 
</div> 
<ul class="login-bar cf"> 
<#if userInfo.ok>
 <li> 
 
  <div class="menu-hover"> 
  	
   <a class="menu-hd noico" href="http://ucenter.b5m.com/nuser/index.htm" target="_self" id="b5muser"> ${userInfo.data.nickName} </a> 
  
   <div class="menu-bd bd-user"> 
    <ul class="menu-bd-list"> 
     <ol> 
      <a href="${domain}/user/userInfo.htm"> 账户信息 </a> 
     </ol> 
     <ol> 
      <a href="http://ucenter.b5m.com/trade/myorder.htm"> 我的订单 </a> 
     </ol> 
     <ol> 
      <a href="http://ucenter.b5m.com/nuser/address.htm"> 收货地址 </a> 
     </ol> 
     <ol> 
      <a href="${domain}/user/logout.htm" target="_self"> 退出登录 </a> 
     </ol> 
    </ul> 
   </div> 
  </div> </li>  </#if>
  
 <li class="sp"> | </li> 
 <li> <a class="nomenu" data-attr="" href="${domain}/order/myOrder.htm"> <span> <i class="ico ico-file"> </i> 我的订单 </span> </a> </li> 
 <li class="sp"> | </li> 
 <li> 
  <div class="menu-hover"> 
   <a class="menu-hd noico hd-msg" href="javascript:;" target="_self"> 我的消息 <b> </b> </a> 
   <div class="menu-bd bd-msg"> 
    <div class="bd-panel"> 
     <h3> 我的消息 </h3> 
     <ul class="menu-msg-info" style="display: block;"> 
      <ol> 
       <p> <b> 帮5买！ </b> <i> 您的超级帮钻已经赠送成功 </i> <strong> 您于15年04月11日 13:34:24 赠送sfgerb(275****@163.com)1超级帮钻。 </strong> </p> 
       <div> 
        <a href="javascript:void(0)"> 点击查看详情 <em> &gt; </em> </a> 
        <span> 2015-04-11 13:34:24 来自帮5买 </span> 
       </div> 
      </ol> 
      <ol> 
       <p> <b> 帮5买！ </b> <i> 您收到了好友赠送的超级帮钻 </i> <strong> 您于15年04月11日 13:34:24 收到____(137****8754)1超级帮钻。 </strong> </p> 
       <div> 
        <a href="javascript:void(0)"> 点击查看详情 <em> &gt; </em> </a> 
        <span> 2015-04-11 13:34:24 来自帮5买 </span> 
       </div> 
      </ol> 
     </ul> 
     <p> <a class="btn-more" href="http://ucenter.b5m.com/forward.htm?method=/user/msg/system/index"> 显示更多 </a> </p> 
    </div> 
   </div> 
  </div> </li> 
 <li class="sp"> | </li> 
 <li> 
  <div class="menu-hover"> 
   <a class="menu-hd hd-add" href="http://ucenter.b5m.com/forward.htm?method=/user/account/favorites/index" style="cursor:pointer" target="_self"> <i class="ico ico-add"> </i> 我的收藏 <b> </b> </a> 
   <div class="menu-bd bd-add"> 
    <div class="bd-panel"> 
     <h3> 我的收藏 </h3> 
     <div class="loading"> 
      <span> 加载中... </span> 
     </div> 
     <ul class="menu-add-info"> 
     </ul> 
    </div> 
   </div> 
  </div> </li> 
 <li class="sp"> | </li> 
 <li> 
  <div class="menu-hover"> 
   <a class="menu-hd noico hd-follow" href="javascript:;" target="_self"> 关注我们 <b> </b> </a> 
   <div class="menu-bd bd-follow"> 
    <div class="bd-panel"> 
     <h3> <i class="iconfont ico-wx"> 뀇 </i> 微信 </h3> 
     <p> <span class="qrcode-wx"> </span> </p> 
     <div class="cf"> 
      <a class="follow-qq" target="_blank" title="腾讯微博" href="http://e.t.qq.com/bang5mai"> </a> 
      <a class="follow-weibo" href="http://weibo.com/bang5mai" target="_blank" title="新浪微博"> </a> 
      <span class="r"> 微博： </span> 
     </div> 
     <a href="javascript:void(0)" class="add-fav"> 收藏本站 </a> 
    </div> 
   </div> 
  </div> 
  <div> 
  </div> </li> 
 <li class="sp"> | </li> 
 <li> 
  <div class="menu-hover"> 
   <a class="menu-hd" href="javascript:;" target="_self"> <i class="ico ico-helper"> </i> 购物助手 <b> </b> </a> 
   <div class="menu-bd bd-helper"> 
    <div class="bd-panel"> 
     <h3> 购物助手 </h3> 
     <p> 安装帮5淘购物助手，实时展示商品历史价格，帮你淘到商品最低价 </p> 
     <div class="cf"> 
      <a class="bd-helper-download" onclick="B5tDownload.startDownload(false,false,true);"> </a> 
      <a class="bd-helper-detail" href="http://t.b5m.com"> 详情 <span> &gt; </span> </a> 
     </div> 
    </div> 
   </div> 
  </div> </li> 
 <li class="sp"> | </li> 
 <li> 
  <div class="menu-hover"> 
   <a class="menu-hd hd-phone" href="javascript:;" target="_self"> <i class="ico ico-phone"> </i> 手机帮5买 <b> </b> </a> 
   <div class="menu-bd bd-phone"> 
    <div class="bd-panel"> 
     <div class="cf"> 
      <div class="l"> 
       <span class="qrcode-iphone"> app store </span> 
      </div> 
      <!--<div class="r"><span class="qrcode-android">android</span></div>--> 
      <div class="l"> 
       <b class="btn-iphone"> app store </b> 
      </div> 
      <!--<div class="r"><b class="btn-android">android</b></div>--> 
     </div> 
     <p class="t-r"> <a class="bd-phone-detail" href="http://app.b5m.com"> 详情 <span> &gt; </span> </a> </p> 
    </div> 
   </div> 
  </div> </li> 
 <li class="sp"> | </li> 
 <li> <a class="nomenu" data-attr="1015" href="http://cart.b5m.com"> <span> <i class="ico ico-cart"> </i> 购物车 <font id="cartNo"> 2 </font> </span> </a> </li> 
 <li class="sp"> | </li> 
 <li> 
  <div class="menu-hover"> 
   <a class="menu-hd" href="javascript:;" target="_self"> <i class="ico ico-webnav"> </i> 网站导航 <b> </b> </a> 
   <div class="menu-bd bd-dh"> 
    <ul class="menu-bd-list"> 
     <ol> 
      <a href="http://zdm.b5m.com"> 值得买 </a> 
     </ol> 
     <ol> 
      <a href="http://tejia.b5m.com"> 淘特价 </a> 
     </ol> 
     <ol> 
      <a href="http://korea.b5m.com"> 韩国馆 </a> 
     </ol> 
     <ol> 
      <a href="http://k.b5m.com"> 韩国城 </a> 
     </ol> 
     <ol> 
      <a href="http://lady.b5m.com"> 女人街 </a> 
     </ol> 
     <ol> 
      <a href="http://t.b5m.com"> 帮5淘 </a> 
     </ol> 
    </ul> 
   </div> 
  </div> </li> 
</ul> 
  </div> 
</div>