define [
	'angular'
	'restangular'
], (angular) ->
	'use strict'
	article = angular.module 'app.article', [
		'ui.router'
		'restangular'
	]
	article.config [
		'$stateProvider'
		($stateProvider) ->
			$stateProvider
			.state 'article',
				abstract: yes
				template: '<ui-view></ui-view>'
				url: '/articles'
			.state 'article.collection',
				templateUrl: './modules/article/templates/article.collection.template.html'
				controller: 'ArticleCollectionController'
				url: ''
			.state 'article.document',
				templateUrl: './modules/article/templates/article.document.template.html'
				controller: 'ArticleDocumentController'
				url: '/{articleId:[0-9a-z]{24,24}}'
			.state 'article.create',
				templateUrl: './modules/article/templates/article.create.template.html'
				controller: 'ArticleCreateController'
				url: '/create'
	]
	return article