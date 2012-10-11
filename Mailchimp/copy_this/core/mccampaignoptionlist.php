<?php

class mccampaignoptionlist extends oxList
{
    /**
     * @var string SQL addon for sorting
     */
    protected $_sCustomSorting;

    /**
     * List Object class name
     *
     * @var string
     */
    protected $_sObjectsInListName = 'mccampaignoption';
    
	public function loadCampaignOptions( $sOxid ){
		
		$oDb = oxDb::getDb();
		$sSelect = 'SELECT * FROM mccampaignoptions WHERE campaign = ' . $oDb->quote($sOxid);
		
		$this->selectString( $sSelect );      		
	}

}
