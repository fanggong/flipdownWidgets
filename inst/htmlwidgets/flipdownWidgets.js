HTMLWidgets.widget({
  name: 'flipdownWidgets',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(parameters) {
        new FlipDown(parameters.to, el.id, {
          theme: parameters.theme,
          headings: parameters.headings
        })
        .start()
        .ifEnded(() => {
          console.log("The countter has ended!")
        })
      },
      resize: function(width, height) {

      }
    };
  }
});
