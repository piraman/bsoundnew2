define ['../menu.module'], (menu) ->
	'use strict'
	menu.controller 'MenuController', ($scope) ->
		$scope.items = [
			{state: 'product.collection', text: 'Товары'}
			{state: 'menutree', text: 'Дерево меню'}
			# {state: 'category.collection', text: 'Категории'}
			# {state: 'serie.collection', text: 'Серии'}
			# {state: 'product.collection', text: 'Товары'}
			{state: 'news.collection', text: 'Новости'}
			{state: 'article.collection', text: 'Статьи'}

			# {state: 'messages.collection', text: 'Сообщения'}
			# {state: 'order.collection', text: 'Заказы'}
			# {state: 'user.collection', text: 'Пользователи'}
		]