import 'package:new_weedus/export.dart';

/*class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(child: buildForm( context));
  }

  buildForm(  BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          SizedBox(height: doubleDefaultSize),
          viewModel.loading
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      AppViewWidgets.textMontserrat('Wait a second',
                          fontWeight: FontWeight.bold,
                          color: nero,
                          fontSize: 30.0),
                      SizedBox(width: quarterDefaultSize),
                      AnimatedDotView(
                          animationDuration: Duration(milliseconds: 250),
                          color: nero,
                          delay: 250)
                    ])
              : AppViewWidgets.textMontserrat('Sign Up',
                  fontWeight: FontWeight.bold, color: nero, fontSize: 30.0),
          viewModel.loading
              ? SizedBox.shrink()
              : Column(
                  children: [
                    SizedBox(height: doubleDefaultSize),
                    Form(
                      key: viewModel.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextFormBuilder(
                            enabled: !viewModel.loading,
                            prefix: Ionicons.person_outline,
                            hintText: "Full Name",
                            textInputAction: TextInputAction.next,
                            validateFunction: Validations.validateName,
                            onSaved: (String val) {
                              viewModel.setName(val.capitalize());
                            },
                            focusNode: viewModel.usernameFN,
                            nextFocusNode: viewModel.emailFN,
                          ),
                          SizedBox(height: 20.0),
                          TextFormBuilder(
                            enabled: !viewModel.loading,
                            prefix: Ionicons.mail_outline,
                            hintText: "Email",
                            textInputAction: TextInputAction.next,
                            validateFunction: Validations.validateEmail,
                            onSaved: (String val) {
                              viewModel.setEmail(val);
                            },
                            focusNode: viewModel.emailFN,
                            nextFocusNode: viewModel.passFN,
                          ),
                          SizedBox(height: 20.0),
                          PasswordFormBuilder(
                            enabled: !viewModel.loading,
                            prefix: Ionicons.lock_closed_outline,
                            hintText: "Password",
                            textInputAction: TextInputAction.next,
                            validateFunction: Validations.validatePassword,
                            obscureText: true,
                            onSaved: (String val) {
                              viewModel.setPassword(val);
                            },
                            focusNode: viewModel.passFN,
                            nextFocusNode: viewModel.cPassFN,
                          ),
                          SizedBox(height: 20.0),
                          PasswordFormBuilder(
                            enabled: !viewModel.loading,
                            prefix: Ionicons.lock_open_outline,
                            hintText: "Confirm Password",
                            textInputAction: TextInputAction.done,
                            validateFunction: Validations.validatePassword,
                            submitAction: () => viewModel.register(context),
                            obscureText: true,
                            onSaved: (String val) {
                              viewModel.setConfirmPass(val);
                            },
                            focusNode: viewModel.cPassFN,
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            height: 45.0,
                            width: 180.0,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0))),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(appColor)),
                              child: AppViewWidgets.textMontserrat('SIGN UP',
                                  fontWeight: FontWeight.w600, color: nero),
                              onPressed: () {
                                viewModel.register(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          SizedBox(height: doubleDefaultSize),
        ],
      ),
    );
  }
}

class TextFormBuilder extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;
  final IconData? suffix;

  TextFormBuilder(
      {this.prefix,
      this.suffix,
      this.initialValue,
      this.enabled,
      this.hintText,
      this.textInputType,
      this.controller,
      this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChange,
      this.key});

  @override
  _TextFormBuilderState createState() => _TextFormBuilderState();
}

class _TextFormBuilderState extends State<TextFormBuilder> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: Theme.of(context).colorScheme.secondary,
            textCapitalization: TextCapitalization.sentences,
            initialValue: widget.initialValue,
            enabled: widget.enabled,
            onChanged: (val) {
              error = widget.validateFunction!(val);
              setState(() {});
              widget.onSaved!(val);
            },
            style: GoogleFonts.montserrat(),
            key: widget.key,
            controller: widget.controller,
            obscureText: widget.obscureText,
            keyboardType: widget.textInputType,
            validator: widget.validateFunction,
            onSaved: (val) {
              error = widget.validateFunction!(val);
              setState(() {});
              widget.onSaved!(val!);
            },
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onFieldSubmitted: (String term) {
              if (widget.nextFocusNode != null) {
                widget.focusNode!.unfocus();
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              } else {
                widget.submitAction!();
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.prefix,
                size: 15.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              suffixIcon: Icon(
                widget.suffix,
                size: 15.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              // fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.montserrat(color: Colors.grey[400]),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              border: border(context),
              enabledBorder: border(context),
              focusedBorder: focusBorder(context),
              errorStyle: TextStyle(height: 0.0, fontSize: 0.0),
            ),
          ),
          SizedBox(height: 5.0),
          Visibility(
            visible: error != null,
            child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: AppViewWidgets.textMontserrat('$error',
                    color: Colors.redAccent[700], fontSize: 12.0)),
          ),
        ],
      ),
    );
  }

  border(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: nero05, width: 0.3));
  }

  focusBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: appColor.darken(20), width: 1.0));
  }
}

class PasswordFormBuilder extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final bool obscureText;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;

  PasswordFormBuilder(
      {this.prefix,
      this.initialValue,
      this.enabled,
      this.hintText,
      this.textInputType,
      this.controller,
      this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChange,
      this.key});

  @override
  _PasswordFormBuilderState createState() => _PasswordFormBuilderState();
}

class _PasswordFormBuilderState extends State<PasswordFormBuilder> {
  String? error;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: Theme.of(context).colorScheme.secondary,
            initialValue: widget.initialValue,
            enabled: widget.enabled,
            onChanged: (val) {
              error = widget.validateFunction!(val);
              setState(() {});
              widget.onSaved!(val);
            },
            style: GoogleFonts.montserrat(),
            key: widget.key,
            controller: widget.controller,
            // obscureText: widget.obscureText,
            obscureText: obscureText,
            keyboardType: widget.textInputType,
            validator: widget.validateFunction,
            onSaved: (val) {
              error = widget.validateFunction!(val);
              setState(() {});
              widget.onSaved!(val!);
            },
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onFieldSubmitted: (String term) {
              if (widget.nextFocusNode != null) {
                widget.focusNode!.unfocus();
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              } else {
                widget.submitAction!();
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.prefix,
                size: 15.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() => obscureText = !obscureText);
                },
                child: Icon(
                  obscureText ? Ionicons.eye_off_outline : Ionicons.eye_outline,
                  size: 15.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              // fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.montserrat(color: Colors.grey[400]),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              border: border(context),
              enabledBorder: border(context),
              focusedBorder: focusBorder(context),
              errorBorder: errorBorder(context),
              errorStyle: TextStyle(height: 0.0, fontSize: 0.0),
            ),
          ),
          SizedBox(height: 5.0),
          Visibility(
            visible: error != null,
            child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: AppViewWidgets.textMontserrat('$error',
                    color: Colors.redAccent[700], fontSize: 12.0)),
          ),
        ],
      ),
    );
  }

  border(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: nero05, width: 0.3));
  }

  focusBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: appColor.darken(20), width: 1.0));
  }

  errorBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Colors.redAccent.darken(20), width: 1.0));
  }
}*/



