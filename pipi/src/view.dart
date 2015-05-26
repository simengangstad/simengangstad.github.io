part of pipi;

typedef void InputAction(Element element, UIEvent event);

/**
 * A renderable canvas with UI elements and input handling.
 */
class View {

  /**
   * The coordinates and dimension.
   */
  final int x, y, width, height;

  /**
   * The parent scene.
   */
  Scene parent;

  /**
   * The rendering canvas.
   */
  final CanvasElement canvas;

  /**
   * The rendering context.
   */
  CanvasRenderingContext2D _context;

  /**
   * The mouse cooridnates.
   */
  int _mouseX = 0, _mouseY = 0;

  /**
   * The mouse buttons clicked.
   */
  List<bool> _buttons = new List<bool>(5);

  /**
   * The keys clicked.
   */
  List<bool> _keys = new List<bool>(256);

  /**
   * The UI elements in the view.
   */
  List<Element> _elements = new List<Element>();

  /**
   * The current focus element.
   */
  Element focusElement = null;

  /**
   * Draws a border around the view.
   */
  bool drawBorder = true;

  /**
   * Determines if the view receives input and messages.
   */
  bool isFrozen = false;

  /**
   * The background color of the view.
   */
  int backgroundColorR = 255, backgroundColorG = 255, backgroundColorB = 255;

  /**
   * The border color of the view.
   */
  int borderColoR = 255, borderColorG = 255, borderColorB = 255;

  /**
   * Initializes the view with coordinates and dimension.
   */
  View(this.x, this.y, this.width, this.height) : canvas = new CanvasElement() {

    _buttons.fillRange(0, _buttons.length, false);
    _keys.fillRange(0, _keys.length, false);

    canvas.style.left = "${x}px";
    canvas.style.top = "${y}px";
    canvas.style.position = "absolute";
    canvas.width = width;
    canvas.height = height;

    canvas.onMouseDown.listen(onMouseDown);
    canvas.onMouseUp.listen(onMouseUp);
    canvas.onMouseMove.listen(onMouseMove);
    canvas.onMouseEnter.listen(onMouseEnter);
    canvas.onMouseLeave.listen(onMouseLeave);
    canvas.onMouseWheel.listen(onMouseWheel);

    document.onKeyDown.listen(onKeyDown);
    document.onKeyPress.listen(onKeyPress);
    document.onKeyUp.listen(onKeyUp);

    _context = canvas.context2D;
  }

  /**
   * Adds an UI element to the view.
   */
  void addElement(Element element) {

    if (element.parent != null) {

      throw "Element has already got a parent!";
    }

    element.parent = this;

    _elements.add(element);
  }

  /**
   * Delegates mouse events to the elements.
   */
  void _mouseAction(MouseEvent event, InputAction inputAction) {

    for (Element element in _elements) {

      if ((event.offset.x > element.x && event.offset.x < element.x + element.width) &&
          (event.offset.y > element.y && event.offset.y < element.y + element.height)) {

        if (element.isFrozen) continue;

        inputAction(element, event);
      }
    }
  }

  /**
   * Delegates keyboard events to the elements.
   */
  void _keyboardAction(KeyboardEvent event, InputAction inputAction) {

    for (Element element in _elements) {

      if (element == focusElement && !element.isFrozen) {

        inputAction(element, event);
      }
    }
  }

  /**
   * These events have the view's canvas as the listener.
   */

  /**
   * Called when a mouse button is pressed.
   *
   * This sets the flag for the given button and declares the view as the current focus view.
   */
  void onMouseDown(MouseEvent mouseEvent) {

    if (isFrozen) return;

    _mouseAction(mouseEvent, (Element element, MouseEvent event) {

      focusElement = element;

      element.onMouseDown(event);

    });

    _buttons[mouseEvent.button] = true;

    parent.focusView = this;
  }

  /**
   * Called when a mouse button is pressed.
   */
  void onMouseUp(MouseEvent mouseEvent) {

    if (isFrozen) return;

    _mouseAction(mouseEvent, (Element element, MouseEvent event) => element.onMouseUp(event));

    _buttons[mouseEvent.button] = false;
  }

  /**
   * Called when the mouse moves.
   */
  void onMouseMove(MouseEvent mouseEvent) {

    if (isFrozen) return;

    for (Element element in _elements) {

      if ((mouseEvent.offset.x > element.x && mouseEvent.offset.x < element.x + element.width) &&
          (mouseEvent.offset.y > element.y && mouseEvent.offset.y < element.y + element.height)) {

        if (element.isFrozen) continue;

        element.onMouseMove(mouseEvent);

        if ((_mouseX < element.x || _mouseX > element.x + element.width) ||
            (_mouseY < element.y || _mouseY > element.y + element.height)) {

          element.onMouseEnter(mouseEvent);
        }
      }
      else {

        if ((_mouseX > element.x && _mouseX < element.x + element.width) &&
            (_mouseY > element.y && _mouseY < element.y + element.height)) {

          element.onMouseLeave(mouseEvent);
        }
      }
    }

    _mouseX = mouseEvent.offset.x;
    _mouseY = mouseEvent.offset.y;
  }

  /**
   * Called when the mouse enters the view.
   */
  void onMouseEnter(MouseEvent mouseEvent) {

    if (isFrozen) return;

    _mouseAction(mouseEvent, (Element element, MouseEvent event) => element.onMouseEnter(event));
  }

  /**
   * Called when the mouse leaves the view.
   */
  void onMouseLeave(MouseEvent mouseEvent) {

    if (isFrozen) return;

    for (Element element in _elements) {

      if (element.isFrozen) continue;

      element.onMouseLeave(mouseEvent);
    }
  }

  /**
   * Called when the mouse wheel is scrolled.
   */
  void onMouseWheel(WheelEvent wheelEvent) {

    if (isFrozen) return;

    _mouseAction(wheelEvent, (Element element, WheelEvent event) => element.onMouseWheel(event));
  }

  /**
   * The document listens for these events, and therefore a check for the current focus view is necessary for view-specific events.
   */

  /**
   * Called when a key is pressed (any key).
   */
  void onKeyDown(KeyboardEvent keyboardEvent) {

    if (keyboardEvent.keyCode == KeyCode.BACKSPACE && (browser.isChrome || browser.isFirefox)) {

      // Prevent going back to the previous page.

      print("Preventing backspace!");

      keyboardEvent.preventDefault();
    }

    if (isFrozen) return;

    _keys[keyboardEvent.keyCode] = true;

    if (this != parent.focusView) {

      return;
    }

    _keyboardAction(keyboardEvent, (Element element, KeyboardEvent keyboardEvent) => element.onKeyDown(keyboardEvent));
  }

  /**
   * Called when a character is pressed.
   */
  void onKeyPress(KeyboardEvent keyboardEvent) {

    if (isFrozen) return;

    if (this != parent.focusView) {

      return;
    }

    _keyboardAction(keyboardEvent, (Element element, KeyboardEvent keyboardEvent) => element.onKeyPress(keyboardEvent));
  }

  /**
   * Called when the key is released.
   */
  void onKeyUp(KeyboardEvent keyboardEvent) {

    if (isFrozen) return;

    _keys[keyboardEvent.keyCode] = false;

    if (this != parent.focusView) {

      return;
    }

    _keyboardAction(keyboardEvent, (Element element, KeyboardEvent keyboardEvent) => element.onKeyUp(keyboardEvent));
  }

  /**
   * Draws the view.
   */
  void draw() {

    _context.setTransform(1, 0, 0, 1, 0, 0);
    _context.setFillColorRgb(backgroundColorR, backgroundColorG, backgroundColorB);
    _context.fillRect(0, 0, width, height);

    if (drawBorder) {

      _context.setStrokeColorRgb(borderColoR, borderColorG, borderColorB);

      _context.lineWidth = 4;

      _context.beginPath();

      _context.moveTo(0, 0);
      _context.lineTo(width, 0);

      _context.moveTo(width, 0);
      _context.lineTo(width, height);

      _context.moveTo(width, height);
      _context.lineTo(0, height);

      _context.moveTo(0, height);
      _context.lineTo(0, 0);

      _context.closePath();
      _context.stroke();
    }

    for (Element element in _elements) {

      if (!element.isFrozen && !isFrozen) {

        element.update();
      }

      element.draw(_context);
    }
  }

  /**
   * Broadcasts a message to every element.
   */
  void broadCastMessage(Element sender, int id, String msg) {

    if (isFrozen) return;

    for (Element element in _elements) {

      if (element != sender && !element.isFrozen) {

        element.sendMessage(sender, id, msg);
      }
    }
  }

  /**
   * Mouse coordinates.
   */
  int get mouseX => _mouseX;
  int get mouseY => _mouseY;

  /**
   * Returns the buttons
   */
  List<bool> get buttons => _buttons;

  /**
   * Returns the keys.
   */
  List<bool> get keys => _keys;
}