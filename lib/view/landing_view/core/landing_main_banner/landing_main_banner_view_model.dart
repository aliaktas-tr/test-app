import 'package:new_weedus/export.dart';

class LandingMainBannerViewModel extends ChangeNotifier {
  int _currentIndex1 = 0;
  Timer? _timer1;
  List<String> _landingBannerList = [
    'assets/banner/web-banner2.png',
    'assets/banner/web-banner3.png'
  ];
  int get currentIndex1 => _currentIndex1;
  List<String> get landingBannerList => _landingBannerList;


  void startTimer() {
    _timer1 = Timer.periodic(const Duration(milliseconds: 5000), (timer) async {
      if (_currentIndex1 + 1 == _landingBannerList.length) {
        _currentIndex1 = 0;
        notifyListeners();
      } else {
        _currentIndex1 = _currentIndex1 + 1;
        notifyListeners();
      }
    });
  }

  void stopTimer() {
    _timer1?.cancel();
  }
}
