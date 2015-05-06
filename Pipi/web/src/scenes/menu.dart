part of pipi;

class Menu extends Scene {


  Menu(Container container) : super(container) {

    View view = new View(document.body.clientWidth ~/ 2.0 - 900 ~/ 2.0, 20, 900, 600);

    view..backgroundColorR = 58
         ..backgroundColorG = 58
         ..backgroundColorB = 58
         ..drawBorder       = false;


    Label title = new Label(" Pipi", 900.0 / 2.0 - 200.0 / 2.0, 100.0, 200.0, 100.0);

    title..transparent = true
         ..textR = 249
         ..textG = 81
         ..textB = 82
         ..font = "bold 72px Trebuchet MS";

    view.addElement(title);


    Button play = new Button(900.0 / 2.0 - 150.0 / 2.0, 200.0, 150.0, 75.0, () {

      container.scene = new Level1_1(container);

      view.canvas.remove();
    });

    play..text = "  Spill"
        ..defaultR = 80
        ..defaultG = 80
        ..defaultB = 80

        ..hoveredR = 128
        ..hoveredG = 128
        ..hoveredB = 128;

    view.addElement(play);

    addView(view);
  }
}