<?php

class Mailchimp_Campaign_Main extends oxAdminDetails
{
    public function render()
    {
        parent::render();
        		
		$this->_aViewData["edit"] = $this->_getCampaign();
		
        return "mailchimp_campaign_main.tpl";
    }
	
	public function save(){
		$aResult = oxConfig::getParameter("editval");
		$api = mailchimp::getApi();
		$myConfig = $this->getConfig();		
		$sOxid = oxConfig::getParameter("oxid");
		
		if(!$sOxid || $sOxid == -1){
			//Create new campaign			
			$sType = $aResult['type'];
			unset($aResult['type']);			
			$sOxid = $api->campaignCreate($sType,$aResult,array('url' => mailchimp::getCampaignUrl('oxid')));						
			//kind of hackish :)
			$_POST['oxid'] = $sOxid;
			$api->clearCache();
			$api->showError();			
			$this->_aViewData['updatelist'] = 1;
		}else{
			//Update campaing
			$aCurrent = $this->_getCampaign();
			foreach($aResult as $sKey => $sValue){
				if($sValue != $aCurrent[$sKey]){
					//Field changed, update			
					$api->campaignUpdate($aCurrent['id'], $sKey, $sValue);
					//Update internally to reflect changes on reload
					$aCurrent[$sKey] = $sValue;
					$this->_aViewData['updatelist'] = 1;
				}
			}
		}
		
		$api->campaignUpdate($sOxid,'content',array('url' => mailchimp::getCampaignUrl($sOxid)));
	}
	
	public function getFieldType($sKey){
		return mailchimp::getFieldType('campaign', $sKey);		
	}
	
	public function getAllowedValues($aFieldType){
		$sFieldType = $aFieldType['type'];
		$aAllowed = $aFieldType['allows'];
		if(is_array($aAllowed)){
			if($aAllowed['total'] > 0){
				return $aAllowed['data'];
			}
		}else{
			return explode(",",$aAllowed);
		}
	}
	
	protected $_aCampaign;
	
	protected function _getCampaign(){
		if($this->_aCampaign === null){
			$this->_aCampaign = false;	
			$sOxid = oxConfig::getParameter("oxid");
			if($sOxid && $sOxid != -1){
				$api = mailchimp::getApi();			
				$aResult = $api->campaigns(array('campaign_id' => $sOxid));
				
				if($aResult['total'] > 0){
					$this->_aCampaign = $aResult['data'][0];
				}				
			}else{
				$aFields = mailchimp::getFields('campaign');
				$aPost = oxConfig::getParameter('editval');
				
				$aCampaign = array();
				foreach($aFields as $sKey => $sField){
					$aCampaign[$sKey] = @$aPost[$sKey];
				}
				$this->_aCampaign = $aCampaign;
			}
		}	
		return $this->_aCampaign;				
	}
	
	

}
