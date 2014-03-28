class window.NoteImageLayout extends Marionette.Layout
  className: "note-image"
  template: _.template("<div class='image'></div><div class='notes'></div>")
  regions:
    "imageRegion": ".image"
    "notesRegion": ".notes"

  onShow: ->
    @imageRegion.show new NoteImageView({
      model: @options.model
    })

    q = new Parse.Query(Note)
    q.equalTo("image", @options.model)

    q.find().then (notes) =>
      @notesRegion.show new NoteCommentsView({
        collection: new Parse.Collection(notes)
      })
