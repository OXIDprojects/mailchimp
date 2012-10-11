<?php

class mccampaign extends oxBase{
	
    protected $_sCoreTbl = 'mccampaigns';
    protected $_sClassName = 'mccampaign';	
	protected $_blUseLazyLoading = true;
	
	public function __construct($aParams = null)
    {
        parent::__construct();
        $this->init($this->_sCoreTbl);
    }
	
	public function saveOptions($aOptions){
		foreach($aOptions as $sOxid => $aValue){
			$oOption = oxNew("mccampaignoption");
			$oOption->load($sOxid);
			$oOption->assign($aValue);
			$oOption->save();
		}		
	}
	
	public function loadByCampaign($sId){
		$oDb = oxDb::getDb();
		$sQ = "SELECT oxid FROM mccampaigns WHERE campaign = " . $oDb->quote($sId);
		$sOxid = $oDb->GetOne($sQ);
		return $this->load($sOxid);
	}
        
}
