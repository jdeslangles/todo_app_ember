TodoApp.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: -> 
      title = @get("newTitle") # ==> coffeescript syntax
      # this = this.get("newTitle") ==> same in Javascript
      todo = @store.createRecord(TodoApp.Task, {name: title})
      todo.save()
  
  remaining: ( ->
    @filterBy("status", false).get("length")
  ).property("@each.status")

  inflection: ( ->
    remaining = @get("remaining")
    if remaining == 1 then "item" else "items"
  ).property("remaining")