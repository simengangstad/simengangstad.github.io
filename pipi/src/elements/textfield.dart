part of pipi;

class TextField extends Element {

  String _text = "";
  String _lastText = "";

  String _textOutput = "";

  final int _offset = 15, _space = 100;

  int _index = 0;

  double _lastTime = 0.0;

  bool _showingMarker = true;

  bool fault = false;

  bool showY = true;

  int textColorR = 255, textColorG = 255, textColorB = 255;

  TextField(double x, double y, double width, double height) : super(x, y, width, height);

  @override
  void sendMessage(Element sender, int id, String msg) {

    if (id == ButtonID) {

      _enter();
    }
    else if (id == ExpressionFault) {

      fault = true;
    }
  }

  @override
  void onKeyDown(KeyboardEvent keyboardEvent) {

    if (keyboardEvent.keyCode == KeyCode.BACKSPACE) {

      _setIndex(_index - 1);

      if (_text.length == 0) {

        return;
      }

      if (_index == _text.length - 1) {

        _text = _text.substring(0, _text.length - 1);

        fault = false;
      }
      else if (0 <= _index && _index < _text.length) {

        _text = _text.substring(0, _index) + _text.substring(_index + 1, _text.length);

        fault = false;
      }
    }
    else if (keyboardEvent.keyCode == KeyCode.ENTER) {

      return;
    }
    else if (keyboardEvent.keyCode == 221 && parent.keys[KeyCode.SHIFT]) {

      _inserCharacter("^");

      _setIndex(_index + 1);
    }
    else if (keyboardEvent.keyCode == KeyCode.LEFT) {

      _setIndex(_index - 1);
    }
    else if (keyboardEvent.keyCode == KeyCode.RIGHT) {

      _setIndex(_index + 1);
    }
  }

  @override
  void onKeyPress(KeyboardEvent keyboardEvent) {

    if (keyboardEvent.keyCode == KeyCode.ENTER) {

      _enter();

      return;
    }

    _inserCharacter(UTF8.decode([keyboardEvent.charCode]));

    _setIndex(_index + 1);
  }

  @override
  void update() {

    if (super.parent.parent.time - _lastTime > 0.8) {

      _showingMarker = !_showingMarker;

      _lastTime = super.parent.parent.time;
    }
  }

  @override
  void draw(CanvasRenderingContext2D context) {

    context.setFillColorRgb(textColorR, textColorG, textColorB);
    context.font = "${height - _offset * 2}px Arial";

    _textOutput = _text.substring(0, _index) + (_showingMarker ? "|" : "") + _text.substring(_index, _text.length);

    context.beginPath();

    if (showY) context.fillText("y =", _offset, height - _offset * 1.5, width - _offset * 2 - _space);

    if (!fault) {

      context.setFillColorRgb(textColorR, textColorG, textColorB);
    }
    else {

      context.setFillColorRgb(255, 0, 0);
    }

    context.fillText(_textOutput, showY == true ? _space : _offset, height - _offset * 1.5, width - _offset * 2 - _space);
    context.closePath();
  }

  void _enter() {

    if (_text != _lastText) {

      _text = _text;

      super.parent.parent.broadCastMessage(this, TextFieldID, _text);

      _lastText = _text;
    }
    else {

      super.parent.parent.broadCastMessage(this, SpeedID, "");
    }
  }

  void _inserCharacter(String character) {

    fault = false;

    String firstText = _text.substring(0, _index);

    firstText += character;

    String secondText = _text.substring(_index, _text.length);

    _text = firstText + secondText;
  }

  void _setIndex(int index) {

    if (index >= 0 && index <= _text.length) {

      _index = index;
    }
  }
}