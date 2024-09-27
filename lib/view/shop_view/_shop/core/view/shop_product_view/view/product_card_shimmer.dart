import 'package:new_weedus/export.dart';




class ShimmerHorizontalCard extends StatefulWidget {
  const ShimmerHorizontalCard({super.key, required this.productList});

  final List<Product> productList;

  @override
  State<ShimmerHorizontalCard> createState() => _ShimmerHorizontalCardState();
}

class _ShimmerHorizontalCardState extends State<ShimmerHorizontalCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: effectsBoxColor.withOpacity(0.7),
        highlightColor: effectsBoxColor.withOpacity(0.1),
        enabled: true,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                  widget.productList.length, (index) => _shimmerWidgets())),
        ));
  }

  Widget _shimmerWidgets() {
    return Column(
      children: [ContentPlaceholder(), AppViewWidgets.appDivider(color: white)],
    );
  }
}

class ShimmerVerticalCard extends StatefulWidget {
  const ShimmerVerticalCard({super.key, required this.productList});

  final List<Product> productList;

  @override
  State<ShimmerVerticalCard> createState() => _ShimmerVerticalCardState();
}

class _ShimmerVerticalCardState extends State<ShimmerVerticalCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: effectsBoxColor.withOpacity(0.7),
        highlightColor: effectsBoxColor.withOpacity(0.1),
        enabled: true,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [_shimmerWidgets()],
          ),
        ));
  }

  Widget _shimmerWidgets() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSize),
        child: ResponsiveGridList(
            shrinkWrap: true,
            minSpacing: halfDefaultSize,
            desiredItemWidth: 250,
            children: List.generate(
                widget.productList.length, (index) => _shimmerContainer())));
  }

  Widget _shimmerContainer() {
    return Container(
      width: 290,
      height: 350,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(quarterDefaultSize)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                  height: 100,
                  width: 150,
                  child: SvgPicture.asset('assets/app/leaf_small.svg',
                      colorFilter: ColorFilter.mode(white, BlendMode.srcIn))),
              SizedBox(height: defaultSize),
              Column(children: [
                ...List.generate(
                  2,
                      (index) => _container(
                      width: index == 0 ? 100 : 180,
                      height: 10,
                      margin: EdgeInsets.only(top: quarterDefaultSize)),
                )
              ]),
              SizedBox(height: defaultSize),
              AppViewWidgets.appDivider(
                  height: 0,
                  color: white,
                  indent: defaultSize,
                  endIndent: defaultSize,
                  thickness: 1.0),
              SizedBox(height: defaultSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    2,
                        (index) => _container(
                        width: 80,
                        height: 10,
                        margin:
                        EdgeInsets.symmetric(horizontal: halfDefaultSize))),
              ),
              SizedBox(height: defaultSize / 3),
              _container(width: 150, height: 10),
              SizedBox(height: defaultSize)
            ],
          ),
        ],
      ),
    );
  }
}

class ContentPlaceholder extends StatelessWidget {
  const ContentPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: doubleDefaultSize),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 96.0,
                      height: 72.0,
                      child: SvgPicture.asset('assets/app/leaf_small.svg',
                          colorFilter:
                          ColorFilter.mode(white, BlendMode.srcIn))),
                  SizedBox(height: halfDefaultSize),
                  Container(color: white, width: 96.0, height: 10)
                ],
              ),
              const SizedBox(width: defaultSize),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                      3,
                          (index) => _container(
                          margin: EdgeInsets.only(top: halfDefaultSize),
                          width: index == 2 ? 120 : 180,
                          height: 10)),
                  const SizedBox(height: defaultSize * 1.15),
                  Row(
                      children: List.generate(
                          3,
                              (index) => _container(
                              margin: EdgeInsets.only(right: defaultSize),
                              width: 70,
                              height: index == 0 ? 25 : 10))),
                  context.width <= 1080
                      ? SizedBox(height: defaultSize)
                      : SizedBox.shrink(),
                  context.width >= 1080
                      ? SizedBox.shrink()
                      : SizedBox(
                      height: 45,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              _container(width: 70, height: 45),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: halfDefaultSize),
                          itemCount: 2))
                ],
              )
            ],
          ),
          context.width <= 1080
              ? SizedBox.shrink()
              : SizedBox(
              height: 45,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      _container(width: 70, height: 45),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: halfDefaultSize),
                  itemCount: 2))
        ],
      ),
    );
  }
}

Widget _container({double? width, double? height, EdgeInsetsGeometry? margin}) {
  return Container(width: width, height: height, margin: margin, color: white);
}