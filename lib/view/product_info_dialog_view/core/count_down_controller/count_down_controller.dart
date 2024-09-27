import 'package:new_weedus/export.dart';

class CloseButtonCountDownState extends ChangeNotifier {
  final CountDownController _controller = CountDownController();

  void startTimer() {
    _controller.start();
  }

  CountDownController get controller => _controller;
}
