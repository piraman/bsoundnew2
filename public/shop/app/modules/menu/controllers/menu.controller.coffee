define ['../menu.module'], (menu) ->
	'use strict'
	menu.controller 'MenuController', [
		'$scope'
		'$http'
		'API_URL'
		($scope, $http, API_URL) ->
			promise = $http.get API_URL + '/settings'
			promise.success (settings) ->
				$scope.menutree = settings[0].menutree
	]
