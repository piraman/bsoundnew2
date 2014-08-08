define ['../menutree.module'], (menutree) ->
	'use strict'
	menutree.controller 'MenutreeController', [
		'$http'
		'$scope'
		'$state'
		'$stateParams'
		'API_URL'
		'Restangular'
		($http, $scope, $state, $stateParams, API_URL, Restangular) ->
			products = Restangular.all 'products'
			$scope.loadProductTags = (query) ->
				regexp = new RegExp query, 'i'
				promise = $http.get API_URL + '/products', params: name: do regexp.toString
				return promise
			settings = Restangular.all 'settings'
			promise = do settings.getList
			promise.then (settings) ->
				$scope.settings = settings
				$scope.list = $scope.settings[0].menutree

			$scope.productAddingFormVisible = no

			$scope.addNewItem = ->
				text = $scope.newItem
				$scope.list.push
					id: do guid
					title: text
					items: []

			$scope.currentCategory = null
			$scope.selectedCategory = null

			$scope.selectedItem = {}

			$scope.options = {}

			$scope.remove = (scope) ->
				do scope.remove

			$scope.showForm = (scope) ->
				$scope.productAddingFormVisible = yes
				$scope.currentCategory = scope.item

			$scope.editTitle = (scope) ->
				$scope.selectedCategory = scope.item

			$scope.toggle = (scope) ->
				do scope.toggle

			$scope.newSubItem = (scope) ->
				nodeData = scope.$modelValue
				nodeData.items.push
					id: do guid
					title: '...'
					items: []

			$scope.saveSettings = ->
				promise = $http.put API_URL + '/settings', $scope.settings[0]
				promise.success ->
					$state.transitionTo $state.current, $stateParams,
						reload: true
						inherit: false
						notify: true



					# do $state.reload
					# console.log $state
					# $state.go 'menutree'
				# promise.then (settings) ->
				# 	console.log settings
				# 	$scope.settings = [settings]
				# 	$scope.list = $scope.settings[0].menutree

			# $scope.saveDocument = ->
			# 	promise = do $scope.product.put
			# 	promise.then ->
			# 		$state.go 'product.collection'


	]


			# $scope.list = [
			# 	{
			# 		"id": 1,
			# 		"title": "1. dragon-breath",
			# 		"items": []
			# 	},
			# 	{
			# 		"id": 2,
			# 		"title": "2. moiré-vision",
			# 		"items": [
			# 			{
			# 				"id": 21,
			# 				"title": "2.1. tofu-animation",
			# 				"items": [
			# 					{
			# 						"id": 211,
			# 						"title": "2.1.1. spooky-giraffe",
			# 						"items": []
			# 					},
			# 					{
			# 						"id": 212,
			# 						"title": "2.1.2. bubble-burst",
			# 						"items": []
			# 					}
			# 				]
			# 			},
			# 			{
			# 				"id": 22,
			# 				"title": "2.2. barehand-atomsplitting",
			# 				"items": []
			# 			}
			# 		]
			# 	},
			# 	{
			# 		"id": 3,
			# 		"title": "3. unicorn-zapper",
			# 		"items": []
			# 	},
			# 	{
			# 		"id": 4,
			# 		"title": "4. romantic-transclusion",
			# 		"items": []
			# 	}
			# ]