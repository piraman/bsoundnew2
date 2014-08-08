define ['../article.module'], (article) ->
	'use strict'
	article.controller 'ArticleCollectionController', [
		'$scope'
		'$state'
		'Restangular'
		($scope, $state, Restangular) ->
			articles = Restangular.all 'articles'
			promise = do articles.getList
			promise.then (articles) ->
				$scope.articles = articles

			$scope.fields = [
				{db: '_id',	ru: 'id'}
				{db: 'name', ru: 'name'}
				{db: 'label', ru: 'label'}
				# {db: 'overview', ru: 'overview'}
				{db: 'cost', ru: 'cost'}
				# {db: 'description', ru: 'description'}
				# {db: 'related', ru: 'related'}
				# {db: 'features', ru: 'features'}
				# {db: 'files', ru: 'files'}
			]

			$scope.openDocument = (index) ->
				$state.go 'article.document', articleId: $scope.articles[index]._id
	]


	# name: type: String, required: yes
	# label: String
	# overview: String
	# cost: type: Number, required: yes
	# description: title: String, content: String
	# related: [mongoose.Schema.Types.ObjectId]
	# features: [feature: String, value: String]
	# files: [text: String, link: String]


# define ['../order.module'], (order) ->
# 	'use strict'
# 	order.controller 'OrderCollectionController', ($scope, Restangular) ->
# 		$scope.limit = 100
# 		$scope.offset = 1
# 		$scope.orders = []
# 		orders = Restangular.all 'orders'
# 		promise = orders.getList offset: $scope.offset, limit: $scope.limit
# 		promise.then (orders) ->
# 			console.log orders
# 			$scope.orders = orders
# 		$scope.refresh = ->
# 			promise = orders.getList offset: $scope.offset, limit: $scope.limit
# 			promise.then (orders) ->
# 				$scope.orders = orders
# 				$scope.$broadcast 'ordersRefreshed'
# 		$scope.showQuickview = ($index) ->
# 			$scope.$broadcast 'showQuickview', $index
# 		$scope.$on 'orderUpdated', (event, data) ->
# 			do $scope.refresh
# 		$scope.create = ->