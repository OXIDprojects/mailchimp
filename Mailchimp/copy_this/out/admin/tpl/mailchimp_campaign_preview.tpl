[{include file="headitem.tpl" title="SHIRTNETWORK_ADMIN_TITLE"|oxmultilangassign}]

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="mailchimp_campaign_preview">
</form>

<form name="mylistedit" id="mylistedit" action="[{$oViewConf->getSelfLink()}]" method="post" style="padding: 0px;margin: 0px;">
	[{$oViewConf->getHiddenSid()}]
	<input type="hidden" name="cl" value="mailchimp_campaign_preview">
	<input type="hidden" name="fnc" value="sendtest">
	<input type="hidden" name="oxid" value="[{ $oxid }]">
	<p>
	Send Test Mails to: <input type="text" name="mailtarget" value="" />
	<input type="submit" value="Send Test" />
	</p>
	<iframe src="[{$previewUrl}]" width="100%" height="10000" frameborder="0" />
</form>	

</table>
[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]