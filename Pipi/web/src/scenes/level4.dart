part of pipi;

// Levels with multiple solutions...

/*

1. goal = (4, 4)
2. goal = (6, 2)
3. goal = (2, 6)
4. goal = (6, -6)
5. goal = (6, -2)
6. goal = (10, 2)
7. goal = (4, 4)

 */

class Level4_1 extends MultipleSolutionLevel {

  Level4_1(Container container) : super(container, 3) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 4.0;
    _goal.y = 4.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    String text =

    """
    På denne banen er det flere måter $_name kan komme\n
    seg hjem på. Klarer du å finne dem?
    """;

    _label..text = text
          ..x = 3.0 * _grid.lineDelta / _grid.zoom
          ..y = 6.0 * _grid.lineDelta / _grid.zoom
          ..width = 525.0
          ..height = 25.0 * 3.0
          ..ySpacing = 5.0;

    _gridView.addElement(_label);
  }

  @override
  void _completedLevel() {

    super._completedLevel();

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level4_2(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level4_1(container);
      };
    }
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }
}

class Level4_2 extends MultipleSolutionLevel {

  Level4_2(Container container) : super(container, 3) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 6.0;
    _goal.y = 2.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 3.0, 8.0 - (8.0 -  1.5), 1.0, true, true));
  }

  @override
  void _completedLevel() {

    super._completedLevel();

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level4_3(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level4_2(container);
      };
    }
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }
}

class Level4_3 extends MultipleSolutionLevel {

  Level4_3(Container container) : super(container, 3) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 2.0;
    _goal.y = 6.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 8.0 - (8.0 -  5.5), 1.0, true, true));
  }

  @override
  void _completedLevel() {

    super._completedLevel();

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level4_4(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level4_3(container);
      };
    }
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }
}

class Level4_4 extends MultipleSolutionLevel {

  Level4_4(Container container) : super(container, 3) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -6.0);

    _goal.x = 6.0;
    _goal.y = -6.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 8.0 - (8.0 -  -6.5), 1.0, true, true));
  }

  @override
  void _completedLevel() {

    super._completedLevel();

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level4_5(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level4_4(container);
      };
    }
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }
}

class Level4_5 extends MultipleSolutionLevel {

  Level4_5(Container container) : super(container, 3) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -6.0);

    _goal.x = 6.0;
    _goal.y = -2.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 8.0 - (8.0 -  -2.5), 1.0, true, true));
  }

  @override
  void _completedLevel() {

    super._completedLevel();

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level4_6(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level4_5(container);
      };
    }
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }
}

class Level4_6 extends MultipleSolutionLevel {

  Level4_6(Container container) : super(container, 3) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 10.0;
    _goal.y = 2.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 5.0, 8.0 - (8.0 -  1.5), 1.0, true, true));
  }

  @override
  void _completedLevel() {

    super._completedLevel();

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level4_7(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level4_6(container);
      };
    }
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }
}

class Level4_7 extends MultipleSolutionLevel {

  Level4_7(Container container) : super(container, 5) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 4.0;
    _goal.y = 4.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    String text =

    """
    Nå er det fem måter $_name kan komme seg hjem på. Prøv å\n
    finne dem!
    """;

    _label..text = text
      ..x = 3.0 * _grid.lineDelta / _grid.zoom
      ..y = 6.0 * _grid.lineDelta / _grid.zoom
      ..width = 525.0
      ..height = 25.0 * 3.0
      ..ySpacing = 5.0;

    _gridView.addElement(_label);
  }

  @override
  void _completedLevel() {

    super._completedLevel();

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        _gridView.canvas.remove();
        _inputView.canvas.remove();

        container.scene = new Completed(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level4_6(container);
      };
    }
  }

  @override
  void draw(double delta) {

    _label.externalX = _grid._x;
    _label.externalY = _grid._y;

    super.draw(delta);
  }
}