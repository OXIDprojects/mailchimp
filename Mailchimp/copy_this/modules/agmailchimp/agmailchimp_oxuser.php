<?php

	include_once(getShopBasePath().'modules/agmailchimp/MCAPI.class.php');
	include_once(getShopBasePath().'modules/agmailchimp/config.inc.php');
	
	class agmailchimp_oxuser extends agmailchimp_oxuser_parent{
		public function setNewsSubscription( $blSubscribe, $blSendOptIn ){
			//If MailChimp Integrator is active $blSendOptIn is always false for the shop as mailchimp sends a mail for that anyways
			$blSuccess = parent::setNewsSubscription($blSubscribe, false);
			
			if($blSuccess){
			
				$api = new MCAPI(MC_APIKEY);
				$oSubscription = $this->getNewsSubscription();

				if($blSubscribe){
					$merge_vars = array('FNAME'=>$oSubscription->oxnewssubscribed__oxfname->value, 'LNAME'=>$oSubscription->oxnewssubscribed__oxlname->value);			
					$retval = $api->listSubscribe( MC_LISTID, $oSubscription->oxnewssubscribed__oxemail->value, $merge_vars );				
				}else{
					$retval = $api->listUnsubscribe( MC_LISTID, $oSubscription->oxnewssubscribed__oxemail->value );
				}				
				
				if ($api->errorCode){
					//oxUtilsView::addErrorToDisplay('#'.$api->errorCode.': '.$api->errorMessage);	
				}		
			}
			
			return $blSuccess;
		}
	}
?>