part of pipi;

class Container {

  Scene _scene;

  int _time = 0;
  int _ticks = 0;

  int _lastFrame = 0;
  double _delta = 0.0;

  void start() {

    scene = new Menu(this);

    window.requestAnimationFrame(tick);
  }

  set scene(Scene scene) {

    _scene = scene;

    _scene.resetTime();
  }

  void tick(num timeElapsed) {

    _delta = (timeElapsed - _lastFrame) / 1000.0;

    _lastFrame = timeElapsed.toInt();

    if (timeElapsed - _time >= 1000) {

      _time = timeElapsed.toInt();

      //print("Ticks: $ticks");

      _ticks = 0;
    }

    draw(_delta);

    _ticks++;

    window.requestAnimationFrame(tick);
  }

  void draw(double delta) {

    _scene.draw(delta);
  }
}