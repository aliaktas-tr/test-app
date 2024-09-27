import 'package:new_weedus/export.dart';

class StiiizyView extends StatefulWidget {
  const StiiizyView({super.key});

  @override
  State<StiiizyView> createState() => _StiiizyViewState();
}

class _StiiizyViewState extends State<StiiizyView> {
  @override
  Widget build(BuildContext context) {
    return StiiizyBuildWidgets.buildWidget(context);
  }
}


