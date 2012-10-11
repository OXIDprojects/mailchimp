<?php

class mailchimp_configuration_list extends oxAdminList
{
    /**
     * Current class template name.
     * @var string
     */
    protected $_sThisTemplate = 'mailchimp_configuration_list.tpl';
    
    public function render(){
    	parent::render();
    	$this->_aViewData["oxid"] = 1;
    	return $this->_sThisTemplate;
    }
		
}
