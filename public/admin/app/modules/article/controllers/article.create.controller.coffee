define ['../article.module'], (article) ->
	'use strict'
	article.controller 'ArticleCreateController', [
		'$scope'
		'$state'
		'Restangular'
		($scope, $state, Restangular) ->
			$scope.onFileSelect = ($files) ->
				console.log $files
			articles = Restangular.all 'articles'
			$scope.article =
				name: ''
				label: ''
				overview: ''
				cost: 0
				description:
					title: ''
					content: ''
				related: []
				# features: []
				# files: []
			$scope.loadArticleTags = (query) ->
				regexp = new RegExp query, 'i'
				promise = articles.getList name: do regexp.toString
				return promise
			$scope.saveDocument = ->
				promise = articles.post $scope.article
				promise.then (article) ->
					# $state.go 'article.document', articleId: article._id
					$state.go 'article.collection'
	]