import 'package:flutter/widgets.dart';
import 'package:loading/loading.dart';

abstract class Indicator {
  LoadingState context;
  List<AnimationController> animationControllers;

  paint(Canvas canvas, Paint paint, Size size);

  List<AnimationController> animation();

  void postInvalidate() {
    context.setState(() {});
  }

  void start() {
    animationControllers = animation();
    if (animationControllers != null) {
      startAnims(animationControllers);
    }
  }

  void dispose() {
    if (animationControllers != null) {
      for (var i = 0; i < animationControllers.length; i++) {
        //print("<flutter_loading plugin> dispose$i called");
        animationControllers[i].stop();
        animationControllers[i].dispose();
      }
    }
  }

  void startAnims(List<AnimationController> controllers) {
    for (var i = 0; i < controllers.length; i++) {
      //print("<flutter_loading plugin> startAnim$i called");
      startAnim(controllers[i]);
    }
  }

  void startAnim(AnimationController controller) {
    controller.repeat();
  }
}
