import 'package:rive/rive.dart';

class RiveUtil {
  static StateMachineController getRiveController(Artboard artboard,
      {stateMachine = "stateMachine1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachine);
    artboard.addController(controller!);
    return controller;
  }
}
