import 'package:new_weedus/export.dart';

class UserSettingsView extends StatefulWidget {
  const UserSettingsView({super.key, required this.context});
  final BuildContext context;


  @override
  State<UserSettingsView> createState() => _UserSettingsViewState();
}

class _UserSettingsViewState extends State<UserSettingsView>
    with UserSettingsMixin {
  @override
  Widget build(BuildContext context) {
    UserSettingsViewModel _userSettingsViewModel =
        context.watch<UserSettingsViewModel>();
    AuthState _authState = Provider.of<AuthState>(context, listen: false);
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    return SingleChildScrollView(
      child: UserSettingsBuildWidgets.buildWidget(
          widget.context, _authState, _userViewModel, this,
          onStrainChange: (value) => _userSettingsViewModel.onValueChange(value)),
    );
  }
}
