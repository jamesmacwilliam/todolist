angular.module('todo.main').controller('manageController', [
  '$location'
  'Projects'
  'Tasks'
  ($location, Projects, Tasks) ->

    self = this

    #======================
    # Projects
    #======================

    # Get
    self.getProjects = ->
      Projects.query().$promise.then (res) ->
        self.projects = res
        self.project = {}
        delete self.new_project

    # Create/Update
    self.saveProject = (project) ->
      projects = if project.id
        Projects.update({ id: project.id }, project)
      else
        Projects.save({}, project)
      projects.$promise.then self.getProjects

    # Manage Project forms
    #
    self.hideProjectForm = ->
      self.hide_project = true

    self.showProjectForm = (project) ->
      self.project = project
      delete self.hide_project
      self.showTasks(project)

    self.projectFormVisible = (project) ->
      self.project.id == project.id && !self.hide_project

    self.projectClass = (project) ->
      'active' if self.project.id == project.id

    # initialze projects
    self.getProjects()

    #======================
    # Tasks
    #======================

    self.showTaskForm = (task) ->
      self.task = task
      self.hideProjectForm()

    # Get
    self.showTasks = (project) ->
      delete self.new_project
      Tasks.query(projectId: project.id).$promise.then (res) ->
        self.tasks = res

      self.task = {}
      delete self.new_task
      self.project = project

    # Create/Update
    self.saveTask = (task) ->
      task = if task.id
        Tasks.update({ projectId: self.project.id, id: task.id }, task)
      else
        Tasks.save({ projectId: self.project.id }, task)
      task.$promise.then -> self.showTasks(self.project)

    # mark task completed
    self.completeTask = (task) ->
      task.completed = true
      self.hideProjectForm()
      self.saveTask(task)
])
