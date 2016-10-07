part of pipi;

class Label extends Element {

  String _text;

  List<String> _splittedText = new List<String>();

  String font;

  bool transparent = false;

  double xOffset = 5.0, yOffset = 5.0, ySpacing = 0.0;

  bool drawBorder = false;

  bool stickToBackground = false;

  bool centerText = true;

  double externalX = 0.0, externalY = 0.0;

  int borderR = 0, borderG = 0, borderB = 0;
  int fillR = 255, fillG = 255, fillB = 255;
  int textR = 0, textG = 0, textB = 0;

  Label(String text, double x, double y, double width, double height, [String font = "20px Arial"]) : super(x, y, width, height), font = font {

    this.text = text;
  }

  @override
  void update() {

  }

  @override
  void draw(CanvasRenderingContext2D context) {

    if (stickToBackground) {

      context.translate(externalX, externalY);
      context.translate(0.0, -context.canvas.height);
    }

    context.beginPath();

    if (!transparent) {

      context.setFillColorRgb(fillR, fillG, fillB);
      context.fillRect(x, y, width, height);
    }

    context.setFillColorRgb(textR, textG, textB);
    context.font = font;

    int s = 0;

    int textHeight = 12;
    int yDelta = (height - yOffset * 2.0) / _splittedText.length > textHeight ? textHeight : (height - yOffset * 2.0) ~/ _splittedText.length;

    for (int i = _splittedText.length - 1; i >= 0; i--) {

      context.fillText(_splittedText[i], x + xOffset, y - s * yDelta - s * ySpacing + (_splittedText.length * yDelta + _splittedText.length * ySpacing) + yOffset, width - 20.0 + xOffset);

      s++;
    }

    context.stroke();

    if (drawBorder) {

      context.setStrokeColorRgb(borderR, borderG, borderB);
      context.lineWidth = 2;

      context.moveTo(x, y);
      context.lineTo(x + width, y);

      context.moveTo(x + width, y);
      context.lineTo(x + width, y + height);

      context.moveTo(x + width, y + height);
      context.lineTo(x, y + height);


      context.moveTo(x, y + height);
      context.lineTo(x, y);

      context.stroke();
    }

    context.closePath();

    if (stickToBackground) {

      context.translate(-externalX, -externalY);
      context.translate(0.0, context.canvas.height);
    }
  }

  set text(String text) {

    _text = text;

    _splittedText = text.split("\n");
  }
}