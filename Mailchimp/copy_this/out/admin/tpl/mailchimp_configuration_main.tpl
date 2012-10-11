[{include file="headitem.tpl" title="SHIRTNETWORK_ADMIN_TITLE"|oxmultilangassign}]

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="mailchimp_configuration_main">
</form>
	
<form name="myedit" name="myedit" action="[{ $oViewConf->getSelfLink() }]" method="post">
	[{ $oViewConf->getHiddenSid() }]
	<input type="hidden" name="cl" value="mailchimp_configuration_main">			
	<input type="hidden" name="fnc" value="save">
	
	<table>
		<tr>
			<td>[{ oxmultilang ident="MC_APIKEY" }]</td><td><input name="editval[mc_apikey]" type="text" value="[{ $options.mc_apikey }]" /></td>		
		</tr>
		<tr>
			<td>[{ oxmultilang ident="MC_LISTID" }]</td><td><input name="editval[mc_listid]" type="texst" value="[{ $options.mc_listid }]" /></td>
		</tr>
	</table>
	
	<input type="submit" value="[{ oxmultilang ident="GENERAL_SAVE" }]"></input>
		
	</form>	

[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]