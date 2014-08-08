define ['../product.module'], (product) ->
	'use strict'
	product.controller 'ProductCategoryController', [
		'$scope'
		'$http'
		'Restangular'
		($scope, $http, Restangular) ->
			# products = Restangular.all 'products'
			# promise = do products.getList
			# promise.then (products) ->
			# 	$scope.products = products
	]