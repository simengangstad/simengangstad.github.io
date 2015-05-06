part of pipi;

abstract class Level extends Scene {

  final String _name = "Pipi";

  Grid _grid;

  View _gridView, _inputView;

  TextField _textField;

  Actor _actor;

  Goal _goal;

  List<Obstacle> _obstacles = new List<Obstacle>();

  bool _showingMessageBox = false;

  MessageBox _messageBox;

  Label _label, _scoreLabel;

  /**
   * Server IP.
   */
  final String url = "http://localhost:25565";

  /**
   * Used in statistics.
   */
  double _timeUsed = 0.0;

  Level(Container container) : super(container) {

    _grid = new Grid(0.0, 0.0, 900.0, 600.0);

    _actor = new Actor(_grid);
    _actor..colorR = 249
          ..colorG = 81
          ..colorB = 82;

    _goal = new Goal(_grid, 0.0, 0.0, _actor.width + 1.5);
    _goal..colorR = 249
         ..colorG = 81
         ..colorB = 82;


    _gridView = new View(document.body.clientWidth ~/ 2.0 - 900 ~/ 2.0, 20, 900, 600);
    _gridView..backgroundColorR = 58
             ..backgroundColorG = 58
             ..backgroundColorB = 58;

    _gridView.addElement(_grid);
    _gridView.addElement(_actor);
    _gridView.addElement(_goal);

    addView(_gridView);

    _textField = new TextField(0.0, 0.0, 730.0, 80.0);

    Button button;
    button = new Button(900.0 - 100.0, 0.0, 900.0 - (900 - 100.0), 80.0, () {

      button.parent.broadCastMessage(button, ButtonID, "");
    });

    button..text = " ↵"
          ..defaultR = 249
          ..defaultG = 81
          ..defaultB = 82
          ..hoveredR = 255
          ..hoveredG = 105
          ..hoveredB = 105;

    _inputView = new View(document.body.clientWidth ~/ 2.0 - 900 ~/ 2.0, _gridView.y + _gridView.height + 20, 900, 80);
    _inputView..backgroundColorR = 58
              ..backgroundColorG = 58
              ..backgroundColorB = 58;

    _inputView.addElement(button);
    _inputView.addElement(_textField);

    addView(_inputView);

    _messageBox = new MessageBox(_gridView.width / 2.0 - 250.0 / 2.0, (_gridView.height / 2.0), 300.0, 25.0 * 5.5);

    _messageBox.label..font = "bold 20px Trebuchet MS"
                     ..fillR = 64
                     ..fillG = 64
                     ..fillB = 64

                     ..textR = 255
                     ..textG = 255
                     ..textB = 255
                     ..xOffset = 0.0
                     ..yOffset = 10.0
                     ..ySpacing = 5.0;

    _messageBox.leftButton..text = "       Neste"

                          ..defaultR = 80
                          ..defaultG = 80
                          ..defaultB = 80

                          ..hoveredR = 128
                          ..hoveredG = 128
                          ..hoveredB = 128;

    _messageBox.rightButton..text = "       Avbryt"

                           ..defaultR = 80
                           ..defaultG = 80
                           ..defaultB = 80

                           ..hoveredR = 128
                           ..hoveredG = 128
                           ..hoveredB = 128;

    _label = new Label("", 0.0, 0.0, 0.0, 0.0);
    _label.font = "bold 20px Trebuchet MS";

    _label..borderG = 128

          ..fillR = 128
          ..fillG = 255
          ..fillB = 128

          ..textR = 58
          ..textG = 58
          ..textB = 58

          ..yOffset = 20.0
          ..stickToBackground = true;

    if (data["score"] == null) {

      data["score"] = "0";
    }

    _scoreLabel = new Label("Poeng: ${data["score"]}", 10.0, 10.0, 100.0, 25.0);

    _scoreLabel..textR = 255
               ..textG = 255
               ..textB = 255

               ..font = "bold 20px Trebuchet MS"

               ..transparent = true;

    _gridView.addElement(_scoreLabel);
  }

  @override
  void sendMessage(var sender, int id, String msg) {

    if (_showingMessageBox) return;

    if (id == TextFieldID) {

      _actor.setExpression(msg);
    }
  }

  void addObstacle(Obstacle obstacle) {

    _obstacles.add(obstacle);

    _gridView.addElement(obstacle);
  }

  void draw(double delta) {

    super.draw(delta);

    for (Obstacle obstacle in _obstacles) {

      if (obstacle.collides(_actor)) {

        _actor.crashed();
      }
    }

    if (_goal.actorIsInside(_actor)) {

      _actor._foundGoal = true;

      _actor._currentX = _goal.x;
      _actor._currentY = -_goal.y;

      // Print some message that you found the correct solution, and then we present the next value

      _completedLevel();

      return;
    }

    _timeUsed += delta;

    super.focusView = _inputView;

    _inputView.focusElement = _textField;
  }

  /**
   * Gets fired when the level is completed.
   */
  void _completedLevel() {

    if (_showingMessageBox) {

      if (_gridView.keys[KeyCode.ENTER]) {

        _gridView.canvas.remove();
        _inputView.canvas.remove();

        _messageBox.leftButton.onMouseDownAction();
      }
      else if (_gridView.keys[KeyCode.ESC]) {

        _gridView.canvas.remove();
        _inputView.canvas.remove();

        _messageBox.rightButton.onMouseDownAction();
      }

      return;
    }

    _showingMessageBox = true;

    _grid.isFrozen = true;
    _inputView.isFrozen = true;

    _gridView.addElement(_messageBox.label);
    _gridView.addElement(_messageBox.rightButton);
    _gridView.addElement(_messageBox.leftButton);

    int score = 1;

    if (_timeUsed < 30) {

      score += 2;

      _messageBox.label.text =

      """
      Du klarte det på ${_timeUsed.toStringAsFixed(2)} sekunder\n
        Du fikk 2 ekstrapoeng
      """;
    }
    else if (_timeUsed < 60) {

      score += 1;

      _messageBox.label.text =

      """
      Du klarte det på ${_timeUsed.toStringAsFixed(1)} sekunder\n
        Du fikk 1 ekstrapoeng
      """;
    }
    else {

      _messageBox.label.text =

      """
      Du klarte det på ${_timeUsed.toStringAsFixed(1)} sekunder\n
        Du fikk ingen ekstrapoeng
      """;
    }


    if (data["$runtimeType"] == null) {

      data["$runtimeType"] = "true";

      data["score"] = "${int.parse(data["score"]) + score}";
    }
    else {

      _messageBox.label.text =

      """
        Du har allerede gjort\n
             denne banen!
      """;
    }

    _scoreLabel.text = "Poeng: ${data["score"]}";

    void onError(error) {

      print(error);
    }

    HttpRequest.getString(url).then((String response) {

      HttpRequest request = new HttpRequest();

      Map<String, Map<String, String>> data;

      if (response == "") {

        data = new Map();
      }
      else {

        data = JSON.decode(response);
      }

      if (data[id.toString()] == null) {

        data.putIfAbsent(id, () => {this.runtimeType.toString() : "$_timeUsed : $score"});
      }
      else {

        data[id].putIfAbsent(this.runtimeType.toString(), () => "$_timeUsed : $score");
      }

      request.onReadyStateChange.listen((_) {

        if (request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)) {

          print(request.responseText);
        }
      }, onError: onError);

      request.open("POST", url, async: false);
      request.send("${JSON.encode(data)}");
    }, onError: onError);
  }
}