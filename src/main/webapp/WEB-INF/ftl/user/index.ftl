<#include "/fontend/useCenter.ftl"/>
<@web 
	title="个人中心" 
	js=["/static/lib/user/login.js"] 
	css=["http://static-web.b5m.com/ucenter/css/ucenter-index.css?v=20150413031938"]>
	
	<div class="ucenter-main fr">
		
		<!-- <div class="ucenter-title">
				<strong>我的特权</strong>
			</div>
			<div class="myPrivilege">
				<ul class="tj">
					<li class="b p1 had"><a href=""><span
							class="privilage-icon"><i>已享受</i></span><span
							class="privilage-title">帮5买折扣</span></a></li>
					<li class="b p2 unhad"><a href=""><span
							class="privilage-icon"><i>未享受去升级</i></span><span
							class="privilage-title">全网免邮</span></a></li>
					<li class="b p3 rehad"><a href=""><span
							class="privilage-icon"><i>去续费</i></span><span
							class="privilage-title">VIP商品</span></a></li>
					<li class="b p4 unhad"><a href=""><span
							class="privilage-icon"><i>未享受去升级</i></span><span
							class="privilage-title">购物返帮钻</span></a></li>
					<li class="b p5 rehad"><a href=""><span
							class="privilage-icon"><i>去续费</i></span><span
							class="privilage-title">先赔闪退</span></a></li>
					<li class="l"></li>
				</ul>
			</div> -->	
			<div class="ucenter-title">
				<a href="http://ucenter.b5m.com/trade/myorder.htm" class="fr">查看全部&nbsp;&gt;</a><strong>我的订单</strong>
			</div>
			<div class="myOrders">
				<ul>
					<li><a href="http://ucenter.b5m.com/trade/myorder.htm?orderStatus=100&amp;listType=1">待付款 <em id="noPay"></em></a></li>
					<li><a href="http://ucenter.b5m.com/trade/myorder.htm?orderStatus=200&amp;listType=2">待发货 <em id="noSend"></em></a></li>
					<li><a href="http://ucenter.b5m.com/trade/myorder.htm?orderStatus=300&amp;listType=3">待收货 <em id="noReceive"></em></a></li>
					<!-- <li><a href="http://ucenter.b5m.com/trade/myorder.htm?orderStatus=04&listType=4">已收货 <em id="accept"></em></a></li> -->
				</ul>
			</div>
		</div>
</@web>