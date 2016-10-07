part of pipi;

class Grid extends Element {

  double _x = 0.0, _y = 0.0;

  double zoom = 1.0;

  final int _OriginalLineDelta = 75;

  int lineDelta = 75;

  final int _delta = 10, _size = 20;

  final int amountOfPointsPerX = 10;

  Parser _parser = new Parser();

  Variable _xVariable = new Variable("x");

  ContextModel _contextModel = new ContextModel();

  Expression _expression;

  List<Point> _points = new List<Point>();

  bool _hasX = false;

  double _lastValue = 0.0;

  bool allowMovement = true, allowZoom = false;

  bool hideXAxis = false, hideYAxis = false;

  int _lastMouseX, _lastMouseY;

  Grid(double x, double y, double width, double height) : super(x, y, width, height) {

    setPosition(0.0, 0.0);
  }

  @override
  void sendMessage(Element sender, int id, String msg) {

    if (id == TextFieldID) {

      try {

        _hasX = msg.contains("x");

        _expression = _parser.parse(msg);

        _lastValue = null;

        _loadExpression();
      }
      catch(exception) {

        reset();

        print("fault $id for msg: $msg");

        super.parent.parent.broadCastMessage(this, ExpressionFault, msg);
      }
    }
  }

  void _loadExpression() {

    if (_expression == null) {

      return;
    }

    if (_lastValue == ((_x) % lineDelta - lineDelta - _x + _delta) * zoom) {

      return;
    }

    reset();

    _lastValue = ((_x) % lineDelta - lineDelta - _x + _delta) * zoom;

    for (int xs = (_x).toInt() % lineDelta - lineDelta; xs < width + lineDelta * 2; xs += lineDelta) {

      for (int xss = 0; xss < amountOfPointsPerX; xss++) {

        double xValue = (((xs - _x + _delta) / lineDelta).round() + xss / amountOfPointsPerX) * zoom;

        if (_hasX) _contextModel.bindVariable(_xVariable, new Number(xValue));

        double yValue = _expression.evaluate(EvaluationType.REAL, _contextModel);

        _points.add(new Point(xValue, yValue));
      }
    }
  }

  @override
  void onMouseMove(MouseEvent mouseEvent) {

    if (!allowMovement) {

      return;
    }

    if (parent.buttons[0]) {

      // mouseEvent.movement is only supported on safari and chrome, but doesn't work on safari for some reason.
      // Therefore we do this:

      if (_lastMouseX == null && _lastMouseY == null) {

        _lastMouseX = mouseEvent.client.x;
        _lastMouseY = mouseEvent.client.y;
      }

      _x += mouseEvent.client.x - _lastMouseX;
      _y += mouseEvent.client.y - _lastMouseY;
    }

    _lastMouseX = mouseEvent.client.x;
    _lastMouseY = mouseEvent.client.y;

    _loadExpression();
  }

  @override
  void onMouseWheel(WheelEvent wheelEvent) {

    if (!allowZoom) {

      return;
    }

    lineDelta += wheelEvent.wheelDeltaY / 100.0;

    _loadExpression();

    wheelEvent.preventDefault();
  }

  @override
  void update() {

  }

  @override
  void draw(CanvasRenderingContext2D context) {

    context.translate(_x + x, _y + y);

    drawGrid(context);

    context.setTransform(1, 0, 0, 1, 0, 0);
  }

  void drawGrid(CanvasRenderingContext2D context) {

    // Draw the grid and take care of zoom

    context.lineWidth = 2;
    context.setStrokeColorRgb(255, 255, 255);

    context.beginPath();

    if (lineDelta > _OriginalLineDelta * 2) {

      zoom /= 2.0;

      lineDelta = _OriginalLineDelta;
    }

    if (lineDelta < _OriginalLineDelta / 2) {

      zoom *= 2.0;

      lineDelta = _OriginalLineDelta;
    }

    // TODO: Need to determine point of zoom.

    for (double xs = (_x) % lineDelta; xs < width; xs += lineDelta) {

      context.moveTo((xs - _x), (-_y));
      context.lineTo((xs - _x), (-_y + height));
    }

    for (double ys = (_y) % lineDelta; ys < height; ys += lineDelta) {

      context.moveTo((-_x),         (ys - _y));
      context.lineTo((-_x + width), (ys - _y));
    }

    context.closePath();
    context.stroke();


    // Place the origin x- and y-axis lines.

    context.lineWidth = 4;
    context.setStrokeColorRgb(255, 255, 255);

    context.beginPath();

    context.font = "bold 15px Arial";
    context.setFillColorRgb(255, 255, 255);

    if (!hideYAxis) {

      // The y-axis
      context.moveTo(0, -_y);
      context.lineTo(0, -_y + height);

      for (int ys = (_y).toInt() % lineDelta - lineDelta; ys < height; ys += lineDelta) {

        int yValue = (ys - _y + lineDelta - _size - _delta).toInt();

        double textValue = (-yValue / lineDelta).round() * zoom;

        context.fillText("${textValue.toStringAsFixed(0)}", _delta, (yValue + _size));
      }
    }

    if (!hideXAxis) {

      // The x-axis
      context.moveTo(0 - _x, 0);
      context.lineTo(0 - _x + width, 0);

      for (int xs = (_x).toInt() % lineDelta - lineDelta; xs < width; xs += lineDelta) {

        double xValue = (xs - _x + _delta);

        double textValue = (xValue / lineDelta).round() * zoom;

        context.fillText("${textValue.toStringAsFixed(0)}", xValue, 0 - _delta);
      }
    }

    context.closePath();
    context.stroke();

    /*
    context.beginPath();

    context.lineWidth = 4;


    for (int i = 0; i < _points.length - 1; i++) {

      Point point = _points[i];
      Point nextPoint = _points[i + 1];

      context.moveTo(point.x * _lineDelta / _zoom, -point.y * _lineDelta / _zoom);
      context.lineTo(nextPoint.x * _lineDelta / _zoom, -nextPoint.y * _lineDelta / _zoom);
    }

    context.closePath();
    context.stroke();

    */
  }

  void reset() {

    _points.clear();
  }

  void setPosition(double x, double y) {

    _x = width / 2.0 + -x * lineDelta;
    _y = (height / 2.0) + y * lineDelta;
  }

  void setPositionLowerLeft(double x, double y) {

    _x = -x * lineDelta;
    _y = height + y * lineDelta;
  }
}