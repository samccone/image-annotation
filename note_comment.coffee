class window.NoteComment extends Marionette.ItemView
  tagName: "li"
  className: "note-comment"
  template: _.template("<div class='content'><%-comment%></div><div class='remove'>REMOVE</div>")

  events:
    "click .content": "warn"
    "click .remove": "removeComment"

  warn: ->
    alert "no no no"
    false

  removeComment: ->
    @model.destroy()

  onShow: ->
    @$el.css
      "left": @model.get("x")
      "top": @model.get("y")
