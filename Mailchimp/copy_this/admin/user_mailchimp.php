<?php

class User_Mailchimp extends oxAdminDetails
{
    /**
     * Executes parent method parent::render(), passes data to Smarty engine and
     * returns name of template file "user_overview.tpl".
     *
     * @return string
     */
    public function render()
    {
        parent::render();

        $this->_aViewData['edit'] = $this->getEditUser();
        if($this->getEditUser()){
        	$this->_aViewData['blSubscribed'] = $this->getEditUser()->getNewsSubscription()->getOptInStatus() != 0;
        }

        return "user_mailchimp.tpl";
    }
    
    public function syncall(){
    	$iCurrentPage = intval(oxConfig::getParameter("page"));
    	$iUsersPerRun = 2;
    	$iStart = $iCurrentPage * $iUsersPerRun;
    	
    	$oDb = oxDb::getDb();
    	$sQ  = "SELECT oxemail,oxfname,oxlname FROM oxnewssubscribed WHERE oxdboptin = 1 LIMIT $iStart, $iUsersPerRun";
    	$rs = $oDb->Execute($sQ);
    	
    	$aBatchUsers = array();
    	
    	while(!$rs->EOF){
    		$aUser = array(
    			'EMAIL' => $rs->fields[0],
    			'FNAME' => $rs->fields[1],
    			'LNAME' => $rs->fields[2]
    		);
    		$aBatchUsers[] = $aUser;
    		$rs->MoveNext();
    	}
    	
    	$api = mailchimp::getApi();
    	$retval = $api->listBatchSubscribe( mailchimp::getListId(), $aBatchUsers, false, true, false );
    
    	
    	if( count($aBatchUsers) >= $iUsersPerRun){
    		$this->_aViewData['blBatch'] = true;
    		$this->_aViewData['page'] = $iCurrentPage + 1;
    	}
    }
    
    public function syncone(){
    	$api = mailchimp::getApi();
		$oSubscription = $this->getEditUser()->getNewsSubscription();
		$blSubscribe = $oSubscription->getOptInStatus() == 0;
		
		if($blSubscribe){
			$merge_vars = array('FNAME'=>$oSubscription->oxnewssubscribed__oxfname->value, 'LNAME'=>$oSubscription->oxnewssubscribed__oxlname->value);			
			$retval = $api->listSubscribe( mailchimp::getListId(), $oSubscription->oxnewssubscribed__oxemail->value, $merge_vars );				
			oxUtilsView::getInstance()->addErrorToDisplay('User was added to your list');
			$oSubscription->setOptInStatus( 1 );
			$this->getEditUser()->addToGroup( 'oxidnewsletter' );
		}else{
			$retval = $api->listUnsubscribe( mailchimp::getListId(), $oSubscription->oxnewssubscribed__oxemail->value );
			oxUtilsView::getInstance()->addErrorToDisplay('User was removed from your list');
			$oSubscription->setOptInStatus( 0 );
			$this->getEditUser()->removeFromGroup( 'oxidnewsletter' );
		}
		
    }
    
    protected $_oEditUser;
    
    public function getEditUser(){
    	if($this->_oEditUser === null){
	    	$this->_oEditUser = false;
	    	$soxId = $this->getEditObjectId();
	    	if ( $soxId != "-1" && isset( $soxId ) ) {
	    	    // load object
	    	    $this->_oEditUser = oxNew( "oxuser" );
	    	    $this->_oEditUser->load( $soxId );
	    	}
    	}
    	return $this->_oEditUser;
    }
    
}
