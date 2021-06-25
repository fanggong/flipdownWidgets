HTMLWidgets.widget({
  name: 'flipdownWidgets',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(parameters) {

        el.innerHTML = "";
        el.baseUnit = parameters.base_unit;

        new FlipDown(parameters.to, el.id, {
          theme: parameters.theme,
          headings: parameters.headings
        })
        .start()
        .ifEnded(() => {
          console.log("The counter has ended!")
        });

        if (el.baseUnit == null) {
          this.resize(width, height);
        } else {
          el.style.setProperty("--base-unit", el.baseUnit);
        };

      },
      resize: function(width, height) {

        if (el.baseUnit == null) {
          var dayDigit = el.firstChild.childElementCount;
          var append = 55 * (dayDigit - 3);
          el.style.setProperty("--base-unit", width / (510 + append));
        }

      }
    };
  }
});
