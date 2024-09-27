import 'package:new_weedus/export.dart';

class AppbarUserLoginView extends StatelessWidget {
  const AppbarUserLoginView({super.key, required this.context2 });
  final BuildContext context2;


  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return AppbarUserLoginWidgets.userStream(context2,scaffoldKey,userViewModel);
  }
}
