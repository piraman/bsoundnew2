define ['../product.module'], (product) ->
	'use strict'
	product.controller 'ProductDocumentController', [
		'$scope'
		'$http'
		'Restangular'
		'$state'
		'$stateParams'
		'$sce'
		($scope, $http, Restangular, $state, $stateParams, $sce) ->
			product = Restangular.one 'products', $stateParams.product
			promise = do product.get
			promise.then (product) ->
				# product.overview = $sce.trustAsHtml product.overview
				$scope.product = product
				$scope.product.overviewSafe = $sce.trustAsHtml $scope.product.overview
	]