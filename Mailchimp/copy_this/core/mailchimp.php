<?php

include_once(getShopBasePath().'modules/agmailchimp/OXMCAPI.php');

class mailchimp extends oxStdClass{
	
	static $_api;
	
	public static function getApi(){
		if(!self::$_api){
			$oConf = oxConfig::getInstance();
			self::$_api = new OXMCAPI($oConf->getShopConfVar('mc_apikey'));
		}
		return self::$_api;
	}
	
	public static function getListId(){
		$oConf = oxConfig::getInstance();
		return $oConf->getShopConfVar('mc_listid'); 
	}
		
	public static function getFieldType($sType,$sField){
		if(isset(self::$_aFields[$sType])){
			if(isset(self::$_aFields[$sType][$sField])){
				$sFieldType = self::$_aFields[$sType][$sField];
				if ($sFieldType == 'list'){						
					$api = self::getApi();
					$aLists = $api->lists();
					
					$aResult = array('type' => $sFieldType, 'allows' => $aLists);
					return $aResult;
				}elseif($sFieldType == 'template'){
					$api = self::getApi();
					$aLists = $api->templates();
					
					$aResult = array('type' => $sFieldType, 'allows' => $aLists);
					return $aResult;
				}elseif($sFieldType == 'folder'){
					$api = self::getApi();
					$aLists = $api->folders();
					
					$aResult = array('type' => $sFieldType, 'allows' => $aLists);
					return $aResult;
				}
				return $sFieldType;
			}
		}
		return false;
	}

	public static function getCampaignUrl($sOxid){
		$myConfig = oxConfig::getInstance();
		$sUrl = $myConfig->getShopUrl(null,false);
		$sUrl .= '/index.php?cl=mailchimprender&oxid='.$sOxid;
		return $sUrl;
	}

	public function getFields($sType){
		return self::$_aFields[$sType];
	}
	
	static $_aFields = array(
		'campaign' => array(
			'list_id' => 'list',
			'folder_id' => 'folder',
			'template_id' => 'template',
			'content_type' => array('type' => 'string', 'allows' => 'template,html,url'),
			'title' => 'string',
			'type' => array('type' => 'string', 'allows' => 'regular,plaintext,absplit,rss,inspection,trans,auto'),
			'from_name' => 'string',
			'from_email' => 'string',
			'subject' => 'string',
			'to_name' => 'string',
			'inline_css' => 'boolean',
			'authenticate' => 'boolean',
			'ecomm360' => 'boolean',
			'auto_tweet' => 'boolean',
			'auto_fb_post' => 'string',
			'auto_footer' => 'boolean',
			'timewarp' => 'boolean',
			'tracking' => 'array'			
		)
	);
	
}
