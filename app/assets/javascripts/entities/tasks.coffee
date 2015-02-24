angular.module('todo.entities').factory('Tasks', [
  '$resource'
  ($resource) ->
    $resource "/projects/:projectId/tasks/:id", {}, {
      update:
        method: 'PUT'
    }
  ]
)
