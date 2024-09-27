import 'package:new_weedus/export.dart';

class BankAccountViewBuildWidgets {
  static final double _desktopSize = 850;
  static final double _logoSize = 30;
  static final double _titleFontSize = 24;
  static final String _logoPath = 'assets/app/plaid_logo.svg';
  static final String _fontFamily = 'Neuropolitical';
  static final String _appTitle = 'weedusPAY';
  static final String _mainTitle =
      'Secure and simple digital payments in your pocket.';
  static final String _mainDescription =
      'Weedus Pay enables you to simply link your bank account for fast, secure and cashless payments for cannabis.';

  static final String _subQuestion = 'Why Use Weedus Pay?';
  static final String _buttonTitle = 'Learn More';
  static List<String> _reasonDescriptionList = [
    'Simple and easy setup',
    'Pay online or in-store',
    'Quicker checkouts'
  ];
  static final EdgeInsetsGeometry _buttonPadding =
      EdgeInsets.fromLTRB(0, 80, 0, 0);

  static Column buildWidget(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleWidget(context),
          SizedBox(height: 34),
          _plaidPayment()
        ],
      );

  static Widget _titleWidget(BuildContext context) =>
      context.width <= _desktopSize
          ? Column(children: _titleAndPlaidLogo)
          : Row(children: _titleAndPlaidLogo);

  static SizedBox get _widthSizedBox => const SizedBox(width: defaultSize);

  static List<Widget> _titleAndPlaidLogo = [
    _appPayTitle,
    _widthSizedBox,
    SvgPicture.asset(_logoPath, height: _logoSize),
  ];

  static Text get _appPayTitle => Text(_appTitle,
      style: TextStyle(
          fontFamily: _fontFamily, fontSize: _logoSize, color: appColor));

  static Widget _plaidPayment() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppViewWidgets.textMontserrat(_mainTitle,
              fontWeight: FontWeight.w600, fontSize: _titleFontSize),
          SizedBox(height: defaultSize),
          AppViewWidgets.textMontserrat(_mainDescription),
          SizedBox(height: doubleDefaultSize),
          AppViewWidgets.textMontserrat(_subQuestion,
              fontSize: defaultSize, fontWeight: FontWeight.w600),
          SizedBox(height: halfDefaultSize),
          ...List.generate(
              _reasonDescriptionList.length,
              (index) => Row(children: [
                    Icon(Icons.check, color: nero),
                    SizedBox(width: halfDefaultSize),
                    AppViewWidgets.textMontserrat(_reasonDescriptionList[index],
                        fontSize: defaultSize)
                  ])),
          Padding(
            padding: _buttonPadding,
            child: CustomTextButton(
                overlayColor: WidgetStateProperty.all(appColor),
                hoveredColor: nero,
                borderRadius: BorderRadius.circular(doubleDefaultSize),
                padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                    EdgeInsets.symmetric(horizontal: doubleDefaultSize)),
                child: AppViewWidgets.textMontserrat(_buttonTitle,
                    fontSize: defaultSize),
                onTap: () {}),
          ),
        ],
      );
}
