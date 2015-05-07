library pipi;

import "dart:html" hide Element;
import "dart:math";
import "dart:convert";
import "dart:collection";
import "package:math_expressions/math_expressions.dart";
import "package:browser_detect/browser_detect.dart";

part "container.dart";
part "scene.dart";
part "view.dart";
part "element.dart";

part "scenes/level.dart";
part "scenes/menu.dart";
part "scenes/multiplesolutionlevel.dart";
part "scenes/completed.dart";

part "elements/obstacle.dart";
part "elements/actor.dart";
part "elements/button.dart";
part "elements/grid.dart";
part "elements/textfield.dart";
part "elements/goal.dart";
part "elements/label.dart";
part "elements/messagebox.dart";
part "elements/star.dart";

part "scenes/level1.dart";
part "scenes/level2.dart";
part "scenes/level3.dart";
part "scenes/level4.dart";

final int ExpressionFault = 21;
final int ButtonID = 14;
final int TextFieldID = 99;
final int SpeedID = 55;

final String serverIP = "http://188.113.91.207:1337";

/**
 * To store data like score and etc.
 */
final Map<String, String> data = new HashMap();

final String id = "${new Random().nextInt(100000)}_${new Random().nextInt(10000)}";
