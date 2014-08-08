define ['../product.module'], (product) ->
	'use strict'
	product.controller 'ProductDocumentController', [
		'$scope'
		'$state'
		'$stateParams'
		'$http'
		'Restangular'
		'API_URL'
		($scope, $state, $stateParams, $http, Restangular, API_URL) ->

			saveDocument = ->
				promise = do $scope.product.put
				promise.then (product) ->
					$state.go 'product.collection'

			loadProductTags = (query) ->
				regexp = new RegExp query, 'i'
				promise = $http.get API_URL + '/products', params: name: do regexp.toString
				return promise

			product = Restangular.one 'products', $stateParams.productId
			promise = do product.get
			promise.then (product) ->
				$scope.product = product
				$scope.$watch 'product.currency', (newval, oldval) ->
					if newval isnt 'YE' then delete $scope.product.yevalue

			$scope.saveDocument = saveDocument
			$scope.loadProductTags = loadProductTags
			$scope.id = $stateParams.productId
	]