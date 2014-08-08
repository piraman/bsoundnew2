define ['../product.module'], (product) ->
	'use strict'
	product.controller 'ProductCollectionController', [
		'$scope'
		'$state'
		'Restangular'
		($scope, $state, Restangular) ->
			$scope.fields = [
				{db: 'name', ru: 'Наименование'}
				{db: 'info', ru: 'Краткое описание'}
				{db: 'cost', ru: 'Стоимость'}
			]
			products = Restangular.all 'products'
			promise = do products.getList
			promise.then (products) ->
				$scope.products = products
			$scope.openDocument = (index) ->
				$state.go 'product.document', productId: $scope.products[index]._id
	]
