import 'package:new_weedus/export.dart';

class _UserSettingsConstants {
  _UserSettingsConstants._();

  static final double _desktopSize = 850;
  static final double _mobileSize = 470;
  static final double _contentHeight = 600;
  static final double _openDrawerWidth = 250;
  static final double _pageMarginValue = 80;
  static final EdgeInsetsGeometry _pagesMargin = EdgeInsets.fromLTRB(
      _pageMarginValue, defaultSize, defaultSize, defaultSize);

  static final BoxDecoration _buildWidgetDecoration = BoxDecoration(
      color: scaffoldBackgroundColor,
      boxShadow: [BoxShadow(color: nero05, spreadRadius: 5, blurRadius: 7)]);
}

class UserSettingsBuildWidgets {
  static Widget buildWidget(BuildContext context, AuthState authState,
          UserViewModel userViewModel, UserSettingsMixin mixin,
          {Function(List<bool>)? onStrainChange}) =>
      Container(
          alignment: Alignment.center,
          width: context.width <= _UserSettingsConstants._desktopSize
              ? _UserSettingsConstants._mobileSize
              : _UserSettingsConstants._desktopSize,
          height: _UserSettingsConstants._contentHeight,
          decoration: _UserSettingsConstants._buildWidgetDecoration,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                context.width <= _UserSettingsConstants._desktopSize
                    ? _closedDrawer(userViewModel, mixin)
                    : _openDrawer(authState, userViewModel, mixin),
                _getPages(context, authState, userViewModel, mixin,
                    onStrainChange: onStrainChange),
              ]));

  static Expanded _getPages(BuildContext context, AuthState authState,
          UserViewModel userViewModel, UserSettingsMixin mixin,
          {Function(List<bool>)? onStrainChange}) =>
      Expanded(
          child: Container(
              color: scaffoldBackgroundColor,
              margin: _UserSettingsConstants._pagesMargin,
              child: PageView(
                controller: mixin.pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {

                  userViewModel.setSettingIndex(index);
                },
                children: [
                   AccountDetailViewBuildWidgets.buildWidget(context,authState, mixin),
                  BankAccountViewBuildWidgets.buildWidget(context),
                  PreferencesView(onValueChange: onStrainChange!),
                  OrderViewWidgets.buildWidget(),
                ],
              )));

  static Widget _openDrawer(AuthState authState, UserViewModel userViewModel,
          UserSettingsMixin mixin) =>
      Drawer(
          width: _UserSettingsConstants._openDrawerWidth,
          backgroundColor: scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(),
          child: ListView(children: [
            _headerWidgets(authState),
            _drawerMenuItems(userViewModel, mixin)
          ]));

  static Widget _headerWidgets(AuthState authState) =>
      SettingsDrawerBuildWidgets.headerWidget(authState.userModel!);

  static Widget _drawerMenuItems(
          UserViewModel userViewModel, UserSettingsMixin mixin) =>
      SettingsDrawerBuildWidgets.drawerMenuListBuilder(
          userViewModel.settingIndex,
          drawerItems: mixin.drawerItems,
          drawerRouteSelectionOnTap: (index) =>
              mixin.drawerRouteSelectionOnTap(index));

  static Widget _closedDrawer(
          UserViewModel userViewModel, UserSettingsMixin mixin) =>
      Drawer(
          backgroundColor: scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(),
          width: mixin.mobileDrawerSize,
          child: ListView(children: [
            SizedBox(height: defaultSize * 1.5),
            _closedDrawerIconList(userViewModel, mixin)
          ]));

  static Widget _closedDrawerIconList(
          UserViewModel userViewModel, UserSettingsMixin mixin) =>
      SettingsDrawerBuildWidgets.closedDrawerIconListGenerator(
          userViewModel.settingIndex,
          drawerItems: mixin.drawerItems,
          drawerRouteSelectionOnTap: (int index) =>
              mixin.drawerRouteSelectionOnTap(index));
}


