part of pipi;

class MultipleSolutionLevel extends Level {

  List<Star> _stars;
  List<String> _solutions;

  List<List<double>> _steps = new List();

  int _amountOfSolutions, _amountOfSolved = 0;

  bool _addedStars = false;

  MultipleSolutionLevel(Container container, int solutions) : super(container), _stars = new List<Star>(), _solutions = new List<String>(), _amountOfSolutions = solutions {

    firstGap = 60;
    secondGap = 120;
  }

  @override
  void _completedLevel() {

    if (_amountOfSolutions == _amountOfSolved) {

      super._completedLevel();
    }
    else {

      bool contains = false;

      ContextModel contextModel = new ContextModel();
      Expression expression = _grid._expression;
      Number number = new Number(0);
      Variable x = new Variable("x");

      List<double> newSteps = new List();

      for (int a = _actor.x.toInt(); a < _goal.x.toInt(); a++) {

        number.value = a;

        if (_grid._expression.simplify().toString().contains("x")) {

          contextModel.bindVariable(x, number);
        }

        newSteps.add(expression.evaluate(EvaluationType.REAL, contextModel));
      }

      for (List<int> steps in _steps) {

        bool equal = true;

        for (int i = 0; i < steps.length; i++) {

          if (newSteps[i] != steps[i]) {

            equal = false;
          }
        }

        if (equal) {

          contains = true;
        }
      }

      if (!contains) {

        _steps.add(newSteps);

        _stars[_amountOfSolved]..fillColorR = 255
                               ..fillColorG = 255
                               ..fillColorB = 255;

        _amountOfSolved++;
      }
    }
  }

  @override
  void draw(double delta) {

    if (!_addedStars) {

      _addedStars = true;

      double innerRadius = 20.0, outerRadius = 37.5;

      double offset = 20.0;

      for (int i = 0; i < _amountOfSolutions; i++) {

        Star star = new Star(_grid.width - (i + 1) * outerRadius - outerRadius * i - offset * (i + 1), outerRadius + offset, innerRadius, outerRadius, 5);

        star..rotation = 90.0
            ..borderColorR = 249
            ..borderColorG = 81
            ..borderColorB = 82
            ..fillColorR = 58
            ..fillColorG = 58
            ..fillColorB = 58;

        _stars.add(star);
        _gridView.addElement(star);
      }
    }

    super.draw(delta);
  }
}