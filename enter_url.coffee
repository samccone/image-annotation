class window.EnterUrl extends Marionette.ItemView
  template: _.template("<input placeholder='enter url' value='http://cow.jpg.to/'></input>")

  ui:
    urlInput: "input"

  events:
    "keydown": "urlEntered"

  urlEntered: (e) ->
    if (e.keyCode is 13)
      @findOrCreateImage(@ui.urlInput.val())
      @close()

  findOrCreateImage: (src, cb) ->
    q = new Parse.Query(NoteImageModel)
    q.equalTo("src", src)

    q.find().then (d) =>
      if d.length
        App.router.navigate("/img/#{d[0].id}")
        App.mainRegion.show new NoteImageLayout(
          model: d[0]
        )
        return
      else
        (new NoteImageModel(src: src)).save()
          .then (d) ->
            App.router.navigate("/img/#{d.id}")
            App.mainRegion.show new NoteImageLayout(
              model: d
            )
