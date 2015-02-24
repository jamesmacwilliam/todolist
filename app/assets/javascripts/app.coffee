# Module Definitions
#
angular.module 'todo.entities', [
  'ngResource'
  'ng-rails-csrf'
]

angular.module('todo.main', [
  'mm.foundation'
  'todo.entities'
])
