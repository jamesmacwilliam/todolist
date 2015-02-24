angular.module('todo.main').directive('todoForm', [->
  restrict: 'E'
  templateUrl: 'todo_form'
  scope:
    model: '='
    show: '&'
    submit: '='
  link: ($scope, $element, $attrs) ->
    $scope.title = ->
      if $scope.model.id
        'Edit'
      else
        'Create'
])
