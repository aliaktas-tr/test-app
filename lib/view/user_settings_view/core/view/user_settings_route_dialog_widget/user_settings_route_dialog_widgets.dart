import 'package:new_weedus/export.dart';

class UserSettingsRouteDialogWidgets extends StatelessWidget {
  const UserSettingsRouteDialogWidgets({super.key, required this.context2});
  final BuildContext context2;


  static const List<String> _getTitles = [
    'Account Details',
    'Bank Account',
    'Preferences',
    'Orders',
    'Logout'
  ];
  static const List<BoxShadow> _shadow = [
    BoxShadow(color: nero05, spreadRadius: 5, blurRadius: 7)
  ];

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthState>();
    final userViewModel = context.watch<UserViewModel>();
    return buildWidget(context2, userViewModel, authState);
  }

  Container buildWidget(BuildContext context, UserViewModel userViewModel,
          AuthState authState) =>
      Container(
          padding: EdgeInsets.all(doubleDefaultSize),
          margin: EdgeInsets.only(top: kToolbarHeight, right: defaultSize),
          decoration: BoxDecoration(
              color: scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(halfDefaultSize),
              boxShadow: _shadow),
          child: _routeTextWidget(context, userViewModel, authState));

  Row _routeTextWidget(BuildContext context, UserViewModel userViewModel,
          AuthState authState) =>
      Row(mainAxisSize: MainAxisSize.min, children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                _getTitles.length,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppViewWidgets.customInkWell(
                            onTap: index == 4
                                ? () => authState.signOut()
                                : () {
                                    SmartDialog.dismiss(force: true);
                                    DisplayUserSetting.showDialog(context);
                                    userViewModel.setSettingIndex(index);
                                  },
                            child: AppViewWidgets.textMontserrat(
                                _getTitles[index])),
                        _getTitles.length - 1 == index
                            ? _shrink
                            : SizedBox(height: defaultSize)
                      ],
                    ))
          ],
        )
      ]);

  SizedBox get _shrink => SizedBox.shrink();
}
