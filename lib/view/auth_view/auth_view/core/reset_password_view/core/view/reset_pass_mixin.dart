import 'package:new_weedus/export.dart';


mixin ResetPassMixin on State<ResetPasswordView> {
  late TextEditingController? _emailController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _emailController!.addListener(() {
      setState(() {});
    });
  }

  TextEditingController get emailController => _emailController!;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
}
