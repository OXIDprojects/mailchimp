<?php

class Mailchimp_Campaign_Preview extends oxAdminDetails
{
    public function render()
    {
        parent::render();
		
        $this->_aViewData["previewUrl"] = mailchimp::getCampaignUrl(oxConfig::getParameter("oxid"));
						
        return "mailchimp_campaign_preview.tpl";
    }	
	
	public function sendtest(){
		$api = mailchimp::getApi();
		$api->campaignSendTest(oxConfig::getParameter("oxid"),array('coding@aggrosoft.de'));	
	}
}
