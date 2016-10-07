part of pipi;

/**
 * A collection of views.
 */
abstract class Scene {


  /**
   * The host container.
   */
  final Container container;

  /**
   * The time since the app started.
   */
  double _time = 0.0;

  /**
   * Time between frames.
   */
  double _delta = 0.0;

  /**
   * The views in the scene.
   */
  List<View> _views = new List<View>();

  /**
   * The view that currently has the focus.
   */
  View focusView = null;

  /**
   * Initializes the scene with a container.
   */
  Scene(this.container);

  /**
   * Adds the view to the scene.
   */
  void addView(View view) {

    if (view.parent != null) {

      throw "View has already a parent.";
    }
    
    view.parent = this;

    _views.add(view);

    document.body.append(view.canvas);
  }

  /**
   * Broadcasts a message to the views' elements.
   */
  void broadCastMessage(var sender, int id, String msg) {

    sendMessage(sender, id, msg);

    for (View view in _views) {

      view.broadCastMessage(sender, id, msg);
    }
  }

  /**
   * Sends a message to the scene.
   */
  void sendMessage(var sender, int id, String msg) {}

  /**
   * Draws the scene and its views.
   */
  void draw(double delta) {

    _delta = delta;

    _time += delta;

    for (View view in _views) {

      view.draw();
    }
  }

  void resetTime() {

    _time = 0.0;
  }

  double get time => _time;

  double get delta => _delta;
}