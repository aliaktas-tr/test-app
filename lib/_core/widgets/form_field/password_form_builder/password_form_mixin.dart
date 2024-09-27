import 'package:new_weedus/export.dart';

mixin PasswordFormBuilderMixin on State<PasswordFormBuilder> {
  String? _error;
  bool _obscureText = true;

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

  void suffixOnTap () => setState(() => _obscureText = !_obscureText);




  String get error => _error ?? '';
  bool get obscureText => _obscureText;
}
