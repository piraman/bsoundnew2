define [
	'angular'
	'uirouter'
	'restangular'
	'uitree'
	'ngtagsinput'
], (angular) ->
	'use strict'
	menutree = angular.module 'app.menutree', [
		'ui.router'
		'restangular'
		'ui.tree'
		'ngTagsInput'
	]
	menutree.config [
		'$stateProvider'
		($stateProvider) ->
			$stateProvider
			.state 'menutree',
				controller: 'MenutreeController'
				templateUrl: './app/modules/menutree/templates/menutree.template.html'
				url: '/menutree'
	]
	return menutree