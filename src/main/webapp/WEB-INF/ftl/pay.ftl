<#include "/fontend/pay.ftl"/>
<@web 
	title="支付页面" 
	css=["http://static-web.b5m.com/pay/css/pay.css?t=1429240408269"]>
	
	<div class="wp center cfx">
	<div class="center-pay">
		<div class="center-pay-info mt20 cfx">
			<h1>订单提交成功，请您尽快付款！</h1>
			
			
				<p style="margin-left: 40px;">
					<label>支付号：</label>
					<span>${payNum}</span>
				</p>
			
			
			<p>|</p>
			<p style="margin-top: 1px;">
				<label>订单总金额：</label>
				<span class="amount"><b>￥</b>${order.payPrice}</span>
			</p>
			
			
			<div class="app-pay">
			<img class="bb-img" src="http://static-web.b5m.com/pay/img/bb-big.png">
			<div class="twm">
				<div class="app-title"><i></i><span>用app支付更快捷</span><!--[if lt IE 8]><p class="iecp"></p><![endif]--></div>
				<div id="app-code"><canvas width="77" height="77"></canvas></div>
			</div>
			
		</div>
		</div>
		<div class="center-pay-type">只差一步，请尽快支付</div> 
		<form target="_blank" action="http://pay.b5m.com/third/pay.htm" method="post" name="payFrm">
			<div class="center-pay-detail mt10 cfx">
                
                <input type="hidden" value="fd8643d9e7b04e9e941326258a19ff92" name="userId">
                <input type="hidden" value="6475007534056958668" name="orderId">
                <input type="hidden" value="31a1e969e79541436416424001b1f2c3" name="sign">
                <input type="hidden" value="115.0" name="amount">
                <input type="hidden" value="115.00" name="amountDetail">
                <input type="hidden" value="115.0" name="totalAmount">
                <input type="hidden" value="zhifu6475007534056958668" name="subject">
                <input type="hidden" value="223" name="source">                
                <input type="hidden" value="" name="freeFeeType">
                <input type="hidden" value="" name="inviterId">
                <input type="hidden" value="____" id="trafficSource" name="trafficSource"> 
                <input type="hidden" id="thirdPayType" value="4" name="thirdPayType"> 
				<input type="hidden" value="0" name="usebz">
					<div class="bzdx ">
<div>
	<label>
		<span class="use-bz-check"></span>	
		<span>使用超级帮钻</span>		
	</label>	
	<span data-max="0" class="bz-left">余额：0（本次可用 0 超级帮钻）</span>
	<span><a target="_blank" href="http://ucenter.b5m.com/bps/index.htm">充值</a></span>
</div>
<div class="input-line">
	<span>使用</span>
	<input type="input" value="" name="bzAmount" class="bz-amount">
	<span>超级帮钻</span>
	<span class="dx-tip">抵现¥<em>0.00</em></span>
</div>
<div class="max-tip">本次最多可用 0 超级帮钻</div>
					</div> 
					
	                
				  
				    
				<div class="center-pay-list">
				
					<h2>支付平台</h2>
					<ul data-mps="34002" class="hide-more cfx">
					


	<li class="cur">
		<input type="radio" data-mps="wechatpay" value="wxpay" name="defaultBank" class="pay-radio" data-id="0" id="payPlatform_wxpay">
		<label for="payPlatform_wxpay"><i class="pay-radio-custom"></i><img data-mps="wechatpay" title="微信支付" alt="微信支付" src="http://static-web.b5m.com/pay/img/bank/wxzf.png?t=20141281049"></label>
	</li>

<li class="">
	<input type="radio" data-mps="alipay" value="alipay" name="defaultBank" class="pay-radio" data-id="0" id="payPlatform_zfb">
	<label for="payPlatform_zfb"><i class="pay-radio-custom"></i><img data-mps="alipay" title="支付宝" alt="支付宝" src="http://static-web.b5m.com/pay/img/bank/alipay.png?t=20141281049"></label>
</li>


<li>	
	<input type="radio" data-mps="unionpay" value="unionpay" name="defaultBank" class="pay-radio" data-id="0" id="payPlatform_ylzf">
	<label for="payPlatform_ylzf"><i class="pay-radio-custom"></i><img data-mps="unionpay" title="银联" alt="银联" src="http://static-web.b5m.com/pay/img/bank/yinlianzhifu.png?t=20141281049"></label>
</li>

<li>	
	<input type="radio" data-mps="tencent" value="tencent" name="defaultBank" class="pay-radio" data-id="0" id="payPlatform_cft">
	<label for="payPlatform_cft"><i class="pay-radio-custom"></i><img data-mps="tencent" title="财付通" alt="财付通" src="http://static-web.b5m.com/pay/img/bank/tencent.png?t=20141281049"></label>
</li>



<li>	
	<input type="radio" data-mps="kuaiqian" value="kuaiqian" name="defaultBank" class="pay-radio" data-id="0" id="payPlatform_kq">
	<label for="payPlatform_kq"><i class="pay-radio-custom"></i><img data-mps="kuaiqian" title="快钱" alt="快钱" src="http://static-web.b5m.com/pay/img/bank/99bill.png?t=20141281049"></label>
</li>
					</ul>
					<h2 class="cfx"><a href="javascript:;" class="show-all">展开更多<i></i></a>网银支付<span>（需要开通网银）</span></h2>
					<ul data-mps="34003" class="hide-more cfx">
<li>	
	<input type="radio" value="CCB" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_zgjsyh">
	<label for="payOnline_zgjsyh"><i class="pay-radio-custom"></i><img data-mps="CCB" title="中国建设银行" alt="中国建设银行" src="http://static-web.b5m.com/pay/img/bank/jsyh.png?t=20141281049"></label>
</li>


<li>
	<input type="radio" value="ICBC" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_gsyh">
	<label for="payOnline_gsyh"><i class="pay-radio-custom"></i><img data-mps="ICBC" title="中国工商银行" alt="中国工商银行" src="http://static-web.b5m.com/pay/img/bank/gsyh.png?t=20141281049"></label>
</li>


<li>	
	<input type="radio" value="ABC" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_nyyh">
	<label for="payOnline_nyyh"><i class="pay-radio-custom"></i><img data-mps="ABC" title="中国农业银行" alt="中国农业银行" src="http://static-web.b5m.com/pay/img/bank/nyyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="CMB" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_zsyh">
	<label for="payOnline_zsyh"><i class="pay-radio-custom"></i><img data-mps="CMB" title="招商银行" alt="招商银行" src="http://static-web.b5m.com/pay/img/bank/zsyh.png?t=20141281049"></label>
</li>

<li>	
	<input type="radio" value="BOCSH" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_zgyh">
	<label for="payOnline_zgyh"><i class="pay-radio-custom"></i><img data-mps="BOCSH" title="中国银行" alt="中国银行" src="http://static-web.b5m.com/pay/img/bank/zgyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="PSBC" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_youzheng">
	<label for="payOnline_youzheng"><i class="pay-radio-custom"></i><img data-mps="PSBC" title="中国邮政储蓄银行" alt="中国邮政储蓄银行" src="http://static-web.b5m.com/pay/img/bank/yzcx.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="BOCOM" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_jtyh">
	<label for="payOnline_jtyh"><i class="pay-radio-custom"></i><img data-mps="BOCOM" title="交通银行" alt="交通银行" src="http://static-web.b5m.com/pay/img/bank/jtyh.png?t=20141281049"></label>
</li>	


<li>
	<input type="radio" value="CIB" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_xyyh">
	<label for="payOnline_xyyh"><i class="pay-radio-custom"></i><img data-mps="CIB" title="兴业银行" alt="兴业银行" src="http://static-web.b5m.com/pay/img/bank/xyyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="CMBC" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_msyh">
	<label for="payOnline_msyh"><i class="pay-radio-custom"></i><img data-mps="CMBC" title="中国民生银行" alt="中国民生银行" src="http://static-web.b5m.com/pay/img/bank/msyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="CNCB" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_zxyh">
	<label for="payOnline_zxyh"><i class="pay-radio-custom"></i><img data-mps="CNCB" title="中信银行" alt="中信银行" src="http://static-web.b5m.com/pay/img/bank/zxyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="SPDB" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_pufa">
	<label for="payOnline_pufa"><i class="pay-radio-custom"></i><img data-mps="SPDB" title="浦发银行" alt="浦发银行" src="http://static-web.b5m.com/pay/img/bank/pfyh.png?t=20141281049"></label>
</li>	
					
<li>
	<input type="radio" value="CEB" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_gdyh">
	<label for="payOnline_gdyh"><i class="pay-radio-custom"></i><img data-mps="CEB" title="中国光大银行" alt="中国光大银行" src="http://static-web.b5m.com/pay/img/bank/gdyh.png?t=20141281049"></label>
</li>

<li>
                            <input type="radio" value="GDB" name="defaultBank" class="pay-radio" data-id="1" id="payOnline_gfyh">
                            <label for="payOnline_gfyh"><i class="pay-radio-custom"></i><img data-mps="GDB" title="广发银行" alt="广发银行" src="http://static-web.b5m.com/pay/img/bank/gfyh.png?t=20141281049"></label>
                        </li>

				      
				      
					
					</ul>
				
				
				
					<h2 class="cfx">
<a href="javascript:;" class="show-all">展开更多<i></i></a>快捷支付<span>（包含银行信用卡）</span>
<div class="preview">
	<a href="javascript:;" class="show-info">预览需要填写的信息  &gt;</a>
	<div class="preview-info">
		<span class="tri"></span>
		<div class="pre-header cfx">
			<a href="javascript:;" class="pre-close">×</a>
			<a href="javascript:;" class="pre-tab">储蓄卡</a>
			<a href="javascript:;" class="pre-tab">信用卡</a>			
		</div>
		<img src="http://static-web.b5m.com/pay/img/pay-fast-cxk.jpg?t=20141281049" class="card-img" id="pre-cxk">
		<img src="http://static-web.b5m.com/pay/img/pay-fast-xyk.jpg?t=20141281049" class="card-img" id="pre-xyk">
	</div>
</div>
					</h2>
					<ul data-mps="34004" class="hide-more cfx">
					
<li>	
	<input type="radio" value="3106" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_zgjsyh">
	<label for="fastPay_zgjsyh"><i class="pay-radio-custom"></i><img data-mps="CCB" title="中国建设银行" alt="中国建设银行" src="http://static-web.b5m.com/pay/img/bank/jsyh.png?t=20141281049"></label>
</li>
<li>
	<input type="radio" value="2032" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_gsyh">
	<label for="fastPay_gsyh"><i class="pay-radio-custom"></i><img data-mps="ICBC" title="中国工商银行" alt="中国工商银行" src="http://static-web.b5m.com/pay/img/bank/gsyh.png?t=20141281049"></label>
</li>

<li>	
	<input type="radio" value="4186" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_nyyh">
	<label for="fastPay_nyyh"><i class="pay-radio-custom"></i><img data-mps="ABC" title="中国农业银行" alt="中国农业银行" src="http://static-web.b5m.com/pay/img/bank/nyyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="3006" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_zsyh">
	<label for="fastPay_zsyh"><i class="pay-radio-custom"></i><img data-mps="CMB" title="招商银行" alt="招商银行" src="http://static-web.b5m.com/pay/img/bank/zsyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="2028" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_zgyh">
	<label for="fastPay_zgyh"><i class="pay-radio-custom"></i><img data-mps="BOC" title="中国银行" alt="中国银行" src="http://static-web.b5m.com/pay/img/bank/zgyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="2023" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_youzheng">
	<label for="fastPay_youzheng"><i class="pay-radio-custom"></i><img data-mps="POSTGC" title="中国邮政储蓄银行" alt="中国邮政储蓄银行" src="http://static-web.b5m.com/pay/img/bank/yzcx.png?t=20141281049"></label>
</li>
<li>
	<input type="radio" value="2024" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_payh">
	<label for="fastPay_payh"><i class="pay-radio-custom"></i><img data-mps="SPAB" title="平安银行" alt="平安银行" src="http://static-web.b5m.com/pay/img/bank/payh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="3113" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_xyyh">
	<label for="fastPay_xyyh"><i class="pay-radio-custom"></i><img data-mps="CIB" title="兴业银行" alt="兴业银行" src="http://static-web.b5m.com/pay/img/bank/xyyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="3119" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_msyh">
	<label for="fastPay_msyh"><i class="pay-radio-custom"></i><img data-mps="CMBC" title="中国民生银行" alt="中国民生银行" src="http://static-web.b5m.com/pay/img/bank/msyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="3115" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_zxyh">
	<label for="fastPay_zxyh"><i class="pay-radio-custom"></i><img data-mps="CITIC" title="中信银行" alt="中信银行" src="http://static-web.b5m.com/pay/img/bank/zxyh.png?t=20141281049"></label>
</li>

<li>
	<input type="radio" value="2017" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_pufa">
	<label for="fastPay_pufa"><i class="pay-radio-custom"></i><img data-mps="SPDB" title="浦发银行" alt="浦发银行" src="http://static-web.b5m.com/pay/img/bank/pfyh.png?t=20141281049"></label>
</li>	
					
<li>
	<input type="radio" value="2014" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_gdyh">
	<label for="fastPay_gdyh"><i class="pay-radio-custom"></i><img data-mps="CEBBANK" title="中国光大银行" alt="中国光大银行" src="http://static-web.b5m.com/pay/img/bank/gdyh.png?t=20141281049"></label>
</li>

<li>
                            <input type="radio" value="2016" name="defaultBank" class="pay-radio" data-id="1" id="fastPay_gfyh">
                            <label for="fastPay_gfyh"><i class="pay-radio-custom"></i><img data-mps="CGB" title="广发银行" alt="广发银行" src="http://static-web.b5m.com/pay/img/bank/gfyh.png?t=20141281049"></label>
                        </li>

					
					</ul>	
		
				</div>
			</div>
			<div class="center-pay-btn mt20 cfx">				
				<input type="button" value="立即支付" class="pay-next fr" data-attr="1019" id="J_pay_next" slt="true" paytype="payPlatform_wxpay">
				<strong class="pay-amount fr">待支付金额：<span>￥</span><span class="amount">${order.payPrice}</span></strong>
			</div>
			
			
			
		</form>
	</div>
</div>
    
</div>
</@web>