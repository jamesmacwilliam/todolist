angular.module('todo.entities').factory('Projects', [
  '$resource'
  ($resource) ->
    $resource "projects/:id", {}, {
      update:
        method: 'PUT'
    }
  ]
)
