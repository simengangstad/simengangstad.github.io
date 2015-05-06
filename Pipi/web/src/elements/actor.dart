part of pipi;

class Actor extends Element {

  String expression;

  //int endX;

  Parser _parser = new Parser();

  Variable _xVariable = new Variable("x");

  ContextModel _contextModel = new ContextModel();

  Expression _expression;

  Number _number = new Number(0.0);

  bool _hasX;

  double _time = 0.0;

  final Grid _grid;

  final double _OriginalSpeed = 1.5;

  double _speed = 1.5;

  bool _fault = false, _crashed = false, _foundGoal = false;

  double _currentX, _currentY;

  List<Point> _points = new List<Point>();

  int colorR = 255, colorG = 255, colorB = 255;

  Actor(Grid grid/*, [int endX = 0]*/) : super.Zero(), _grid = grid/*, this.endX = endX*/ {

    width = 14.0;
    height = 14.0;

    _currentX = super.x;
    _currentY = super.y;
  }

  void setExpression(String expression) {

    try {

      _fault = false;
      _crashed = false;
      _foundGoal = false;

      _hasX = expression.contains("x");

      _expression = _parser.parse(expression);

      _time = 0.0;

      _points = _grid._points;

      _currentX = super.x;
      _currentY = super.y;

      _speed = _OriginalSpeed;
    }
    catch (exception) {

      print(exception);
    }
  }

  @override
  void sendMessage(Element sender, int id, String msg) {

    if (id == ExpressionFault) {

      _fault = true;
    }
    else if (id == SpeedID) {

      if (_speed != _OriginalSpeed * 2.5) {

        _speed *= 2.5;
      }
    }
  }

  @override
  void update() {

    if (!_crashed && !_foundGoal && _expression != null) {

      _time += super.parent.parent.delta;

      /*
        if (_time > endX) {

          _time = 0;
        }
        */

      _currentX += super.parent.parent.delta * _speed / _grid.zoom;
    }
  }

  @override
  void draw(CanvasRenderingContext2D context) {

    context.beginPath();

    context.setFillColorRgb(colorR, colorG, colorB);
    context.setStrokeColorRgb(colorR, colorG, colorB);

    if (_expression != null && !_fault) {

      if (_crashed) {

        context.setFillColorRgb(255, 0, 0);
        context.setStrokeColorRgb(255, 0, 0);
      }

      _number.value = _currentX;

      if (_hasX) _contextModel.bindVariable(_xVariable, _number);

      if (!_foundGoal) _currentY = -_expression.evaluate(EvaluationType.REAL, _contextModel);

      for (int i = 0; i < _points.length - 1; i++) {

        Point point = _points[i];
        Point nextPoint = _points[i + 1];

        if (nextPoint.x > currentX) {

          context.moveTo(point.x * _grid.lineDelta / _grid.zoom + _grid._x, -point.y * _grid.lineDelta / _grid.zoom + _grid._y);
          context.lineTo(_currentX * _grid.lineDelta / _grid.zoom + _grid._x, _currentY * _grid.lineDelta / _grid.zoom + _grid._y);

          break;
        }

        context.moveTo(point.x * _grid.lineDelta / _grid.zoom + _grid._x, -point.y * _grid.lineDelta / _grid.zoom + _grid._y);
        context.lineTo(nextPoint.x * _grid.lineDelta / _grid.zoom + _grid._x, -nextPoint.y * _grid.lineDelta / _grid.zoom + _grid._y);
      }
    }

    context.stroke();
    context.closePath();

    if (!_fault) {

      context.beginPath();
      context.setStrokeColorRgb(colorR, colorG, colorB);

      context.arc(_currentX * _grid.lineDelta / _grid.zoom + _grid._x, _currentY * _grid.lineDelta / _grid.zoom + _grid._y, width, 0.0, 2 * PI);
      context.fill();

      context.closePath();
    }
  }

  void crashed() {

    _crashed = true;
  }

  set x(double _x)  {

    super.x = _x;
    _currentX = _x;
  }

  set y(double _y)  {

    super.y = -_y;
    _currentY = -_y;
  }

  double get currentX => _currentX;
  double get currentY => _currentY;
}