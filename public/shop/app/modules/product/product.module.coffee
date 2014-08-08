define [
	'angular'
	'restangular'
	'uirouter'
	# 'textangular'
	# 'textangularsanitize'
	# 'ngtagsinput'
], (angular) ->
	'use strict'
	product = angular.module 'app.product', [
		'ui.router'
		'restangular'
		# 'textAngular'
		# 'ngTagsInput'
	]
	product.config [
		'$stateProvider'
		($stateProvider) ->
			$stateProvider
			.state 'product',
				abstract: yes
				template: '<ui-view></ui-view>'
				url: '/products'
			.state 'product.collection',
				templateUrl: './app/modules/product/templates/product.collection.template.html'
				controller: 'ProductCollectionController'
				url: ''
			.state 'product.category',
				templateUrl: './app/modules/product/templates/product.category.template.html'
				controller: 'ProductCategoryController'
				url: '/category/:category'
			.state 'product.document',
				templateUrl: './app/modules/product/templates/product.document.template.html'
				controller: 'ProductDocumentController'
				url: '/:product'
			# .state 'product.collection',
			# 	templateUrl: './app/modules/product/templates/product.collection.template.html'
			# 	controller: 'ProductCollectionController'
			# 	url: ''
			# .state 'product.document',
			# 	templateUrl: './app/modules/product/templates/product.document.template.html'
			# 	controller: 'ProductDocumentController'
			# 	url: '/{productId:[0-9a-z]{24,24}}'
			# .state 'product.create',
			# 	templateUrl: './app/modules/product/templates/product.create.template.html'
			# 	controller: 'ProductCreateController'
			# 	url: '/create'
	]
	return product