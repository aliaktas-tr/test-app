import 'package:new_weedus/export.dart';


mixin ConfirmEmailMixin on State<ConfirmEmailView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late Timer _timer;
  late Timer? _buttonTimer;
  int _secondsRemaining = 180;
  bool _enableResend = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      var state = Provider.of<AuthState>(context, listen: false);
     // state.emailVerified();
    });
    _setButtonTimer();
  }

  void _setButtonTimer() {
    _buttonTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_secondsRemaining != 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _enableResend = true;
        });
      }
    });
  }

  void resendConfirmEmail() {
    var state = Provider.of<AuthState>(context, listen: false);
    //state.sendEmailVerification(context, _scaffoldKey);
    setState(() {
      _secondsRemaining = 180;
      _enableResend = false;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _buttonTimer!.cancel();
    super.dispose();
  }

  int get secondsRemaining => _secondsRemaining;

  bool get enableResend => _enableResend;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
}
