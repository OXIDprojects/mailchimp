[{include file="headitem.tpl" title="SHIRTNETWORK_ADMIN_TITLE"|oxmultilangassign}]

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="mailchimp_campaign_send">
</form>

[{assign var=liststats value=$list.stats}]
[{assign var=campaigntracking value=$campaign.tracking}]

<table>
<form name="mylistedit" id="mylistedit" action="[{$oViewConf->getSelfLink()}]" method="post" style="padding: 0px;margin: 0px;">
	[{$oViewConf->getHiddenSid()}]
	<input type="hidden" name="cl" value="mailchimp_campaign_send">
	<input type="hidden" name="fnc" value="send">
	<input type="hidden" name="oxid" value="[{ $oxid }]">
	<tr>
		<td><strong>List:</strong></td>
		<td>Mailchimp will deliver this to the [{$list.name}] List ([{$liststats.member_count}] Members)</td>
	</tr>
	<tr>
		<td><strong>Subject Line:</strong></td>
		<td>[{$campaign.subject}] </td>
	</tr>
	<tr>
		<td><strong>Replies:</strong></td>
		<td>All replies will go to <strong>[{$campaign.from_email}]</strong> </td>
	</tr>
	<tr>
		<td><strong>Tracking:</strong></td>
		<td>
			[{if $campaigntracking.html_clicks || $campaigntracking.text_clicks || $campaigntracking.opens}]
			You Choose to track [{if $campaigntracking.html_clicks}]html clicks, [{/if}][{if $campaigntracking.text_clicks}]text clicks, [{/if}][{if $campaigntracking.open_clicks}]open clicks[{/if}]
			[{else}]
			Tracking is disabled
			[{/if}]
		</td>
	</tr>
	<tr>
		<td><strong>HTML Email:</strong></td>
		<td>
			[{if $oxCampaign->mccampaigns__template->value}]
			You will be sending an HTML Mail using the template[{ $oxCampaign->mccampaigns__template->value}]
			[{else}]
			You have not entered any HTML Template, can not proceed!
			[{/if}]
		</td>
	</tr>
	<tr>
		<td><strong>Plain Email:</strong></td>
		<td>
			[{if $oxCampaign->mccampaigns__plaintemplate->value}]
			You will be sending an Plaintext Mail using the template[{ $oxCampaign->mccampaigns__plaintemplate->value}]
			[{else}]
			You have not entered any Plain Template, only HTML will be sent!
			[{/if}]
		</td>
	</tr>
	<tr>
		<td><strong>Email Authentication:</strong></td>
		<td>
			[{if $campaign.authenticate}]
			Automatic email authentication will be enabled for this message.
			[{else}]
			Automatic email authentication will <strong>not</strong> be enabled for this message.
			[{/if}]
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="SEND NOW" />
		</td>		
	</tr>
</form>

</table>

[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]