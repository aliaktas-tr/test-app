import 'package:new_weedus/export.dart';

class _MonogramDialogConstants {
  _MonogramDialogConstants._();

  static String _aChapterTitle = 'A NEW CHAPTER IN CANNABIS.';
  static double _aChapterFontSize = 40.0;
  static const _monoSubTitle =
      'Monogram marks a new chapter in cannabis defined by dignity, care and consistency. It is a collective effort to bring you the best, and a humble pursuit to discover what the best truly means.';
  static final double _monoSubFontSize = 24;
  static const String _flavorTitle = 'FLAVORS';
  static final double _flavorTitleFontSize = 28;
  static const String _flavorDesc =
      'Monogram\'s team has worked diligently over the last 20 months to curate a proprietary family of strains featuring a flavor profile for every smoker - from berry to mint, sweet citrus or pine.';
  static final double _flavorDescFontSize = 18;
  static const String _experienceTitle = 'EXPERIENCE';
  static const String _experienceDesc =
      'Rather than simply define our product by percentages, MONOGRAM experts sample every strain to fully understand the effects of its distinctive mix of properties - from cannabinoids to terpenes. The resulting sensory experience is then designated as either light, medium or heavy.';
  static const String _monogramMainImagePath = 'assets/monogram/mona_main.jpg';
  static const String _monogramSubImagePath = 'assets/monogram/mono_sub.jpg';
  static const String _smokeBackgroundPath = 'assets/app/smoke_background.png';
  static const String _buttonTitle = 'Buy Now >>';
  static final double _monogramProductCardWidth = 200.0;
  static final double _monogramProductCardHeight = 250.0;
  static final double _monoTypeCardWidth = 200.0;
  static final double _monoTypeCardHeight = 400.0;
  static const double _elevation = 0.0;
  static const double _buttonHeight = 36.0;
  static final double _desktopSize = 1000.0;
  static final double _desktopImageSize = 900.0;
  static final double _desktopTextSize = 700.0;
  static final double _tabletImageSize = 450.0;
  static final double _paddingValue = 40.0;
  static final List<BoxShadow> _boxShadow = [
    BoxShadow(
        color: nero, spreadRadius: 1, blurRadius: 5, offset: Offset(1, 2)),
  ];
  static List<String> _titleList = ['Nº01', 'Nº03', 'Nº08', 'Nº96'];
  static List<String> _descTitleList = ['No. 01', 'No. 03', 'No. 08', 'No. 96'];
  static List<String> _descList = [
    'A complex blend of tropical fruit with a skunky finish. A smooth high allowing you to move throughout your day.',
    'A strong citrus headbanger that hits hard and may slow you down.',
    'A cool mellow smoke with strong diesel and earthy notes. You’ll be living on a high while still getting things done.',
    'A sweet citrus and pine blend that is a vibe.'
  ];
  static List<String> _typeTitleList = ['LIGHT', 'MEDIUM', 'HEAVY'];
  static List<String> _typeDescList = [
    'Keep your feet on the ground and your head in the clouds.',
    'Not too heavy. Not too light. Hits just right.',
    'When you need a serious high, this is the one.'
  ];
  static List<String> _typeImageList = [
    'assets/monogram/light.jpg',
    'assets/monogram/medium.jpg',
    'assets/monogram/heavy.jpg'
  ];

  static double _getTextSize(BuildContext context) =>
      context.width <= _desktopSize ? _tabletImageSize : _desktopTextSize;

  static double _getImageSize(BuildContext context) =>
      context.width <= _desktopSize ? _tabletImageSize : _desktopImageSize;
  static EdgeInsetsGeometry _scrollPadding = EdgeInsets.only(right: 10);
}

class MonogramDialogWidgets {
  static Widget buildDialog(BuildContext context,
          {ScrollController? horizontalScrollController,
          ScrollController? verticalScrollController}) =>
      Container(
          padding: context.width <= _MonogramDialogConstants._desktopSize
              ? EdgeInsets.all(defaultSize)
              : EdgeInsets.all(_MonogramDialogConstants._paddingValue),
           margin: EdgeInsets.symmetric(vertical: defaultSize),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultSize),
              color: scaffoldBackgroundColor),
          child: SingleChildScrollView(
              padding: _MonogramDialogConstants._scrollPadding,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Column(children: [
                    SizedBox(
                        width: _MonogramDialogConstants._getTextSize(context),
                        child: _aChapterText),
                    _buildHeightSizedBox,
                    _monoMainImage(
                        width: _MonogramDialogConstants._getImageSize(context)),
                    SizedBox(
                        width: _MonogramDialogConstants._getTextSize(context),
                        child: _monogramSubTitle),
                    _buildDoubleHeightSizedBox,
                    _flavorText,
                    _buildQuarterHeightSizedBox,
                    SizedBox(
                        width: _MonogramDialogConstants._getTextSize(context),
                        child: _flavorDescText),
                    _buildQuarterHeightSizedBox,
                    SizedBox(
                        width: _MonogramDialogConstants._getImageSize(context),
                        child: _monoProductsListBuilder),
                    _buildDoubleHeightSizedBox,
                    _monoSubImage(
                        width: _MonogramDialogConstants._getImageSize(context)),
                    _buildDoubleHeightSizedBox,
                    _experienceText,
                    _buildQuarterHeightSizedBox,
                    SizedBox(
                        width: _MonogramDialogConstants._getTextSize(context),
                        child: _experienceDescText),
                    _buildQuarterHeightSizedBox,
                    SizedBox(
                        width: _MonogramDialogConstants._getImageSize(context),
                        child: _monoTypeListBuilder),
                    _button
                  ])
                ])
              ])));

  static SizedBox get _buildQuarterHeightSizedBox =>
      SizedBox(height: quarterDefaultSize);

  static SizedBox get _buildDoubleHeightSizedBox =>
      SizedBox(height:  doubleDefaultSize);

  static SizedBox get _buildHeightSizedBox => SizedBox(height: defaultSize);

  static Widget get _aChapterText =>
      _textWidget(_MonogramDialogConstants._aChapterTitle,
          textAlign: TextAlign.center,
          fontSize: _MonogramDialogConstants._aChapterFontSize,
          fontWeight: FontWeight.bold);

  static ClipRRect _monoMainImage({double? width}) => ClipRRect(
      borderRadius: BorderRadius.circular(defaultSize),
      child: Image.asset(_MonogramDialogConstants._monogramMainImagePath,
          width: width));

  static Widget _monoSubImage({double? width}) => ClipRRect(
      borderRadius: BorderRadius.circular(defaultSize),
      child: Image.asset(_MonogramDialogConstants._monogramSubImagePath,
          width: width));

  static Widget get _monogramSubTitle =>
      _textWidget(_MonogramDialogConstants._monoSubTitle,
          textAlign: TextAlign.center,
          fontSize: _MonogramDialogConstants._monoSubFontSize);

  static Widget get _flavorText =>
      _textWidget(_MonogramDialogConstants._flavorTitle,
          textAlign: TextAlign.center,
          fontSize: _MonogramDialogConstants._flavorTitleFontSize,
          fontWeight: FontWeight.bold);

  static Widget get _flavorDescText =>
      _textWidget(_MonogramDialogConstants._flavorDesc.toLowerCase(),
          textAlign: TextAlign.center,
          fontSize: _MonogramDialogConstants._flavorDescFontSize);

  static Widget get _experienceText =>
      _textWidget(_MonogramDialogConstants._experienceTitle,
          textAlign: TextAlign.center,
          fontSize: _MonogramDialogConstants._flavorTitleFontSize,
          fontWeight: FontWeight.bold);

  static Widget get _experienceDescText =>
      _textWidget(_MonogramDialogConstants._experienceDesc,
          textAlign: TextAlign.center,
          fontSize: _MonogramDialogConstants._flavorDescFontSize);

  static Widget get _button => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDoubleHeightSizedBox,
            _buttonWidget(),
            _buildDoubleHeightSizedBox
          ]);

  static _textWidget(String title,
          {double? fontSize,
          Color? color,
          FontWeight? fontWeight,
          TextAlign? textAlign}) =>
      Text(title,
          textAlign: textAlign,
          style: GoogleFonts.aboreto(
              fontSize: fontSize, color: color, fontWeight: fontWeight));

  static get _monoProductsListBuilder => ResponsiveGridList(
      desiredItemWidth: _MonogramDialogConstants._monogramProductCardWidth,
      shrinkWrap: true,
      rowMainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          _MonogramDialogConstants._titleList.length,
          (index) => _monoProductsCard(
              title: _MonogramDialogConstants._titleList[index],
              desc: _MonogramDialogConstants._descList[index],
              descTitle: _MonogramDialogConstants._descTitleList[index])));

  static get _monoTypeListBuilder => ResponsiveGridList(
      desiredItemWidth: _MonogramDialogConstants._monogramProductCardHeight,
      shrinkWrap: true,
      rowMainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          _MonogramDialogConstants._typeImageList.length,
          (index) => _typeCard(
              title: _MonogramDialogConstants._typeTitleList[index],
              desc: _MonogramDialogConstants._typeDescList[index],
              path: _MonogramDialogConstants._typeImageList[index])));

  static Widget _monoProductsCard(
          {String? title, String? desc, String? descTitle}) =>
      Card(
          elevation: _MonogramDialogConstants._elevation,
          child: Container(
              padding: EdgeInsets.all(defaultSize),
              width: _MonogramDialogConstants._monogramProductCardWidth,
              height: _MonogramDialogConstants._monogramProductCardHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          _MonogramDialogConstants._smokeBackgroundPath),
                      fit: BoxFit.fill)),
              child: Column(children: [
                AppViewWidgets.textMontserrat('$title: ',
                    color: Colors.white,
                    fontSize: _MonogramDialogConstants._monoSubFontSize),
                AppViewWidgets.appDivider(),
                AppViewWidgets.textMontserrat(desc!, color: Colors.white)
              ])));

  static Widget _typeCard({String? title, String? path, String? desc}) => Card(
      color: nero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
          width: _MonogramDialogConstants._monoTypeCardWidth,
          height: _MonogramDialogConstants._monoTypeCardHeight,
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: Image.asset(path!,
                      fit: BoxFit.cover,
                      height:
                          _MonogramDialogConstants._monogramProductCardHeight))
            ]),
            _buildQuarterHeightSizedBox,
            AppViewWidgets.textMontserrat(title,
                decoration: TextDecoration.underline,
                fontSize: _MonogramDialogConstants._monoSubFontSize,
                color: scaffoldBackgroundColor,
                decorationColor: scaffoldBackgroundColor),
            _buildHeightSizedBox,
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: halfDefaultSize),
                child: AppViewWidgets.textMontserrat(desc!,
                    color: scaffoldBackgroundColor))
          ])));

  static Widget _buttonWidget() => InkWell(
      borderRadius: BorderRadius.all(Radius.circular(defaultSize)),
      onTap: () {},
      child: Container(
          height: _MonogramDialogConstants._buttonHeight,
          padding: EdgeInsets.symmetric(horizontal: defaultSize),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(defaultSize)),
              color: appColor,
              boxShadow: _MonogramDialogConstants._boxShadow),
          child: Center(
              child: Text(_MonogramDialogConstants._buttonTitle,
                  style: GoogleFonts.michroma(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center))));

  static Widget _closeButton(BuildContext context) => InkWell(
      borderRadius: BorderRadius.all(Radius.circular(defaultSize)),
      onTap: () => context.pop(),
      child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(defaultSize)),
              shape: BoxShape.circle,
              color: appColor,
              boxShadow: [
                BoxShadow(
                    color: nero,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 2))
              ]),
          child: Icon(Icons.close, color: nero)));
}

/*      Container(
          constraints: BoxConstraints(
              maxHeight: context.height * 0.8,
              minHeight: context.height * 0.5,
              maxWidth: context.width <= 1280
                  ? context.width -  doubleDefaultSize
                  : context.width * 0.75),
          alignment: Alignment.center,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultSize),
              color: Colors.white),
          child: context.width <= 1280
              ? _mobileAndTabletView(context,
                  verticalScrollController: verticalScrollController)
              : _desktopView(context,
                  verticalScrollController: verticalScrollController,
                  horizontalScrollController: horizontalScrollController));*/

/*  static SingleChildScrollView _mobileAndTabletView(BuildContext context,
          {ScrollController? verticalScrollController}) =>
      SingleChildScrollView(
        controller: verticalScrollController,
        child: Column(
          children: [
            _aChapterText,
            buildHeightSizedBox,
            _monoMainImage(width: _MonogramDialogConstants._tabletImageSize),
            _monogramSubTitle,
            buildDoubleHeightSizedBox,
            _flavorText,
            buildQuarterHeightSizedBox,
            _flavorDescText,
            buildDoubleHeightSizedBox,
            SizedBox(
                width: context.width * 0.8, child: _monoProductsListBuilder),
            buildDoubleHeightSizedBox,
            _monoSubImage(width: _MonogramDialogConstants._tabletImageSize),
            buildDoubleHeightSizedBox,
            _experienceText,
            buildQuarterHeightSizedBox,
            _experienceDescText,
            buildDoubleHeightSizedBox,
            SizedBox(width: context.width * 0.8, child: _monoTypeListBuilder),
            _button,
          ],
        ),
      );

  static Scrollbar _desktopView(BuildContext context,
          {ScrollController? horizontalScrollController,
          ScrollController? verticalScrollController}) =>
      Scrollbar(
        controller: horizontalScrollController,
        thumbVisibility: true,
        child: Scrollbar(
          controller: verticalScrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              controller: verticalScrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  _aChapterText,
                                  buildDoubleHeightSizedBox,
                                  _monoMainImage(
                                      width: _MonogramDialogConstants
                                          ._desktopImageSize),
                                  SizedBox(height: context.height * 0.025),
                                  SizedBox(
                                      width: context.width * 0.4,
                                      child: _monogramSubTitle),
                                  buildDoubleHeightSizedBox,
                                  SizedBox(
                                      width: context.width * 0.5,
                                      child: _flavorText),
                                  buildQuarterHeightSizedBox,
                                  SizedBox(
                                      width: context.width * 0.35,
                                      child: _flavorDescText),
                                  buildDoubleHeightSizedBox,
                                  SizedBox(
                                      width: context.width * 0.5,
                                      child: _monoProductsListBuilder),
                                  buildDoubleHeightSizedBox,
                                  _monoSubImage(
                                      width: _MonogramDialogConstants
                                          ._desktopImageSize),
                                  buildDoubleHeightSizedBox,
                                  SizedBox(
                                      width: context.width * 0.5,
                                      child: _experienceText),
                                  buildQuarterHeightSizedBox,
                                  SizedBox(
                                      width: context.width * 0.35,
                                      child: _experienceDescText),
                                  buildDoubleHeightSizedBox,
                                  SizedBox(
                                      width: context.width * 0.5,
                                      child: _monoTypeListBuilder),
                                  _button,
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );*/
