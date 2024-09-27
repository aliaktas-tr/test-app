import 'package:new_weedus/export.dart';

class _StringList {
  _StringList._();

  static const List<String>? effectSativaTitleList = [
    'Energetic',
    'Creative',
    'Happy',
    'Focused',
    'Inspired'
  ];

  static const List<String>? effectIndicaTitleList = [
    'Calm',
    'Happy',
    'Relaxed',
    'Sleepy'
  ];

  static const List<String>? effectHybridTitleList = [
    'Energetic',
    'Relaxed',
    'Happy',
    'Calm'
  ];
}

class EffectView extends StatelessWidget {
  const EffectView({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      product!.isSativa != null
          ? EffectViewWidgets.effectGrid(
              list: _StringList.effectSativaTitleList)
          : product!.isIndica != null
              ? EffectViewWidgets.effectGrid(
                  list: _StringList.effectIndicaTitleList)
              : product!.isHybrid != null
                  ? EffectViewWidgets.effectGrid(
                      list: _StringList.effectHybridTitleList)
                  : SizedBox.shrink()
    ]);
  }
}
