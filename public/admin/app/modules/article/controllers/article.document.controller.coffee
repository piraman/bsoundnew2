define ['../article.module'], (article) ->
	'use strict'
	article.controller 'ArticleDocumentController', [
		'$scope'
		'$state'
		'$stateParams'
		'Restangular'
		($scope, $state, $stateParams, Restangular) ->
			articles = Restangular.all 'articles'
			article = Restangular.one 'articles', $stateParams.articleId
			promise = do article.get
			promise.then (article) ->
				$scope.article = article
			$scope.loadArticleTags = (query) ->
				regexp = new RegExp query, 'i'
				promise = articles.getList name: do regexp.toString
				return promise
			$scope.saveDocument = ->
				promise = do $scope.article.put
				promise.then ->
					$state.go 'article.collection'
	]


# name
# label
# overview
# cost
# description
# related
# features
# files