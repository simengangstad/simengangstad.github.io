part of pipi;

class Goal extends Element {

  final Grid _grid;

  int colorR = 255, colorG = 255, colorB = 255;

  Goal(Grid grid, double x, double y, double radius) : super(x, y, radius, radius), _grid = grid;

  @override
  void update() {

  }

  @override
  void draw(CanvasRenderingContext2D context) {

    context.beginPath();

    context.setStrokeColorRgb(colorR, colorG, colorB);
    context.arc(x * _grid.lineDelta / _grid.zoom + _grid._x, -y * _grid.lineDelta / _grid.zoom + _grid._y, width, 0.0, 2 * PI);

    context.stroke();
    context.closePath();
  }

  bool actorIsInside(Actor actor) {

    return sqrt(((actor.currentX - actor.width / 2.0 / _grid.lineDelta * _grid.zoom) - x) * ((actor.currentX - actor.width / 2.0 / _grid.lineDelta * _grid.zoom) - x) + (actor.currentY - -y) * (actor.currentY - -y)) > 0 &&
           sqrt(((actor.currentX - actor.width / 2.0 / _grid.lineDelta * _grid.zoom) - x) * ((actor.currentX - actor.width / 2.0 / _grid.lineDelta * _grid.zoom) - x) + (actor.currentY - -y) * (actor.currentY - -y)) < width / (_grid.lineDelta * _grid.zoom);
  }
}