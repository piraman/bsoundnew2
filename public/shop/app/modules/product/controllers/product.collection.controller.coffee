define ['../product.module'], (product) ->
	'use strict'
	product.controller 'ProductCollectionController', [
		'$scope'
		'$http'
		'Restangular'
		($scope, $http, Restangular) ->
			products = Restangular.all 'products'
			promise = do products.getList
			promise.then (products) ->
				$scope.products = products
	]