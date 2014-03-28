class window.NoteImageView extends Marionette.ItemView
  tagName: "img"
  template: _.template("")
  events: ->
    "click": "storeClick"

  onShow: ->
    @$el.attr 'src', @model.get("src")

  storeClick: (e) ->
    offset    = @$el.offset()
    relativeX = (e.pageX - offset.left)
    relativeY = (e.pageY - offset.top)

    comment = new Note
      image: @model
      x: relativeX
      y: relativeY
      comment: prompt("note?")

    comment.save().then ->
      App.vent.trigger 'newComment', comment
