[{* Enter your custom HTML here *}]

[{if $bottom_buttons->mailchimp_sync }]
<li><a [{if !$firstitem}]class="firstitem"[{assign var="firstitem" value="1"}][{/if}] id="btn.mailchimp_sync" href="#" onClick="Javascript:parent.list.document.search.actedit.value=6;document.location='[{$oViewConf->getSelfLink()|replace:"&amp;":"&"}]&cl=user_mailchimp&oxid=-1';return false" target="edit">[{oxmultilang ident="MC_SYNC_ALL_USERS"}]</a> |</li>
[{/if}]

[{if $bottom_buttons->mailchimp_sync && $oxid != "-1" }]
<li><a [{if !$firstitem}]class="firstitem"[{assign var="firstitem" value="1"}][{/if}] id="btn.mailchimp_sync" href="#" onClick="Javascript:parent.list.document.search.actedit.value=6;document.location='[{$oViewConf->getSelfLink()|replace:"&amp;":"&"}]&cl=user_mailchimp&oxid=[{$oxid}]';return false" target="edit">[{oxmultilang ident="MC_SYNC_USER"}]</a> |</li>
[{/if}]

[{if $bottom_buttons->mailchimp_campaign_new }]
<li><a [{if !$firstitem}]class="firstitem"[{assign var="firstitem" value="1"}][{/if}] id="btn.mailchimp_campaign_new" href="#" onClick="Javascript:document.location='[{$oViewConf->getSelfLink()|replace:"&amp;":"&"}]&cl=mailchimp_campaign_main&oxid=-1';return false" target="edit">[{oxmultilang ident="MC_CAMPAIGN_NEW"}]</a> |</li>
[{/if}]