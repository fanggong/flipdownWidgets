HTMLWidgets.widget({

  name: 'flipdownWidgets',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(parameters) {

        const fp = new FlipDown(parameters.n, el.id).start();
      },

      resize: function(width, height) {


      }

    };
  }
});
