[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".btnswitch").click(function(){
			var val = $(this).attr("value");
			$(this).attr("value",$(this).attr("rel"));
			$(this).attr("rel",val);
			$(this).attr("disabled","disabled");			
			$(this).closest('form').submit();
		});
	});
</script>
<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_mailchimp">
</form>

<style>
.btn{
	display: block;
	color: white!important;
	margin: 0 0 15px 0;
	font-weight: 500;
	position: relative;
	-webkit-transition: opacity .2s;
	-moz-transition: opacity .2s;
	-o-transition: opacity .2s;
	transition: opacity .2s;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	border-radius: 7px;
	text-align: center;
	padding: 15px 15px;
	font-size: 16px;
	letter-spacing: .8px;
	text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.4);
	text-decoration: none!important;
	background-image: url(http://static.mailchimp.com/www/images/btn_overlay.png);
	background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0.51,rgba(255,255,255,0.1)),color-stop(0.49,rgba(0,0,0,0)));
	background-image: -moz-linear-gradient(top,rgba(255,255,255,0.1) 50%,rgba(0,0,0,0) 50%);
}
.btn.orange{
	border-top: 1px solid #EE836F;
	border-bottom: 1px solid #CB563F;
	box-shadow: 0 1px 0 #a9422e,0px -1px 0 #a9422e;
	-webkit-box-shadow: 0 1px 0 #a9422e,0px -1px 0 #a9422e;
	-moz-box-shadow: 0 1px 0 #a9422e,0px -1px 0 #a9422e;
	background-color: #E95C41;
}
.btn.blue{
	border-top: 1px solid #9BD0C2;
	border-bottom: 1px solid #9BD0C2;
	box-shadow: 0 1px 0 #C9E6DE,0px -1px 0 #C9E6DE;
	-webkit-box-shadow: 0 1px 0 #C9E6DE,0px -1px 0 #C9E6DE;
	-moz-box-shadow: 0 1px 0 #C9E6DE,0px -1px 0 #C9E6DE;
	background-color: #72C1B0;
}
</style>
<table width="100%">
<tr>
<td>
	<img src="http://static.mailchimp.com/www/images/about/brand-assets/Connected-Logo_Light-Background.jpg"><br/>
</td>
<td>
[{if $blBatch}]
<form name="edit" id="edit" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_mailchimp">
    <input type="hidden" name="fnc" value="syncall">
    <input type="hidden" name="page" value="[{$page}]">
        
    <input class="btn orange" type="submit" disabled="disabled" value="Running batch, please wait ..."/> 
    
</form>
<script type="text/javascript">
	$(function(){
		$("#edit").submit();
	});
</script>


[{elseif $edit}]
<form name="edit" id="edit" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_mailchimp">
    <input type="hidden" name="fnc" value="syncone">
    
    <p>Synchronize user <strong>[{$edit->oxuser__oxusername->value}]</strong> with my mailchimp account<p>
    <input class="btnswitch btn [{if $blSubscribed}]orange[{else}]blue[{/if}]" type="submit" value="[{if $blSubscribed}]un[{/if}]subscribe" rel="processing ..."/> 
    
</form>
[{else}]
<form name="edit" id="edit" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_mailchimp">
    <input type="hidden" name="fnc" value="syncall">
    
    <p>Synchronize all my newsletter customers with my mailchimp account<p>
    <input class="btnswitch btn orange" type="submit" value="Sync Now!" rel="processing ..."/> 
    
</form>
[{/if}]
</td>
</tr>
</table>

[{include file="bottomnaviitem.tpl"}]
</table>
[{include file="bottomitem.tpl"}]
