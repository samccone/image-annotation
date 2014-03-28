class window.NoteCommentsView extends Marionette.CollectionView
  tagName: "ul"
  itemView: NoteComment

  onShow: ->
    @listenTo App.vent, "newComment", (comment) =>
      @collection.add(comment)
