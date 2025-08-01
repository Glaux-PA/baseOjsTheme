<?php

namespace APP\plugins\themes\baseOjsTheme;

use APP\core\Application;
use PKP\facades\Locale;
use PKP\plugins\ThemePlugin;

class BaseOjsThemePlugin extends ThemePlugin {
	public function init() {
		$request = Application::get()->getRequest();
		$locale = Locale::getLocale();
		$localeMetadata = Locale::getMetadata($locale);

		$this->addStyle('styles', 'css/index.css');

		//Google Fonts
		$this->addStyle(
			'googleFontsSourceSans',
			'https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,100..900;1,100..900&display=swap',
			array('baseUrl' => '')
		);

		// BootsrapIcons
		$this->addStyle(
			'bootstrap',
			'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css',
			array('baseUrl' => '')
		);


		//Load js
		$this->addScript(
			'jQuery',
			'https://code.jquery.com/jquery-3.7.1.min.js',
				array('baseUrl' => ''),
		);

		$this->addOption('displayStats', 'FieldOptions', [
			'type' => 'radio',
			'label' => __('plugins.themes.default.option.displayStats.label'),
			'options' => [
				[
					'value' => 'none',
					'label' => __('plugins.themes.default.option.displayStats.none'),
				],
				[
					'value' => 'bar',
					'label' => __('plugins.themes.default.option.displayStats.bar'),
				],
				[
					'value' => 'line',
					'label' => __('plugins.themes.default.option.displayStats.line'),
				],
			],
			'default' => 'none',
		]);

		$this->addMenuArea(['primary', 'user']);
		$this->addScript('html_view', 'js/html_view.js');
		$this->addScript('script', 'js/script.js');
	}

	function getDisplayName() {
		return __('plugins.themes.baseOjsTheme.name');
	}
	

	function getDescription() {
		return __('plugins.themes.baseOjsTheme.description');
	}
}

if (!PKP_STRICT_MODE) {
    class_alias('\APP\plugins\themes\baseOjsTheme\BaseOjsThemePlugin', '\BaseOjsThemePlugin');
}
