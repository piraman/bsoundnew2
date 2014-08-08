define [
	'./../product.module'
], (product) ->
	'use strict'
	product.directive 'pictureUploader', ->
		templateUrl: './app/modules/product/directives/product.picture.uploader.directive.template.html'
		restrict: 'E'
		replace: yes
		require: 'ngModel'
		scope:
			multiple: '@pictureUploaderMultiple'
			model: '=ngModel'
			endpoint: '@pictureUploaderEndpoint'
		controller: ($scope, $http, API_URL, $stateParams) ->
			if do $scope.multiple.bool
				$scope.selectedPictures = []
				$scope.fileChange = (e) ->
					for file, i in e.files
						url = URL.createObjectURL file
						$scope.selectedPictures.push
							name: file.name
							url: url
							file: file
					do $scope.$apply
				$scope.cancelPicture = (index) ->
					$scope.selectedPictures.splice index, 1
				$scope.uploadPicture = (index) ->
					file = $scope.selectedPictures[index].file
					form = new FormData()
					form.append 'other', file
					req = new XMLHttpRequest()
					req.onreadystatechange = (e) ->
						if @readyState is 4 and @status is 200
							model = JSON.parse e.target.response
							$scope.model = model
							$scope.selectedPictures.splice index, 1
							do $scope.$apply
					req.open 'POST', API_URL + $scope.endpoint
					req.send form
				$scope.deletePicture = (index) ->
					promise = $http.delete API_URL + $scope.endpoint + '/' + $scope.model[index].name, params: type: 'other'
					promise.success (model) ->
						$scope.model = model
						$scope.selectedPictures.splice index, 1
			else
				$scope.selectedPicture = null
				$scope.fileChange = (e) ->
					file = e.files[0]
					url = URL.createObjectURL file
					$scope.selectedPicture =
						name: file.name
						url: url
						file: file
					do $scope.$apply
					# $scope.$apply ->
					# 	$scope.selectedPicture =
					# 		name: file.name
					# 		url: url
					# 		file: file
				$scope.cancelPicture = (index) ->
					$scope.selectedPicture = null
				$scope.uploadPicture = (index) ->
					file = $scope.selectedPicture.file
					form = new FormData()
					form.append 'main', file
					req = new XMLHttpRequest()
					req.onreadystatechange = (e) ->
						if @readyState is 4 and @status is 200
							model = JSON.parse e.target.response
							$scope.model = model
							$scope.selectedPicture = null
							do $scope.$apply
					req.open 'POST', API_URL + $scope.endpoint
					req.send form
				$scope.deletePicture = (index) ->
					promise = $http.delete API_URL + $scope.endpoint + '/' + $scope.model.name, params: type: 'main'
					promise.success (model) ->
						$scope.model = null
						$scope.selectedPicture = null