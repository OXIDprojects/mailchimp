<?php

require_once('MCAPI.class.php');

//Adds caching 

class OXMCAPI extends MCAPI{
	
	protected $_aCacheableMethods = array(
		'campaigns','lists','templates','folders'
	);
	
	function callServer($method, $params) {
		
		$blCacheable = false;
		if(in_array($method, $this->_aCacheableMethods)){
			$blCacheable = true;
		}
		
		if($blCacheable){
			$sCacheKey = md5($method.serialize($params));
			$sCacheFileName = $sCacheKey.'.mailchimp';
			$sCacheFile = getShopBasePath() . 'tmp/' . $sCacheFileName;
			
			if(file_exists($sCacheFile)){
				//Check how old that file is
				$mtime = filemtime($sCacheFile);
				$maxage = 300; //Cache 5 minutes
				if(time() - $mtime >= $maxage){
					unlink($sCacheFile);
				}else{
					return unserialize(file_get_contents($sCacheFile));
				}
			}
		}
						
		$result = parent::callServer($method,$params);
		
		if($blCacheable)
			file_put_contents($sCacheFile, serialize($result));
		
		return $result;		
	}
	
	function clearCache(){
		foreach( glob(getShopBasePath().'tmp/*.mailchimp') as $sFile){
			unlink($sFile);
		}
	}
	
	function showError(){
		if($this->errorCode){
			oxUtilsView::getInstance()->addErrorToDisplay('#'.$this->errorCode.': '.$this->errorMessage);
		}
	}
	
}
