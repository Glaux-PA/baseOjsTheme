<?php

namespace APP\plugins\themes\baseBootstrapFiveTheme;

use APP\core\Application;
use PKP\facades\Locale;
use PKP\plugins\ThemePlugin;

class BaseBootstrapFiveThemePlugin extends ThemePlugin {
	public function init() {
		$request = Application::get()->getRequest();
		$locale = Locale::getLocale();
		$localeMetadata = Locale::getMetadata($locale);

		//sets default Theme as parent so it inherits it's base styles
		$this->setParent('defaultthemeplugin');

		// RTL
		if ($localeMetadata->isRightToLeft()) {
			$this->addStyle('bootstrap-rtl', 'styles/bootstrap-rtl.min.css');
		}

		// Bootstrap 5 -> To add new styles or templates using BootStrap 5 
		$this->addStyle('bootstrap5', 'bootstrap/css/bootstrap.min.css');
		$this->addStyle('custom', 'styles/custom.css');
		$this->addScript('bootstrap5', 'bootstrap/js/bootstrap.bundle.min.js');

		
		$this->addMenuArea(['primary', 'user']);

		//This plugin has no options yet just the inherited, but this would be the method to implement them -> 
		// $this->addOption('optionName','OptionFieldType',[
		// 	'label' => __('label in locale'),
		// 	'description' => __('description in locale'),
		// 	'default' => 'default value',
		// ]);
	}

	function getDisplayName() {
		return __('plugins.themes.baseBootstrapFiveTheme.name');
	}

	function getDescription() {
		return __('plugins.themes.baseBootstrapFiveTheme.description');
	}
}

if (!PKP_STRICT_MODE) {
    class_alias('\APP\plugins\themes\baseBootstrapFiveTheme\BaseBootstrapFiveThemePlugin', '\B1aseBootstrapFiveThemePlugin');
}
