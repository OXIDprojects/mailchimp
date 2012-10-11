<?php

class Mailchimp_Campaign_Send extends oxAdminDetails
{
    public function render()
    {
        parent::render();
		$this->_aViewData['campaign'] = $this->_getCampaign();		
		$this->_aViewData['list'] = $this->_getList();
		
		$oCampaign = oxNew("mccampaign");
		$oCampaign->loadByCampaign(oxConfig::getParameter("oxid"));		
		$this->_aViewData['oxCampaign'] = $oCampaign;
		
        return "mailchimp_campaign_send.tpl";
    }	
	
	public function send(){
		$api = mailchimp::getApi();
		
		//Update Campaign before sending, so most recent content will be used
		$sOxid = oxConfig::getParameter("oxid");
		$api->campaignUpdate($sOxid,'content',array('url' => mailchimp::getCampaignUrl($sOxid)));		
		
		//Now do the monkey dance
		$api->campaignSendNow($sOxid);
		
		if($api->errorCode){
			oxUtilsView::getInstance()->addErrorToDisplay('#'.$api->errorCode.': '.$api->errorMessage);
		}else{
			$api->clearCache();
			$this->_aViewData['updatelist'] = 1;
			oxUtilsView::getInstance()->addErrorToDisplay('Process succeeded, please wait for mailchimp to process your queue!');
		}
	}
	
	protected $_aCampaign;
	
	protected function _getCampaign(){
		if($this->_aCampaign === null){
			$this->_aCampaign = false;	
			$sOxid = oxConfig::getParameter("oxid");
			$api = mailchimp::getApi();			
			$aResult = $api->campaigns(array('campaign_id' => $sOxid));
			
			if($aResult['total'] > 0){
				$this->_aCampaign = $aResult['data'][0];
			}			
			
		}	
		return $this->_aCampaign;				
	}
	
	protected $_aList;
	
	protected function _getList(){
		if($this->_aList === null){
			$this->_aList = false;
			$aCampaign = $this->_getCampaign();
			$list = $aCampaign['list_id'];	
			$api = mailchimp::getApi();			
			$aResult = $api->lists(array('list_id' => $list));
			
			if($aResult['total'] > 0){
				$this->_aList = $aResult['data'][0];
			}			
			
		}	
		return $this->_aList;				
	}
}
