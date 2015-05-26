part of pipi;

class Completed extends Scene {

  Completed(Container container) : super(container) {

    View view = new View(document.body.clientWidth ~/ 2.0 - 900 ~/ 2.0, 20, 900, 600);

    view..backgroundColorR = 58
      ..backgroundColorG = 58
      ..backgroundColorB = 58
      ..drawBorder       = false;

    String text =

    """
    Gratulerer, du klarte alle nivåene!\n
    Pipi har nå husarrest slik at hun\n
    ikke roter seg bort så mye.\n
    \n
    Poeng totalt: ${data["score"]}/93\n
    """;

    Label title = new Label(text, 900.0 / 2.0 - 700.0 / 2.0, 100.0, 700.0, 100.0 * 5.0);

    title..transparent = true
         ..textR = 249
         ..textG = 81
         ..textB = 82
         ..ySpacing = 10.0
         ..font = "bold 48px Trebuchet MS";

    view.addElement(title);

    addView(view);
  }
}