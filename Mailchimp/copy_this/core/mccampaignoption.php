<?php

class mccampaignoption extends oxBase{
	
    protected $_sCoreTbl = 'mccampaignoptions';
    protected $_sClassName = 'mccampaignoption';	
	protected $_blUseLazyLoading = true;
	
	public function __construct($aParams = null)
    {
        parent::__construct();
        $this->init($this->_sCoreTbl);
    }
	
        
}
