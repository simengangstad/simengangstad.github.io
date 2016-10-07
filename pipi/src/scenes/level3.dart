part of pipi;

// More complicated levels with x and you have to be creative with the knowledge
// you've learnt so far.

/*

1. y = 3x
2. y = x-3
3. y = x/2 - 2
4. y = x/3
5. y = -3x
6. y = -x/3
7. y = x/3 + 3
8. y = 2x + 2
9. y = x/4
10. y = x/5

*/

class Level3_1 extends Level {

  Level3_1(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 2.0;
    _goal.y = 6.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 8.0 - (8.0 - 2.0), 2.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_2(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_1(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_2 extends Level {

  Level3_2(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 5.0;
    _goal.y = 2.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 8.0 - (8.0 - -2.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 2.0, 8.0 - (8.0 - -1.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 3.0, 8.0 - (8.0 - -0.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 4.0, 8.0 - (8.0 -  0.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_3(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_2(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_3 extends Level {

  Level3_3(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 8.0;
    _goal.y = 2.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 2.0, 8.0 - (8.0 - -1.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 4.0, 8.0 - (8.0 - -0.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 6.0, 8.0 - (8.0 -  0.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_4(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_3(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_4 extends Level {

  Level3_4(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 9.0;
    _goal.y = 3.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 3.0, 8.0 - (8.0 -  0.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 6.0, 8.0 - (8.0 -  1.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_5(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_4(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_5 extends Level {

  Level3_5(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -6.0);

    _goal.x = 2.0;
    _goal.y = -6.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 8.0 - (8.0 -  -4.0), 2.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_6(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_5(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_6 extends Level {

  Level3_6(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -6.0);

    _goal.x = 9.0;
    _goal.y = -3.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 3.0, 8.0 - (8.0 -  -1.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 6.0, 8.0 - (8.0 -  -2.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_7(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_6(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_7 extends Level {

  Level3_7(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 9.0;
    _goal.y = 6.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 3.0, 8.0 - (8.0 -  3.5), 1.0, true));
    addObstacle(new Obstacle(_grid, 6.0, 8.0 - (8.0 -  4.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_8(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_7(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_8 extends Level {

  Level3_8(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 2.0;
    _goal.y = 6.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 1.0, 8.0 - (8.0 -  3.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_9(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_8(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_9 extends Level {

  Level3_9(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 8.0;
    _goal.y = 2.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 4.0, 8.0 - (8.0 -  0.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level3_10(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_9(container);
      };
    }

    super._completedLevel();
  }
}

class Level3_10 extends Level {

  Level3_10(Container container) : super(container) {

    _grid.lineDelta = 75;

    _grid.setPositionLowerLeft(-1.0, -1.0);

    _goal.x = 10.0;
    _goal.y = 2.0;

    _actor.x = 0.0;
    _actor.y = 0.0;

    addObstacle(new Obstacle(_grid, 5.0, 8.0 - (8.0 -  0.5), 1.0, true));
  }

  @override
  void _completedLevel() {

    if (!_showingMessageBox) {

      _messageBox.leftButton.onMouseDownAction = () {

        container.scene = new Level4_1(container);
      };

      _messageBox.rightButton.onMouseDownAction = () {

        container.scene = new Level3_10(container);
      };
    }

    super._completedLevel();
  }
}