[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign box="list"}]

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<script type="text/javascript">
<!--
window.onload = function ()
{
    top.reloadEditFrame();
    [{ if $updatelist == 1}]
        top.oxid.admin.updateList('[{ $oxid }]');
    [{ /if}]
}
//-->
</script>

<div id="liste">


<form name="search" id="search" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{include file="_formparams.tpl" cl="mailchimp_campaign_list" lstrt=$lstrt actedit=$actedit oxid=$oxid fnc="" language=$actlang editlanguage=$actlang}]

<table cellspacing="0" cellpadding="0" border="0" width="100%">
    <colgroup>
        <col width="3%">
        <col width="10%">
        <col width="45%">
        <col width="30%">
        <col width="2%">
    </colgroup>
    <tr class="listitem">
     <td valign="top" class="listfilter first" align="right">
        <div class="r1"><div class="b1">&nbsp;</div></div>
    </td>
    <td valign="top" class="listfilter" align="left">
        <div class="r1"><div class="b1">
        <input class="listedit" type="text" size="9" maxlength="128" name="where[campaigns][status]" value="[{ $where->status}]">
        </div></div>
    </td>
    <td height="20" valign="middle" class="listfilter" nowrap>
        <div class="r1"><div class="b1">
        <input class="listedit" type="text" size="25" maxlength="128" name="where[campaigns][name]" value="[{ $where->name}]">
        <select name="where[campaigns][content_type]" class="editinput" onChange="Javascript:document.search.lstrt.value=0;document.search.submit();">
	        <option value="">---</option>
	        <option value="regular">regular</option>
	        <option value="plaintext">plaintext</option>
	        <option value="absplit">absplit</option>
	        <option value="rss">rss</option>
	        <option value="inspection">inspection</option>
	        <option value="trans">trans</option>
	        <option value="auto">auto</option>
        </select>
        
        </div></div>
    </td>
    <td valign="top" class="listfilter" colspan="2" nowrap>
        <div class="r1"><div class="b1">
        <div class="find">
        <input class="listedit" type="submit" name="submitit" value="[{ oxmultilang ident="GENERAL_SEARCH" }]" onClick="Javascript:document.search.lstrt.value=0;">
        </div>
        <input class="listedit" type="text" size="9" maxlength="128" name="where[campaigns][web_id]" value="[{ $where->web_id}]">
        </div></div>
    </td>
</tr>
<tr class="listitem">
<tr>
    <td class="listheader first" height="15" width="30" align="center"><a href="Javascript:return false;" class="listheader">[{ oxmultilang ident="MC_STATUS" }]</a></td>
    <td class="listheader"><a href="Javascript:return false;" class="listheader">[{ oxmultilang ident="MC_TYPE" }]</a></td>
    <td class="listheader" height="15">&nbsp;<a href="Javascript:return false;" class="listheader">[{ oxmultilang ident="MC_TITLE" }]</a></td>
    <td class="listheader" colspan="2"><a href="Javascript:return false;" class="listheader">[{ oxmultilang ident="MC_WEBID" }]</a></td>
</tr>

[{assign var="blWhite" value=""}]
[{assign var="_cnt" value=0}]
[{foreach from=$mylist item=listitem}]
    [{assign var="_cnt" value=$_cnt+1}]
    <tr id="row.[{$_cnt}]">

    [{assign var="listclass" value=listitem$blWhite }]
    [{ if $listitem.id == $oxid }]
        [{assign var="listclass" value=listitem4 }]
    [{ /if}]
    <td valign="top" class="[{ $listclass}]" height="15"><div class="listitemfloating">[{ $listitem.status }]</a></div></td>
    <td valign="top" class="[{ $listclass}]"><div class="listitemfloating"><a href="Javascript:top.oxid.admin.editThis('[{ $listitem.id }]');" class="[{ $listclass}]">[{ $listitem.type }]</a></div></td>
    <td valign="top" class="[{ $listclass}]" height="15"><div class="listitemfloating">&nbsp;<a href="Javascript:top.oxid.admin.editThis('[{ $listitem.id }]');" class="[{ $listclass}]">[{ $listitem.title }]</a></div></td>
    <td valign="top" class="[{ $listclass}]"><div class="listitemfloating"><a href="Javascript:top.oxid.admin.editThis('[{ $listitem.id }]');" class="[{ $listclass}]">[{ $listitem.web_id }]</a></div></td>
    <td class="[{ $listclass}]">
      <a href="Javascript:top.oxid.admin.deleteThis('[{ $listitem.id }]');" class="delete" id="del.[{$_cnt}]"title="" [{include file="help.tpl" helpid=item_delete}]></a>      
    </td>
</tr>
[{if $blWhite == "2"}]
[{assign var="blWhite" value=""}]
[{else}]
[{assign var="blWhite" value="2"}]
[{/if}]
[{/foreach}]
[{include file="pagenavisnippet.tpl" colspan="5"}]
</table>
</form>
</div>

[{include file="pagetabsnippet.tpl"}]

<script type="text/javascript">
if (parent.parent)
{   parent.parent.sShopTitle   = "[{$actshopobj->oxshops__oxname->getRawValue()|oxaddslashes}]";
    parent.parent.sMenuItem    = "[{ oxmultilang ident="GENERAL_MENUITEM" }]";
    parent.parent.sMenuSubItem = "[{ oxmultilang ident="ARTICLE_LIST_MENUSUBITEM" }]";
    parent.parent.sWorkArea    = "[{$_act}]";
    parent.parent.setTitle();
}
</script>
</body>
</html>