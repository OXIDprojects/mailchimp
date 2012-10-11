[{include file="headitem.tpl" title="MC_ADMIN_TITLE"|oxmultilangassign}]
<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="mailchimp_campaign_main">
</form>

<table cellspacing="0" cellpadding="0" border="0">
<form name="myedit" name="myedit" action="[{ $oViewConf->getSelfLink() }]" method="post" class="form-stacked">
	[{ $oViewConf->getHiddenSid() }]
	<input type="hidden" name="cl" value="mailchimp_campaign_main">			
	<input type="hidden" name="fnc" value="save">
	<input type="hidden" name="oxid" value="[{ $oxid }]">
	
	<tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_LISTID" }]&nbsp;
      </td>
      <td class="edittext">
      	<select name="editval[list_id]" class="editinput">
      		[{assign var=oFieldType value=$oView->getFieldType('list_id')}]
      		[{assign var=aAllowed value=$oView->getAllowedValues($oFieldType)}]
      		[{foreach from=$aAllowed item=aSel}]
      		<option value="[{$aSel.id}]"[{if $aSel.id == $edit.list_id}] selected="selected"[{/if}]>[{$aSel.name}]</option>
      		[{/foreach}]
      	</select>        
      </td>
    </tr>
    <tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_CAMPAIGN_TYPE" }]&nbsp;
      </td>
      <td class="edittext">
      	<select name="editval[type]" class="editinput">
      		[{assign var=oFieldType value=$oView->getFieldType('type')}]
      		[{assign var=aAllowed value=$oView->getAllowedValues($oFieldType)}]
      		[{foreach from=$aAllowed item=aSel}]
      		<option value="[{$aSel}]"[{if $aSel == $edit.type}] selected="selected"[{/if}]>[{$aSel}]</option>
      		[{/foreach}]
      	</select>        
      </td>
    </tr>
    <tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_TITLE" }]&nbsp;
      </td>
      <td class="edittext">
        <input type="text" class="editinput" size="32" maxlength="255" name="editval[title]" value="[{$edit.title}]">
      </td>
    </tr>
    <tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_FROM_NAME" }]&nbsp;
      </td>
      <td class="edittext">
        <input type="text" class="editinput" size="32" maxlength="255" name="editval[from_name]" value="[{$edit.from_name}]">
      </td>
    </tr>
    <tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_FROM_EMAIL" }]&nbsp;
      </td>
      <td class="edittext">
        <input type="text" class="editinput" size="32" maxlength="255" name="editval[from_email]" value="[{$edit.from_email}]">
      </td>
    </tr>	
     <tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_SUBJECT" }]&nbsp;
      </td>
      <td class="edittext">
        <input type="text" class="editinput" size="32" maxlength="255" name="editval[subject]" value="[{$edit.subject}]">
      </td>
    </tr>
    <tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_TO_NAME" }]&nbsp;
      </td>
      <td class="edittext">
        <input type="text" class="editinput" size="32" maxlength="255" name="editval[to_name]" value="[{$edit.to_name}]">
      </td>
    </tr>
    <tr>
      <td class="edittext">
        [{ oxmultilang ident="MC_AUTHENTICATE" }]&nbsp;
      </td>
      <td class="edittext">
        <input type="hidden" name="editval[authenticate]" value="0">
        <input type="checkbox" value="1" name="editval[authenticate]" [{if $edit.authenticate}]checked="checked"[{/if}]>
      </td>
    </tr>
    <tr>
	    <td class="edittext" colspan="2"><br><br>
	    <input type="submit" class="edittext" id="oLockButton" name="saveArticle" value="[{ oxmultilang ident="ARTICLE_MAIN_SAVE" }]" onClick="Javascript:document.myedit.fnc.value='save'" [{ $readonly }]>
	    </td>
    </tr>

    		
	</form>	
</table>
[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]