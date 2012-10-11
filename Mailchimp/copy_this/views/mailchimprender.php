<?php

class MailchimpRender extends oxUBase
{
    public function render()
    {
        parent::render();
        $myConfig = $this->getConfig();
		
		$oCampaign = $this->_getCampaign();		
		$oOptions  = $this->_getCampaignOptions();
		
		$blPlain = oxConfig::getParameter("plain") == 1;
		
		$this->_prepareOptions($oOptions);
						
        return $blPlain ? $oCampaign->mccampaigns__plaintemplate->value : $oCampaign->mccampaigns__template->value;
    }		
		
	protected function _prepareOptions($oOptions){
		foreach($oOptions as $oOption){
				
			$oData = null;
			
			switch($oOption->mccampaignoptions__type->value){
				case 'text';
					$oData = $oOption->mccampaignoptions__value->value;
					break;
				case 'action';
					$oData = oxNew("oxarticlelist");
					$oData->loadAktionArticles($oOption->mccampaignoptions__value->value);
					break;
				case 'category':
					$oData = oxNew("oxarticlelist");
					$oData->loadCategoryArticles($oOption->mccampaignoptions__value->value);
					break;
				case 'cms':
					$oData = oxNew("oxcontent");
					$oData->loadByIdent($oOption->mccampaignoptions__value->value);
					break;
			}
			
			$this->_aViewData[$oOption->mccampaignoptions__ident->value] = $oData;
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
