part of pipi;

class Star extends Element {

  double _radiusInnerCircle, _radiusOuterCircle;

  int _spikes;

  double rotation;

  int borderColorR = 255, borderColorG = 255, borderColorB = 255;
  int fillColorR = 255,   fillColorG = 255,   fillColorB = 255;

  Star(double x, double y, double radiusInner, double radiusOuter, int spikes) : super(x, y, radiusOuter * 2, radiusOuter * 2), _radiusInnerCircle = radiusInner, _radiusOuterCircle = radiusOuter, _spikes = spikes;

  @override
  void update() {

  }

  @override
  void draw(CanvasRenderingContext2D context) {

    context.beginPath();
    context.setStrokeColorRgb(borderColorR, borderColorG, borderColorB);
    context.setFillColorRgb(fillColorR, fillColorG, fillColorB);
    context.lineWidth = 8;

    _drawStar(context, x, y, _radiusOuterCircle, _radiusInnerCircle, _spikes);

    context.stroke();
    context.fill();
    context.closePath();
  }

  void _drawStar(CanvasRenderingContext2D context, double x, double y, double radiusInnerCircle, double radiusOuterCircle, int spikes) {

    double circumference = 2 * PI;
    double delta = circumference / spikes;

    context.moveTo(x + radiusOuterCircle * cos(rotation / 180 * PI), y + radiusOuterCircle * sin(rotation / 180 * PI));

    for (double outer = rotation / 180 * PI; outer < circumference + rotation / 180 * PI; outer += delta) {

        context.lineTo(x + radiusInnerCircle * cos(outer + delta / 2.0), y + radiusInnerCircle * sin(outer + delta / 2.0));
        context.lineTo(x + radiusOuterCircle * cos(outer + delta), y + radiusOuterCircle * sin(outer + delta));
    }
  }
}