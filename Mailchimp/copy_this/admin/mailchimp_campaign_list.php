<?php

class mailchimp_campaign_list extends oxAdminList
{
    /**
     * Current class template name.
     * @var string
     */
    protected $_sThisTemplate = 'mailchimp_campaign_list.tpl';
    
    public function render(){
    	parent::render();
						
		$this->_setupWhere();
    	$this->_calcListItemsCount("");
    	$this->_setCurrentListPosition( oxConfig::getParameter( 'jumppage' ) );
    	$this->_setListNavigationParams();
    	
    	$this->_aViewData["oxid"] = oxConfig::getParameter("oxid");
		$this->_aViewData["mylist"] = $this->_getCampaigns();
		
    	return $this->_sThisTemplate;
    }
	
	public function _setupWhere(){
    	$this->_aWhere = array();
    	$wParam = (array)oxConfig::getParameter("where");
    	
    	foreach($wParam as $key => $value){
    		if($value != "")
    			$this->_aWhere[$key] = $value;
    	}   
    		
    }
	
	protected function _applyWhere($data){
    	return $data;	
    	if(!$this->_aWhere || count($this->_aWhere) == 0) return $data;    	
    	$results = array();
    	foreach($data as $value){
    		$a = (array)$value;
    		$aWhere = $this->_aWhere['campaigns'];
    		foreach($aWhere as $key => $v){    			
    			if(@stristr($a[$key],$v) !== FALSE){    				
    				if(!in_array($value,$results)){    					
    					$results[] = $value;
    				}
    			}
    		}
    	}
    	
    	return $results;
    }
	
	protected $_aCampaigns;
	protected function _getCampaigns(){
		if(!$this->_aCampaigns){
			$api = mailchimp::getApi();			
			$aResult = $api->campaigns();
			$this->_iListSize = $aResult['total'];		
			$this->_aCampaigns =  $this->_applyWhere($aResult['data']);	
		}		
		return $this->_applyFilter($this->_aCampaigns);
	}
	
	protected function _applyFilter($data){
    		
    	$iAdminListSize = $this->_getViewListSize();
    	$iListPos = $this->_iCurrListPos;
    	$iEndPos = $iListPos + $iAdminListSize;
		
    	if($iEndPos > $this->_iListSize){
    		$iEndPos = $this->_iListSize;
    	}
    	
    	$results = array();
    	
    	for($i=$iListPos;$i<$iEndPos;$i++){
    		$results[] = $data[$i];
    	}
    	
    	return $results;
    } 
	
	protected function _calcListItemsCount( $sSql )
    {
    	$this->_getCampaigns();
    	oxSession::setVar( 'iArtCnt', $this->_iListSize );	
    }
	
	public function deleteEntry(){
		$sOxid = oxConfig::getParameter('oxid');
		$api = mailchimp::getApi();
		$blDelete = $api->campaignDelete($sOxid);
		
		if($blDelete){
			$_POST['oxid'] = -1;
			$api->clearCache();
		}
		
		$this->init();
	}
}
