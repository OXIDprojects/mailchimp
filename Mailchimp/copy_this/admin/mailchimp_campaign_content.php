<?php

class Mailchimp_Campaign_Content extends oxAdminDetails
{
    public function render()
    {
        parent::render();
        $myConfig = $this->getConfig();
		
		$this->_aViewData["edit"] = $this->_getCampaign();
		$this->_aViewData["options"] = $this->_getCampaignOptions();
						
        return "mailchimp_campaign_content.tpl";
    }
					
	public function save(){
		$aResult = oxConfig::getParameter("editval");
		$oCampaign = $this->_getCampaign();
		$oCampaign->assign($aResult);
		$oCampaign->save();
		$this->_oCampaign = $oCampaign;		
	}
	
	public function delete(){
		$oOption = oxNew("mccampaignoption");
		$oOption->load(oxConfig::getParameter("foxid"));
		$oOption->delete();
	}
	
	public function addoption(){
		$aResult = oxConfig::getParameter("editval");
		$oOption = oxNew("mccampaignoption");
		$oOption->load(oxConfig::getParameter("foxid"));
		$oOption->assign($aResult);
		$oOption->save();
	}
	
	public function saveoptions(){
		$aResult = oxConfig::getParameter("editval");
		foreach($aResult as $sOxid => $aValues){
			$oOption = oxNew("mccampaignoption");
			$oOption->load($sOxid);
			$oOption->assign($aValues);
			$oOption->save();
		}
	}
	
	protected $_oCampaign;
	
	protected function _getCampaign(){
		if($this->_oCampaign === null){
			$this->_oCampaign = false;	
			$sOxid = oxConfig::getParameter("oxid");
			if($sOxid && $sOxid != -1){
				$this->_oCampaign = oxNew("mccampaign");
				$this->_oCampaign->loadByCampaign($sOxid);
			}
		}	
		return $this->_oCampaign;				
	}
			
	protected $_oCampaignOptions;
	
	protected function _getCampaignOptions(){
		if($this->_oCampaignOptions === null){
			$this->_oCampaignOptions = false;	
			$sOxid = oxConfig::getParameter("oxid");
			if($sOxid && $sOxid != -1){
				$this->_oCampaignOptions = oxNew("mccampaignoptionlist");
				$this->_oCampaignOptions->loadCampaignOptions($sOxid);
			}
		}	
		return $this->_oCampaignOptions;				
	}

}
