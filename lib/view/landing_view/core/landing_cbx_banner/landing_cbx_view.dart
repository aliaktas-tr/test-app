import 'package:new_weedus/export.dart';

class CbxView extends StatefulWidget {
  const CbxView({super.key});

  @override
  State<CbxView> createState() => _CbxViewState();
}

class _CbxViewState extends State<CbxView> {
  @override
  Widget build(BuildContext context) {
    return CbxBuildWidgets.buildWidget(context);
  }
}
