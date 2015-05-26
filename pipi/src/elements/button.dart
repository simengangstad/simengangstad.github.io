part of pipi;

class Button extends Element {

  /**
   * The states of the button.
   */
  bool _hovered = false, _clicked = false;

  int defaultR = 0,   defaultG = 0,   defaultB = 0;
  int hoveredR = 64,  hoveredG = 64,  hoveredB = 64;
  int clickedR = 128, clickedG = 128, clickedB = 128;

  int textR = 255, textG = 255, textB = 255;

  int offset = 15;

  String text = "";

  Function onMouseDownAction;

  Button(double x, double y, double width, double height, [Function onMouseDownAction]) : super(x, y, width, height), this.onMouseDownAction = onMouseDownAction;

  @override
  void onMouseDown(MouseEvent mouseEvent) {

    _clicked = true;

    onMouseDownAction();
  }

  @override
  void onMouseUp(MouseEvent mouseEvent) {

    _clicked = false;
  }

  @override
  void onMouseEnter(MouseEvent mouseEvent) {

    _hovered = true;
  }

  @override
  void onMouseLeave(MouseEvent mouseEvent) {

    _hovered = false;
    _clicked = false;
  }

  @override
  void update() {

  }

  @override
  void draw(CanvasRenderingContext2D context) {

    int r, g, b;

    if (_hovered) {

      r = hoveredR;
      g = hoveredG;
      b = hoveredB;
    }
    else {

      r = defaultR;
      g = defaultG;
      b = defaultB;
    }

    if (_clicked) {

      r = clickedR;
      g = clickedG;
      b = clickedB;
    }

    context.setFillColorRgb(r, g, b);
    context.fillRect(x, y, width, height);

    context.setFillColorRgb(textR, textG, textB);
    context.font = "${height - offset * 2}px Arial";

    context.beginPath();
    context.fillText(text, x + offset / 2.0, y + (height - offset));
    context.closePath();
  }
}