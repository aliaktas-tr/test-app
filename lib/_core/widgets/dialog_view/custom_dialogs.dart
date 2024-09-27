import 'package:new_weedus/export.dart';
class BuildPurchaseErrorDialog {
  static const String _purchaseErrorTitle =
      'Sorry! 28.5g purchase limit for flower due to state regulations.\nYour purchase';
  static final int _duration = 4;

  static void dialog(CartState _cart,
      {String? msg, Color? boxColor, Color? textColor}) {
    SmartDialog.showNotify(
        msg: '',
        notifyType: NotifyType.error,
        displayTime: Duration(seconds: _duration),
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(defaultSize),
              decoration: BoxDecoration(
                  color: boxColor ?? Colors.red,
                  borderRadius: BorderRadius.circular(halfDefaultSize)),
              child: AppViewWidgets.textMontserrat(
                  msg ?? '${_purchaseErrorTitle} ${_cart.totalSize}g.',
                  color: textColor ?? scaffoldBackgroundColor));
        });
  }
}

class BuildDialog {
  static const List<BoxShadow> _shadow = [
    BoxShadow(
        color: nero05,
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3))
  ];

  static void showDialog(
      {required Widget child,
      Color? boxColor,
      Alignment? alignment,
      BorderRadiusGeometry? borderRadius,
      bool? activeBoxShadow = true}) {
    SmartDialog.show(
        alignment: alignment,
        animationType: SmartAnimationType.fade,
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(defaultSize),
              decoration: BoxDecoration(
                  color: boxColor ?? scaffoldBackgroundColor,
                  boxShadow: activeBoxShadow! ? _shadow : null,
                  borderRadius:
                      borderRadius ?? BorderRadius.circular(defaultSize)),
              child: child);
        });
  }
}

class AuthDialog {
  static void showDialog(
      {required AuthState authState,
      required GlobalKey<ScaffoldState> scaffoldKey,
      Color? boxColor,
      Alignment? alignment}) {
    BuildDialog.showDialog(
        borderRadius: BorderRadius.zero,
        boxColor: scaffoldBackgroundColor,
        child: AuthView(
            loginCallBack: authState.getCurrentUser, scaffoldKey: scaffoldKey));
  }
}

class UserSettingsRouteDialog {
  static Future<void> showDialog(BuildContext context2,
      {Duration? displayTime,
      Color? maskColor,
      Alignment? alignment,
      bool? clickMaskDismiss}) async {
    SmartDialog.show(
        displayTime: displayTime,
        maskColor: maskColor,
        clickMaskDismiss: clickMaskDismiss,
        animationType: SmartAnimationType.centerScale_otherSlide,
        alignment: alignment,
        builder: (context) => UserSettingsRouteDialogWidgets(context2: context2));
  }
}

class DisplayUserSetting {
  static Future<void> showDialog(BuildContext context2,
      {Duration? displayTime,
      Color? maskColor,
      Alignment? alignment,
      bool? clickMaskDismiss}) async {
    SmartDialog.show(
        displayTime: displayTime,
        maskColor: maskColor,
        clickMaskDismiss: clickMaskDismiss,
        animationType: SmartAnimationType.centerScale_otherSlide,
        alignment: alignment,
        builder: (context) => UserSettingsView(context: context2));
  }
}

class ProductCartDialog {
  static Future<void> showDialog(BuildContext context2,
      {Duration? displayTime,
      Color? maskColor,
      Alignment? alignment,
      bool? clickMaskDismiss}) async {
    SmartDialog.show(
        displayTime: displayTime,
        maskColor: maskColor,
        clickMaskDismiss: clickMaskDismiss,
        //  animationType:SmartAnimationType.fade ,
        animationType: SmartAnimationType.centerScale_otherSlide,
        alignment: alignment,
        builder: (context) {
          return ProductCartView(context: context2);
        });
  }
}
