part of pipi;

class Obstacle extends Element {

  final double _gap;

  final bool _vertical, _flip;

  final Grid _grid;

  Obstacle(Grid grid, double x, double y, double gap, bool vertical, [bool flip = false]) : super(x, y, 0.0, 0.0), _gap = gap, _vertical = vertical, _flip = flip, _grid = grid;

  @override
  void update() {

  }

  @override
  void draw(CanvasRenderingContext2D context) {

    context.beginPath();
    context.setStrokeColorRgb(94, 170, 222);
    context.lineWidth = 8;

    if (!_flip) {

      if (_vertical) {

        context.moveTo(x * _grid.lineDelta / _grid.zoom + _grid._x, 0);
        context.lineTo(x * _grid.lineDelta / _grid.zoom + _grid._x, -(y + _gap) * _grid.lineDelta / _grid.zoom + _grid._y);

        context.moveTo(x * _grid.lineDelta / _grid.zoom + _grid._x, -(y) * _grid.lineDelta / _grid.zoom + _grid._y);
        context.lineTo(x * _grid.lineDelta / _grid.zoom + _grid._x, -_grid.y + _grid.height * _grid.lineDelta / _grid.zoom + _grid._y);
      }
      else {

        context.moveTo(0 + _grid._x, -y * _grid.lineDelta / _grid.zoom + _grid._y);
        context.lineTo(x * _grid.lineDelta / _grid.zoom + _grid._x, -y * _grid.lineDelta / _grid.zoom + _grid._y);

        context.moveTo((x + _gap) * _grid.lineDelta / _grid.zoom + _grid._x, -y * _grid.lineDelta / _grid.zoom + _grid._y);
        context.lineTo(_grid.width + _grid._x, -y * _grid.lineDelta / _grid.zoom + _grid._y);
      }
    }
    else {

      if (_vertical) {

        context.moveTo(x * _grid.lineDelta / _grid.zoom + _grid._x, -(y) * _grid.lineDelta / _grid.zoom + _grid._y);
        context.lineTo(x * _grid.lineDelta / _grid.zoom + _grid._x, -(y + _gap) * _grid.lineDelta / _grid.zoom + _grid._y);
      }
      else {

        context.moveTo(x * _grid.lineDelta / _grid.zoom + _grid._x, -y * _grid.lineDelta / _grid.zoom + _grid._y);
        context.lineTo((x + _gap) * _grid.lineDelta / _grid.zoom + _grid._x, -y * _grid.lineDelta / _grid.zoom + _grid._y);
      }
    }

    context.stroke();
    context.closePath();
  }

  bool collides(Actor actor) {

    if (!_flip) {

      if (_vertical) {

        if (!(-actor.currentY * _grid.lineDelta / _grid.zoom + actor.height / 2.0 >= (y + _gap) * _grid.lineDelta / _grid.zoom ||
              -actor.currentY * _grid.lineDelta / _grid.zoom - actor.height / 2.0 <= (y) * _grid.lineDelta / _grid.zoom)) {

          return false;
        }

        if ((actor.currentX * _grid.lineDelta / _grid.zoom - x * _grid.lineDelta / _grid.zoom).abs() < actor.width / 2.0) {

          return true;
        }
        else {

          return false;
        }
      }
      else {

        if (!(actor.currentX * _grid.lineDelta / _grid.zoom - actor.width / 2.0 <= x * _grid.lineDelta / _grid.zoom ||
              actor.currentX * _grid.lineDelta / _grid.zoom + actor.width / 2.0 >= (x + _gap) * _grid.lineDelta / _grid.zoom)) {

          return false;
        }

        if ((actor.currentY * _grid.lineDelta / _grid.zoom - -y * _grid.lineDelta / _grid.zoom).abs() < actor.height / 2.0) {

          return true;
        }
        else {

          return false;
        }
      }
    }
    else {

      if (_vertical) {

        if (-actor.currentY * _grid.lineDelta / _grid.zoom - actor.height / 2.0 > (y + _gap) * _grid.lineDelta / _grid.zoom ||
            -actor.currentY * _grid.lineDelta / _grid.zoom + actor.height / 2.0 < (y) * _grid.lineDelta / _grid.zoom) {

          return false;
        }

        if ((actor.currentX * _grid.lineDelta / _grid.zoom - x * _grid.lineDelta / _grid.zoom).abs() < actor.width / 2.0) {

          return true;
        }
        else {

          return false;
        }
      }
      else {

        if (actor.currentX * _grid.lineDelta / _grid.zoom + actor.width / 2.0 < x * _grid.lineDelta / _grid.zoom ||
            actor.currentX * _grid.lineDelta / _grid.zoom - actor.width / 2.0 > (x + _gap) * _grid.lineDelta / _grid.zoom) {

          return false;
        }

        if ((actor.currentY * _grid.lineDelta / _grid.zoom - -y * _grid.lineDelta / _grid.zoom).abs() < actor.height / 2.0) {

          return true;
        }
        else {

          return false;
        }
      }
    }
  }
}