[{include file="headitem.tpl" title="SHIRTNETWORK_ADMIN_TITLE"|oxmultilangassign}]

<script type="text/javascript">
<!--
function deleteThis( sID)
{
    blCheck = confirm("Really delete this?");
    if( blCheck == true)
    {
        var oSearch = document.getElementById("myadd");
        oSearch.fnc.value='delete';
        oSearch.foxid.value=sID;
        oSearch.submit();
    }
}
function editThis(sID){
	
	var oSearch = document.getElementById("myadd");
    oSearch.fnc.value='edit';
    oSearch.foxid.value=sID;
    oSearch.submit();
	 
	
}
//-->
</script>

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="mailchimp_campaign_content">
</form>

<table width="98%">
<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">
	<form name="myedit" name="myedit" action="[{ $oViewConf->getSelfLink() }]" method="post" class="form-stacked">
	[{ $oViewConf->getHiddenSid() }]
	<input type="hidden" name="cl" value="mailchimp_campaign_content">			
	<input type="hidden" name="fnc" value="save">
	<input type="hidden" name="oxid" value="[{ $oxid }]">
	<input type="hidden" name="editval[campaign]" value="[{ $oxid }]">
	<tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_CAMPAIGN_TEMPLATE" }]&nbsp;
      </td>
      <td class="edittext">
      	<input type="text" class="editinput" size="32" maxlength="255" name="editval[template]" value="[{$edit->mccampaigns__template->value}]">        
      </td>
    </tr>
	<tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_CAMPAIGN_PLAIN_TEMPLATE" }]&nbsp;
      </td>
      <td class="edittext">
      	<input type="text" class="editinput" size="32" maxlength="255" name="editval[plaintemplate]" value="[{$edit->mccampaigns__plaintemplate->value}]">        
      </td>
    </tr>	
    <tr>
	    <td class="edittext" colspan="2"><br><br>
	    <input type="submit" class="edittext" id="oLockButton" name="saveArticle" value="[{ oxmultilang ident="ARTICLE_MAIN_SAVE" }]" onClick="Javascript:document.myedit.fnc.value='save'" [{ $readonly }]>
	    </td>
    </tr>
	</form>	
</table>

</td>
<td>


<form name="myadd" id="myadd" action="[{$oViewConf->getSelfLink()}]" method="post" style="padding: 0px;margin: 0px;">
[{$oViewConf->getHiddenSid()}]
<input type="hidden" name="cl" value="mailchimp_campaign_content">
<input type="hidden" name="fnc" value="addoption">
<input type="hidden" name="foxid" value="[{$editparam->mccampaignoptions__oxid->value}]">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[mccampaignoptions__campaign]" value="[{$oxid}]">
<table cellspacing="0" cellpadding="0" border="0" style="width:730px;">        
	<colgroup>
        <col width="10%">
        <col width="25%">
        <col width="25%">
        <col width="20%">
        <col width="20%">
    </colgroup>
	<tr>
		<td class="listheader">[{oxmultilang ident='MC_OPTION_EDIT'}]</td>
		<td class="listheader">[{oxmultilang ident='MC_OPTION_TYPE'}]</td>
		<td class="listheader">[{oxmultilang ident='MC_OPTION_IDENT'}]</td>
		<td class="listheader">[{oxmultilang ident='MC_OPTION_VALUE'}]</td>
		<td class="listheader">&nbsp;</td>
	</tr>
	<tr>
		<td class="[{ $listclass}]">&nbsp;</td>
	    <td class="[{ $listclass}]">
	    	<select name="editval[mccampaignoptions__type]">
	    		<option value="text">Text</option>
	    		<option value="action">Action Articles</option>
	    		<option value="category">Category Articles</option>
	    		<option value="cms">CMS</option>
	    	</select>
	  	</td>
	  	<td class="[{ $listclass}]">
	  		<input type="text" class="editinput" size="15" maxlength="[{$editparam->mccampaignoptions__ident->fldmax_length}]" name="editval[mccampaignoptions__ident]" value="[{$editparam->mccampaignoptions__ident->value}]" [{ $readonly }]>
	  	</td>
	  	<td class="[{ $listclass}]">
	  		<input type="text" class="editinput" size="15" maxlength="[{$editparam->mccampaignoptions__value->fldmax_length}]" name="editval[mccampaignoptions__value]" value="[{$editparam->mccampaignoptions__value->value}]" [{ $readonly }]> 		
	  	</td>
	  	<td class="[{ $listclass}]">
	  		<input class="edittext" type="submit" value="[{ oxmultilang ident="ARTICLE_MAIN_SAVE" }]" [{ $readonly }]>
	  	</td>
	</tr>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
</table>
</form>

<form name="mylistedit" id="mylistedit" action="[{$oViewConf->getSelfLink()}]" method="post" style="padding: 0px;margin: 0px;">
[{$oViewConf->getHiddenSid()}]
<input type="hidden" name="cl" value="mailchimp_campaign_content">
<input type="hidden" name="fnc" value="saveoptions">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<table  cellspacing="0" cellpadding="0" border="0" style="width:730px;">	
	<colgroup>
        <col width="10%">
        <col width="25%">
        <col width="25%">
        <col width="20%">
        <col width="20%">
    </colgroup>
	
	[{foreach from=$options item=listitem}]
	[{assign var="listclass" value=listitem$blWhite }]
	<tr>
	    <td class="[{ $listclass}]"><a href="Javascript:editThis('[{ $listitem->mccampaignoptions__oxid->value}]');" class="[{ $listclass}]" [{ $readonly }]><img src="[{$oViewConf->getImageUrl()}]/editvariant.gif" width="15" height="15" alt="" border="0" align="absmiddle"></a></td>
        
        <td class="[{ $listclass}]">
	    	<select name="editval[[{$listitem->mccampaignoptions__oxid->value}]][mccampaignoptions__type]">
	    		<option value="text"[{if $listitem->mccampaignoptions__type->value == 'text'}] selected="selected"[{/if}]>Text</option>
	    		<option value="action"[{if $listitem->mccampaignoptions__type->value == 'action'}] selected="selected"[{/if}]>Action Articles</option>
	    		<option value="category"[{if $listitem->mccampaignoptions__type->value == 'category'}] selected="selected"[{/if}]>Category Articles</option>
	    		<option value="cms"[{if $listitem->mccampaignoptions__type->value == 'cms'}] selected="selected"[{/if}]>CMS</option>
	    	</select>
	  	</td>
	  	<td class="[{ $listclass}]">
	  		<input type="text" class="editinput" size="15" maxlength="[{$listitem->mccampaignoptions__ident->fldmax_length}]" name="editval[[{$listitem->mccampaignoptions__oxid->value}]][mccampaignoptions__ident]" value="[{$listitem->mccampaignoptions__ident->value}]" [{ $readonly }]>
	  	</td>
	  	<td class="[{ $listclass}]">
	  		<input type="text" class="editinput" size="15" maxlength="[{$listitem->mccampaignoptions__value->fldmax_length}]" name="editval[[{$listitem->mccampaignoptions__oxid->value}]][mccampaignoptions__value]" value="[{$listitem->mccampaignoptions__value->value}]" [{ $readonly }]> 		
	  	</td>
        
	    <td class="[{ $listclass}]">
          <a href="Javascript:deleteThis('[{ $listitem->mccampaignoptions__oxid->value }]');" class="delete"></a>
        </td>
	</tr>
	[{if $blWhite == "2"}]
		[{assign var="blWhite" value=""}]
	[{else}]
		[{assign var="blWhite" value="2"}]
	[{/if}]
	[{/foreach}]
	<tr>
		<td colspan="4">&nbsp;</td>
		<td><input class="edittext" type="submit" value="[{oxmultilang ident='MC_SAVE_OPTIONS'}]" [{ $readonly }]></td>
	<tr>
</table>      
</form>


</td>
</tr>
</table>
[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]