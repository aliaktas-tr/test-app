import 'package:new_weedus/export.dart';

class UnderLineTextHover extends StatefulWidget {
  final VoidCallback? onTap;
  final Color? highLightColor;
  final String? title;
  final bool? isHeader;
  final bool? isUnderLineHover;
  final Color? currentColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const UnderLineTextHover(
      {Key? key,
      this.onTap,
      this.highLightColor = Colors.white,
      this.title,
      this.isHeader = false,
      this.isUnderLineHover = true,
      this.currentColor,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  State<UnderLineTextHover> createState() => _UnderLineTextHover();
}

class _UnderLineTextHover extends State<UnderLineTextHover> {
  bool _isHovered = false;
  double _fontSize = 14.0;
  double _headerFontSize = 16.0;
  double _decorationThickness = 3.0;
  Offset _shadowOffset = Offset(0, -5);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => _onEntered(true),
        onExit: (event) => _onEntered(false),
        child: widget.isUnderLineHover! ? _underLineText() : _text());
  }

  Widget _underLineText() => AppViewWidgets.customInkWell(
      onTap: widget.onTap ?? null,
      child: Text(widget.title!,
          style: GoogleFonts.michroma(
              color: Colors.transparent,
              fontSize: widget.fontSize != null
                  ? widget.fontSize
                  : widget.isHeader!
                      ? _headerFontSize
                      : _fontSize,
              fontWeight: widget.fontWeight,
              decorationColor: white9,
              shadows: [Shadow(color: white9, offset: _shadowOffset)],
              decoration: widget.isHeader!
                  ? TextDecoration.underline
                  : _isHovered
                      ? TextDecoration.underline
                      : null,
              decorationThickness: _decorationThickness)));

  Widget _text() => AppViewWidgets.customInkWell(
      onTap: widget.onTap ?? null,
      child: Text(widget.title!,
          style: GoogleFonts.michroma(
              color: widget.currentColor != null
                  ? widget.currentColor
                  : _isHovered
                      ? dirtyWhite
                      : white6,
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize ?? _fontSize)));

  void _onEntered(bool _isHovered) => setState(() {
        this._isHovered = _isHovered;
      });
}

class CardHoverWidget extends StatefulWidget {
  const CardHoverWidget({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  State<CardHoverWidget> createState() => _CardHoverWidgetState();
}

class _CardHoverWidgetState extends State<CardHoverWidget> {
  bool? _isHovered = false;
  final double _elevation = 0.0;
  final Duration _duration = Duration(milliseconds: 150);
  final List<BoxShadow>? _boxShadow = [
    BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: halfDefaultSize)
  ];

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -2.0, 0);
    final transform = _isHovered! ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
        onEnter: (event) => _onEntered(true),
        onExit: (event) => _onEntered(false),
        child: Card(
          borderOnForeground: false,
          elevation: _elevation,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultSize)),
          child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultSize),
                  boxShadow: _isHovered! ? _boxShadow : null),
              duration: _duration,
              transform: transform,
              child: widget.child!),
        ));
  }

  void _onEntered(bool _isHovered) => setState(() {
        this._isHovered = _isHovered;
      });
}

class ScrollButtonHoverWidget extends StatefulWidget {
  const ScrollButtonHoverWidget(
      {Key? key, required this.onTap, required this.icon, this.padding})
      : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final EdgeInsetsGeometry? padding;

  @override
  State<ScrollButtonHoverWidget> createState() =>
      _ScrollButtonHoverWidgetState();
}

class _ScrollButtonHoverWidgetState extends State<ScrollButtonHoverWidget> {
  bool? _isHovered = false;
  final int _darkenValue = 10;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => _onEntered(true),
        onExit: (event) => _onEntered(false),
        child: AppViewWidgets.customInkWell(
            onTap: widget.onTap,
            child: Container(
                padding: EdgeInsets.all(halfDefaultSize),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isHovered!
                        ? bgColor
                        : effectsBoxColor.darken(_darkenValue)),
                child: Center(
                    child: Padding(
                        padding: widget.padding!,
                        child: Icon(widget.icon,
                            color: scaffoldBackgroundColor))))));
  }

  void _onEntered(bool _isHovered) => setState(() {
        this._isHovered = _isHovered;
      });
}

class PriceHover extends StatefulWidget {
  const PriceHover(
      {Key? key,
      this.product,
      this.index,
      this.margin,
      this.onTap,
      this.priceSize,
      this.currentColor,
      this.hoverColor,
      this.addBorder = false})
      : super(key: key);
  final int? index;
  final Product? product;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double? priceSize;
  final Color? currentColor;
  final Color? hoverColor;
  final bool? addBorder;

  @override
  State<PriceHover> createState() => _PriceHoverState();
}

class _PriceHoverState extends State<PriceHover> {
  bool? _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => _onEntered(true),
        onExit: (event) => _onEntered(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          child: _sizeWidget(widget.product!,
              index: widget.index, margin: widget.margin),
        ));
  }

  Widget _sizeWidget(Product product,
      {int? index, EdgeInsetsGeometry? margin}) {
    return AppViewWidgets.customInkWell(
      onTap: widget.onTap!,
      child: Container(
          width: 80,
          /*
          constraints: BoxConstraints(minHeight: 45),
          padding: EdgeInsets.symmetric(vertical: quarterDefaultSize),*/
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(halfDefaultSize),
              border: widget.addBorder!
                  ? Border.all(
                      width: 1.1,
                      color: _isHovered!
                          ? widget.hoverColor ?? nero
                          : widget.currentColor ?? effectsBoxColor)
                  : null,
              color: widget.addBorder!
                  ? null
                  : _isHovered!
                      ? widget.hoverColor ?? effectsTextColor.withOpacity(0.35)
                      : widget.currentColor ?? nero),
          child: Container(
            margin: margin ?? null,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: product.sizeList != null
                    ? [
                        product.sizeList != null
                            ? AppViewWidgets.textMontserrat(
                                '${product.sizeList![index!]}g',
                                fontWeight: _isHovered!
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: _isHovered! ? nero : effectsTextColor)
                            : product.pack != null
                                ? AppViewWidgets.textMontserrat(product.pack!,
                                    color: effectsTextColor,
                                    fontWeight: FontWeight.w500)
                                : SizedBox.shrink(),
                        Center(
                            child: Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: SmallDecimalPriceText(
                                    product: product,
                                    isPriceList: true,
                                    priceSize: widget.priceSize,
                                    index: index)))
                      ]
                    : [
                        product.size != null
                            ? AppViewWidgets.textMontserrat('${product.size}g',
                                fontWeight: FontWeight.w500,
                                color: effectsTextColor)
                            : product.pack != null
                                ? AppViewWidgets.textMontserrat(product.pack!,
                                    color: effectsTextColor,
                                    fontWeight: FontWeight.w500)
                                : SizedBox.shrink(),
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: SmallDecimalPriceText(
                                product: product,
                                priceSize: widget.priceSize ?? 16,
                              )),
                        )
                      ]),
          )),
    );
  }

  void _onEntered(bool _isHovered) => setState(() {
        this._isHovered = _isHovered;
      });
}

class OnHoverWidget extends StatefulWidget {
  const OnHoverWidget({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  State<OnHoverWidget> createState() => _OnHoverWidgetState();
}

class _OnHoverWidgetState extends State<OnHoverWidget> {
  bool? _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8, 0);
    final transform = _isHovered! ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
        onEnter: (event) => _onEntered(true),
        onExit: (event) => _onEntered(false),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            transform: transform,
            child: widget.child!));
  }

  void _onEntered(bool _isHovered) => setState(() {
        this._isHovered = _isHovered;
      });
}

class AuthSignHoverButton extends StatefulWidget {
  const AuthSignHoverButton({Key? key, required this.signButtonOnTap})
      : super(key: key);
  final VoidCallback signButtonOnTap;

  @override
  State<AuthSignHoverButton> createState() => _AuthSignHoverButtonState();
}

class _AuthSignHoverButtonState extends State<AuthSignHoverButton> {
  bool _isHovered = false;
  double _buttonWidgetSize = 36.0;
  int _darkenValue = 25;
  static const Duration _duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => _onEntered(true),
        onExit: (event) => _onEntered(false),
        child: AppViewWidgets.customInkWell(
            onTap: widget.signButtonOnTap,
            child: AnimatedContainer(
                duration: _duration,
                child: Container(
                    width: _buttonWidgetSize,
                    height: _buttonWidgetSize,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isHovered ? appColor : effectsBoxColor),
                    child: Icon(Icons.arrow_forward,
                        color: _isHovered
                            ? nero
                            : effectsBoxColor.darken(_darkenValue))))));
  }

  void _onEntered(bool _isHovered) =>
      setState(() => this._isHovered = _isHovered);
}
