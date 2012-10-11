<?php

class Mailchimp_Configuration_Main extends oxAdminDetails
{
    public function render()
    {
        parent::render();

        $myConfig = $this->getConfig();
		
		$aOptions = array(
			'mc_apikey' => $myConfig->getShopConfVar('mc_apikey'),
			'mc_listid' => $myConfig->getShopConfVar('mc_listid')
		);
		
		$this->_aViewData["options"] = $aOptions;
		
        return "mailchimp_configuration_main.tpl";
    }

    public function save()
    {
    	$myConfig  = $this->getConfig();
		
		$aOptions = oxConfig::getParameter('editval');
		foreach($aOptions as $sKey => $sValue){
			$myConfig->saveShopConfVar('str',$sKey,$sValue);
		}		
    }
}
