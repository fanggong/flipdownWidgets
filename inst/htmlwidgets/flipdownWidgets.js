HTMLWidgets.widget({
  name: 'flipdownWidgets',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(parameters) {

        el.innerHTML = "";

        new FlipDown(parameters.to, el.id, {
          theme: parameters.theme,
          headings: parameters.headings
        })
        .start()
        .ifEnded(() => {
          console.log("The counter has ended!")
        });

        this.resize(width, height);

      },
      resize: function(width, height) {

        var width = parseInt(el.offsetWidth);
        var dayDigit = el.firstChild.childElementCount;
        var append = 55 * (dayDigit - 3);
        var baseUnit = width / (510 + append) - 0.01;
        el.style.setProperty("--base-unit", baseUnit);
        el.style.setProperty("height", baseUnit * 120 + "px");

      }
    };
  }
});
