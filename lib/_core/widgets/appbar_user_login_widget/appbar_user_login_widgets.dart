import 'package:new_weedus/export.dart';

class _AppbarUserLoginConstants {
  _AppbarUserLoginConstants._();

  static final double _fontSize = 16;
  static final String _loginTitle = 'Login';
  static final double _indicatorSize = 24;
  static final double _avatarSize = 14;
}

class AppbarUserLoginWidgets {
  static Widget userStream(BuildContext context2,
      GlobalKey<ScaffoldState> scaffoldKey, UserViewModel userViewModel) {
    return Consumer<AuthState>(builder: (context, authState, _) {
      final userModel = authState.userModel;
      if (userModel == null && authState.authStatus == AuthStatus.LOGGED_IN) {
        return SizedBox(
            width: _AppbarUserLoginConstants._indicatorSize,
            height: _AppbarUserLoginConstants._indicatorSize,
            child: CircularProgressIndicator());
      } else if (userModel == null) {
        return _userIconRow(authState, scaffoldKey);
      } else {
        return _userContent(context2, userModel, authState, userViewModel);
      }
    });
  }

  static Widget _userIconRow(
          AuthState authState, GlobalKey<ScaffoldState> scaffoldKey) =>
      AppViewWidgets.customInkWell(
        onTap: () => AuthDialog.showDialog(
            authState: authState, scaffoldKey: scaffoldKey),
        child: Row(children: [
          Icon(Icons.person_outline, color: appColor),
          Text(_AppbarUserLoginConstants._loginTitle, style: _textStyle)
        ]),
      );

  static Widget _userContent(BuildContext context, UserModel? userModel,
      AuthState authState, UserViewModel userViewModel) {
    return AppViewWidgets.customInkWell(
        onTap: () => UserSettingsRouteDialog.showDialog(
              context,
              maskColor: Colors.transparent,
              clickMaskDismiss: true,
              alignment: Alignment.topRight,
              /* userViewModel: userViewModel,
            authState: authState*/
            ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildUserAvatar(userModel),
              SizedBox(width: halfDefaultSize),
              Text(getInitials(string: userModel!.displayName ?? ''),
                  style: _textStyle)
            ]));
  }

  static Widget _buildUserAvatar(UserModel? userModel) {
    if (userModel?.profileImage == null || userModel!.profileImage!.isEmpty) {
      return CircleAvatar(
          radius: _AppbarUserLoginConstants._avatarSize,
          backgroundColor: scaffoldBackgroundColor,
          child: Center(
              child: AppViewWidgets.textMontserrat(
                  userModel!.displayName![0].toUpperCase(),
                  color: effectsTextColor,
                  fontSize: _AppbarUserLoginConstants._fontSize,
                  fontWeight: FontWeight.w600)));
    } else {
      return CircleAvatar(
          radius: _AppbarUserLoginConstants._avatarSize,
          backgroundImage: NetworkImage(userModel.profileImage!));
    }
  }

  static TextStyle get _textStyle => GoogleFonts.michroma(
      fontSize: _AppbarUserLoginConstants._fontSize,
      fontWeight: FontWeight.w400,
      color: appColor);
}
