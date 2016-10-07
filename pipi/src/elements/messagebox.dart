part of pipi;

class MessageBox extends Element {

  Label label;
  Button leftButton;
  Button rightButton;

  final double _buttonHeight = 50.0, _buttonGap = 4.0;

  /**
   * Coordinates are global (by pixel).
   */
  MessageBox(double x, double y, double width, double height) : super(x, y, width, height) {

    label = new Label("", x, y, width, height - _buttonHeight);

    leftButton = new Button(x, y + (height - _buttonHeight), (width - _buttonGap) / 2.0, _buttonHeight);
    rightButton = new Button(x + width / 2.0 + _buttonGap - 2.0, y + (height - _buttonHeight), (width - _buttonGap) / 2.0, _buttonHeight);
  }

  @override
  void update() {

  }

  @override
  void draw(CanvasRenderingContext2D context) {

  }
}