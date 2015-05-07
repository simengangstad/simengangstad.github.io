part of pipi;

// Introducing x

/*

1. y = x
2. y = -x
3. y = x + 1
4. y = x + 2
5. y = -x - 1
6. y = 2*x
7. y = -2*x
8. y = x/2
9. y = x/-2
10.y = x/-2-2

 */

class Level2_1 extends Level {

  Level2_1(Container container) : super(container) {

    _grid.setPositionLowerLeft(-0.025, -0.025);

    _goal.x = 5.0;
    _goal.y = 5.0;

    _actor.x = 1.0;
    _actor.y = 1.0;

    addObstacle(new Obstacle(_grid, 2.0, 1.5, 1.0, true));
    addObstacle(new Obstacle(_grid, 3.0, 2.5, 1.0, true));
    addObstacle(new Obstacle(_grid, 4.0, 3.5, 1.0, true));

    String text =

    """
    $_name beveger seg ikke bare på en rett linje. Du ser\n
    at det har blitt lagt til en ny linje i ${_name}s verden\n
    nederst på skjermen. Denne linjen kaller vi x-aksen.\n
    \n
    Når $_name går 1 blokk til høyre vil vi at hun skal gå\n
    1 blokk opp, altså skrått. Så hva om vi setter y-verdien,\n
    høyden til $_name, lik hvor langt hun går til høyre?\n
    Da vil hun gå 1 høyde opp, for hver lengde hun går\n
    til høyre.\n
    Prøv å sett inn "x" i feltet.
    """;

    _label.text = text;
    _label.x = 5.0 * _grid.lineDelta / _grid.zoom;
    _label.y = 3.0 * _grid.lineDelta / _grid.zoom;
    _label.width = 525.0;
    _label.height = 25.0 * 9.0;

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

        container.scene = new Level2_2(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_1(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_2 extends Level {

  Level2_2(Container container) : super(container) {

    _grid.setPositionLowerLeft(-0.025, -5.25);

    _goal.x = 5.0;
    _goal.y = -5.0;

    _actor.x = 1.0;
    _actor.y = -1.0;

    addObstacle(new Obstacle(_grid, 2.0, -2.5, 1.0, true));
    addObstacle(new Obstacle(_grid, 3.0, -3.5, 1.0, true));
    addObstacle(new Obstacle(_grid, 4.0, -4.5, 1.0, true));

    String text =

    """
    $_name kan også å gå skrått nedover. Hva skjer om du setter\n
    inn "-x" mon tro?
    """;

    _label..text = text
          ..x = 5.0 * _grid.lineDelta / _grid.zoom
          ..y = 7.0 * _grid.lineDelta / _grid.zoom
          ..width = 525.0
          ..height = 25.0 * 3.0
          ..ySpacing = 5.0;

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

        container.scene = new Level2_3(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_2(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_3 extends Level {

  Level2_3(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 3.0;
    _goal.y = 4.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 1.5, 1.0, true));
    addObstacle(new Obstacle(_grid, 2.0, 2.5, 1.0, true));

    String text =

    """
    Noe sier meg at du må være kreativ for å få $_name\n
    hjem her. Hva med å kombinere det du har lært?
    """;

    _label..text = text
          ..x = 3.0 * _grid.lineDelta / _grid.zoom
          ..y = 5.0 * _grid.lineDelta / _grid.zoom
          ..width = 525.0
          ..height = 25.0 * 3.0
          ..ySpacing = 5.0;

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

        container.scene = new Level2_4(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_3(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_4 extends Level {

  Level2_4(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 2.0;
    _goal.y = 4.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 2.5, 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level2_5(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_4(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_5 extends Level {

  Level2_5(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -5.0);

    _goal.x = 3.0;
    _goal.y = -4.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, -2.5, 1.0, true));
    addObstacle(new Obstacle(_grid, 2.0, -3.5, 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level2_6(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_5(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_6 extends Level {

  Level2_6(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 2.0;
    _goal.y = 4.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 1.5, 1.0, true));

    String text =

    """
     Hvor bratt $_name kan gå, kan endres. x er bare et tall,\n
     og det kan ganges med et annet tall. Bruk "*" for å gange.
    """;

    _label.text = text;
    _label.x = 3.0 * _grid.lineDelta / _grid.zoom;
    _label.y = 5.0 * _grid.lineDelta / _grid.zoom;
    _label.width = 525.0;
    _label..height = 25.0 * 3.0
          ..ySpacing = 5.0;

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

        container.scene = new Level2_7(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_6(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_7 extends Level {

  Level2_7(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -5.0);

    _goal.x = 2.0;
    _goal.y = -4.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, -2.5, 1.0, true));

    String text =

    """
     Det samme gjelder for negative tall...
    """;

    _label.text = text;
    _label.x = 3.0 * _grid.lineDelta / _grid.zoom;
    _label.y = 7.0 * _grid.lineDelta / _grid.zoom;
    _label.width = 375.0;
    _label.height = 25.0 * 3.0;

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

        container.scene = new Level2_8(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_7(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_8 extends Level {

  Level2_8(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 6.0;
    _goal.y = 3.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 0.25, 1.0, true));
    addObstacle(new Obstacle(_grid, 2.0, 0.75, 1.0, true));
    addObstacle(new Obstacle(_grid, 3.0, 1.25, 1.0, true));
    addObstacle(new Obstacle(_grid, 4.0, 1.75, 1.0, true));
    addObstacle(new Obstacle(_grid, 5.0, 2.25, 1.0, true));

    String text =

    """
     Du kan også få $_name til å gå slakere. Hva om du deler x på \n
     et tall? Bruk "/" for å dele.
    """;

    _label.text = text;
    _label.x = 1.0 * _grid.lineDelta / _grid.zoom;
    _label.y = 2.0 * _grid.lineDelta / _grid.zoom;
    _label.width = 525.0;
    _label..height = 25.0 * 3.0
          ..ySpacing = 5.0;

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

        container.scene = new Level2_9(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_8(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_9 extends Level {

  Level2_9(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -5.0);

    _goal.x = 6.0;
    _goal.y = -3.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, -1.25, 1.0, true));
    addObstacle(new Obstacle(_grid, 2.0, -1.75, 1.0, true));
    addObstacle(new Obstacle(_grid, 3.0, -2.25, 1.0, true));
    addObstacle(new Obstacle(_grid, 4.0, -2.75, 1.0, true));
    addObstacle(new Obstacle(_grid, 5.0, -3.25, 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level2_10(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_9(container);
      };
    }

    super._completedLevel();
  }
}

class Level2_10 extends Level {

  Level2_10(Container container) : super(container) {

    _grid.setPositionLowerLeft(-1.0, -5.0);

    _goal.x = 6.0;
    _goal.y = -5.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, -3.25, 1.0, true));
    addObstacle(new Obstacle(_grid, 2.0, -3.75, 1.0, true));
    addObstacle(new Obstacle(_grid, 3.0, -4.25, 1.0, true));
    addObstacle(new Obstacle(_grid, 4.0, -4.75, 1.0, true));
    addObstacle(new Obstacle(_grid, 5.0, -5.25, 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_1(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level2_9(container);
      };
    }

    super._completedLevel();
  }
}
