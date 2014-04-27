class AppTodo.Models.Task extends Backbone.Model
  paramRoot: 'task'

  defaults:
    name: null
    due_date: null

class AppTodo.Collections.TasksCollection extends Backbone.Collection
  model: AppTodo.Models.Task
  url: '/tasks'
