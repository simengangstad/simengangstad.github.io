part of pipi;

// Introduce constant term

/*

1. y = 1
2. y = 5
3. y = -2
4. y = 0

 */

class Level1_1 extends Level {

  Label _label;

  Level1_1(Container container) : super(container) {

    _grid.hideXAxis = true;

    _textField.showY = false;
    _grid.allowMovement = false;

    _grid.setPositionLowerLeft(-0.025, -0.025);

    _goal.x = 8.0;
    _goal.y = 1.0;

    _actor.x = 1.0;
    _actor.y = 4.0;

    addObstacle(new Obstacle(_grid, _goal.x - 1.0, _goal.y - 0.5, 1.0, true));

    String text =

    """
    Sirkelen $_name vil tilbake til hjemmet sitt.\n
    Du må hjelpe henne å komme seg hjem. $_name vet bare\n
    at hjemmet er til høyre, men vet ikke hvilken høyde\n
    det er på. Kan du hjelpe henne?
    \n
    Prøv å taste inn forskjellige tall i feltet.
    """;

    _label.text = text;
    _label.x = 1.5 * _grid.lineDelta / _grid.zoom;
    _label.y = 1.25 * _grid.lineDelta / _grid.zoom;
    _label.width = 500.0;
    _label.height = 25.0 * 6.0;

    _gridView.addElement(_label);
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level1_2(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level1_1(container);
      };
    }

    super._completedLevel();
  }
}

class Level1_2 extends Level {

  Label _label;

  Level1_2(Container container) : super(container) {

    _grid.hideXAxis = true;

    _textField.showY = false;
    _grid.allowMovement = false;

    _grid.setPositionLowerLeft(-0.025, -0.025);

    _goal.x = 6.0;
    _goal.y = 5.0;

    _actor.x = 1.0;
    _actor.y = 3.0;

    addObstacle(new Obstacle(_grid, _goal.x - 1.0, _goal.y - 0.5, 1.0, true));

    String text =

    """
    $_name har igjen gått seg vill. Kan du hjelpe henne hjem?
    \n
    For å få $_name til å gå fortere kan du trykke enter to ganger.\n
    Prøv å taste inn forskjellige tall i feltet.
    """;

    _label.text = text;
    _label.x = 2.5 * _grid.lineDelta / _grid.zoom;
    _label.y = 4.0 * _grid.lineDelta / _grid.zoom;
    _label.width = 600.0;
    _label.height = 25.0 * 4.0;
    _label.ySpacing = 2.0;

    _gridView.addElement(_label);
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level1_3(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level1_2(container);
      };
    }

    super._completedLevel();
  }
}

class Level1_3 extends Level {

  Label _label;

  Level1_3(Container container) : super(container) {

    _grid.hideXAxis = true;

    _textField.showY = false;
    _grid.allowMovement = false;

    _grid.setPositionLowerLeft(-0.025, -3.0);

    _goal.x = 6.0;
    _goal.y = -2.0;

    _actor.x = 1.0;
    _actor.y = 1.0;

    addObstacle(new Obstacle(_grid, _goal.x - 1, _goal.y - 0.5, 1.0, true));


    String text =

    """
    Igjen har $_name gått seg vill... Men denne gangen er\n
    det noe annerledes. Det er nesten som om at tallene\n
    på venstre side har noe mer med seg...
    \n
    Prøv å taste inn forskjellige tall i feltet.
    """;

    _label.text = text;
    _label.x = 2.5 * _grid.lineDelta / _grid.zoom;
    _label.y = 4.375 * _grid.lineDelta / _grid.zoom;
    _label.width = 500.0;
    _label.height = 25.0 * 5.0;

    _gridView.addElement(_label);
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level1_4(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level1_3(container);
      };
    }

    super._completedLevel();
  }
}

class Level1_4 extends Level {

  Label _label;

  Level1_4(Container container) : super(container) {

    _grid.setPositionLowerLeft(-0.025, -0.025);

    _grid.hideXAxis = true;

    _textField.showY = true;
    _grid.allowMovement = true;

    _goal.x = 8.0;
    _goal.y = 0.0;

    _actor.x = 1.0;
    _actor.y = 1.0;

    addObstacle(new Obstacle(_grid, _goal.x - 1, _goal.y - 0.5, 1.0, true));

    String text =

    """
    Du skjønner kanskje hva dette handler om nå.\n
    Denne linjen med tall på venstre side kaller\n
    vi y-aksen. Det er derfor det nå står y = i feltet;\n
    for det du taster inn er lik y-verdien på aksen og\n
    dermed der $_name går.\n
    \n
    Verdenen $_name lever i, kooridinatsystemet, kan nå\n
    også beveges. Prøv å klikk og dra!
    """;

    _label.text = text;
    _label.x = 1.5 * _grid.lineDelta / _grid.zoom;
    _label.y = 1.375 * _grid.lineDelta / _grid.zoom;
    _label.width = 500.0;
    _label.height = 25.0 * 8.0;

    _gridView.addElement(_label);
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level2_1(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level1_4(container);
      };
    }

    super._completedLevel();
  }
}