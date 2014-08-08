define [
	# './modules/article/article.index'
	# './modules/category/category.index'
	# './modules/headbar/headbar.index'
	
	# './modules/news/news.index'
	# './modules/order/order.index'
	# './modules/product/product.index'
	# './modules/serie/serie.index'
	# './modules/user/user.index'
	# 'ngtagsinput'
	# 'textangularsanitize'
	'angular'
	'restangular'
	# 'uibootstraptemplates'
	'uirouter'
	'./modules/menu/menu.index'
	'./modules/product/product.index'
	# './modules/menutree/menutree.index'
], (angular) ->
	'use strict'
	app = angular.module 'app', [
		# 'app.article'
		# 'app.category'
		# 'app.headbar'
		# 'app.menu'
		# 'app.menutree'
		# 'app.news'
		# 'app.order'
		# 'app.serie'
		# 'app.user'
		# 'ngTagsInput'
		'app.menu'
		'app.product'
		'restangular'
		# 'ui.bootstrap'
		'ui.router'
	]
	app.constant 'API_URL', 'http://localhost:12345/api'
	app.config [
		'$compileProvider'
		'$stateProvider'
		'$urlRouterProvider'
		'RestangularProvider'
		($compileProvider, $stateProvider, $urlRouterProvider, RestangularProvider) ->
			# $compileProvider.imgSrcSanitizationWhitelist /^\s*(https?|ftp|file|blob):|data:image\//
			$urlRouterProvider.otherwise '/products'
			# $stateProvider
			# .state 'home',
			# 	templateUrl: './app/modules/product/templates/product.collection.template.html'
			# 	url: '/home'
			RestangularProvider.setBaseUrl 'http://localhost:12345/api'
			RestangularProvider.setRestangularFields id: '_id'
	]
	return app