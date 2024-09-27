import 'package:new_weedus/export.dart';

mixin TextFormBuilderMixin on State<TextFormBuilder> {
  String? _error;

  void onChanged(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val);
  }

  void onSaved(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val!);
  }

  void onFieldSubmitted(String term) {
    if (widget.nextFocusNode != null) {
      widget.focusNode!.unfocus();
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    } else {
      widget.submitAction!();
    }
  }

  String get error => _error ?? '';
}
mixin ResetPassTextFormBuilderMixin on State<ResetPassTextFormBuilder> {
  String? _error;
  final Color _errorColor = Color(0xffFAA0A0);

  void onChanged(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val);
  }

  void onSaved(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val!);
  }

  void onFieldSubmitted(String term) {
    if (widget.nextFocusNode != null) {
      widget.focusNode!.unfocus();
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    }
  }

  String get error => _error ?? '';

  Color get errorColor => _errorColor;
}
