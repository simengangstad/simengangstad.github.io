part of pipi;

abstract class Element {

  /**
   * The position and size of the element.
   */
  double x, y, width, height;

  /**
   * The parent view.
   */
  View parent = null;

  /**
   * Determines if the element receives input and messages.
   */
  bool isFrozen = false;

  /**
   * Initializes the element with a position and a size.
   */
  Element(this.x, this.y, this.width, this.height);

  /**
   * Element with (0, 0) position and no area.
   */
  Element.Zero() : this(0.0, 0.0, 0.0, 0.0);

  /**
   * Sends a message from another element.
   */
  void sendMessage(Element sender, int id, String msg) {}

  /**
   * Called when a mouse button is pressed.
   */
  void onMouseDown(MouseEvent mouseEvent) {}

  /**
   * Called when a mouse button is pressed.
   */
  void onMouseUp(MouseEvent mouseEvent) {}

  /**
   * Called when the mouse moves.
   */
  void onMouseMove(MouseEvent mouseEvent) {}

  /**
   * Called when the mouse enters the element.
   */
  void onMouseEnter(MouseEvent mouseEvent) {}

  /**
   * Called when the mouse leaves the element.
   */
  void onMouseLeave(MouseEvent mouseEvent) {}

  /**
   * Called when the mouse wheel is scrolled.
   */
  void onMouseWheel(WheelEvent wheelEvent) {}

  /**
   * Called when a key is pressed (any key).
   */
  void onKeyDown(KeyboardEvent keyboardEvent) {}

  /**
   * Called when a character is pressed.
   */
  void onKeyPress(KeyboardEvent keyboardEvent) {}

  /**
   * Called when the key is released.
   */
  void onKeyUp(KeyboardEvent keyboardEvent) {}

  /**
   * Updates the element, doesn't get called if the element is forzen.
   */
  void update();

  /**
   * Draws the element.
   */
  void draw(CanvasRenderingContext2D context);
}