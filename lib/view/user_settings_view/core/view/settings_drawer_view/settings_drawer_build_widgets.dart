import 'package:new_weedus/export.dart';

class SettingsDrawerBuildWidgets {
  static final double _dropDownMenuFontSize = defaultSize;

  static final EdgeInsetsGeometry? _iconContainerPadding =
  EdgeInsets.all(halfDefaultSize);
  static final String _icon = 'icon';
  static final String _name = 'name';

  static ListView drawerMenuListBuilder(
      int currentIndex, {
        List? drawerItems,
        Function(int)? drawerRouteSelectionOnTap,
      }) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: drawerItems!.length,
        itemBuilder: (BuildContext context, int index) {
          Map item = drawerItems[index];
          return index == 4
              ? SizedBox.shrink()
              : AppViewWidgets.customInkWell(
              child: _drawerMenuListWidget(item, index, currentIndex),
              onTap: () => drawerRouteSelectionOnTap!(index));
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 0);
        });
  }

  static Container _drawerMenuListWidget(
      Map<dynamic, dynamic> item, int index, int currentIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultSize),
      padding: EdgeInsets.all(defaultSize),
      decoration: currentIndex == index ? _drawerMenuDecoration : null,
      child: _drawerMenuIconAndTitle(item, index, currentIndex),
    );
  }

  static BoxDecoration get _drawerMenuDecoration =>
      BoxDecoration(color: appColor);

  static Row _drawerMenuIconAndTitle(
      Map<dynamic, dynamic> item, int index, int currentIndex) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(item[_icon],
            color: currentIndex == index ? nero : effectsTextColor),
        SizedBox(width: halfDefaultSize),
        AppViewWidgets.textMontserrat(item[_name],
            color: currentIndex == index ? nero : effectsTextColor,
            fontSize: _dropDownMenuFontSize,
            fontWeight:
            currentIndex == index ? FontWeight.w500 : FontWeight.w400)
      ],
    );
  }

  static ListView closedDrawerIconListGenerator(int currentIndex,
      {List? drawerItems, Function(int)? drawerRouteSelectionOnTap}) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: drawerItems!.length,
      itemBuilder: (BuildContext context, int index) {
        Map item = drawerItems[index];
        return index == 4
            ? SizedBox.shrink()
            : AppViewWidgets.customInkWell(
            onTap: () => drawerRouteSelectionOnTap!(index),
            child: Column(
              children: [
                iconContainer(currentIndex, index, item),
              ],
            ));
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 2.5);
      },
    );
  }

  static Container iconContainer(
      int currentIndex, int index, Map<dynamic, dynamic> item) {
    return Container(
        padding: _iconContainerPadding,
        decoration: currentIndex == index ? _boxDecoration : null,
        child: Icon(item[_icon],
            color: currentIndex == index ? nero : effectsTextColor));
  }

  static BoxDecoration get _boxDecoration => BoxDecoration(color: appColor);

  static Widget headerWidget(UserModel model) => Padding(
      padding: EdgeInsets.only(
        top: defaultSize,
      ),
      child: Column(children: [
        AppViewWidgets.textMontserrat(model.displayName,
            fontSize: defaultSize, fontWeight: FontWeight.w500),
        AppViewWidgets.textMontserrat(model.email,
            fontSize: 12, fontWeight: FontWeight.w600),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultSize),
          child: AppViewWidgets.appDivider(),
        )
      ]));
}