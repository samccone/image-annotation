function start() {
  window.App = new Marionette.Application;

  App.on("initialize:after", function() {
    this.router = new Router;
    Backbone.history.start()
  })

  App.start();

  App.addRegions({
    mainRegion: ".app"
  });

  App.mainRegion.show(new EnterUrl);
}
