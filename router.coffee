class window.Router extends Backbone.Router
  routes:
    "img/:id": "showImage"

  showImage: (id) ->
    q = new Parse.Query(NoteImageModel)
    q.get(id).then (model) ->
      App.mainRegion.show new NoteImageLayout(
        model: model
      )
