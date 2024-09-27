import 'package:new_weedus/export.dart';

class UploadProfileImageViewModel extends ChangeNotifier {
  final picker = ImagePicker();
  bool loading = false;
  bool _openBottomSheet = false;
  File? mediaUrl;

  // Post image bottom sheet
  bool get openBottomSheet => _openBottomSheet;

  setBottomSheet(bool val) {
    _openBottomSheet = val;
    notifyListeners();
  }

  changeBottomSheetStatus() {
    _openBottomSheet = !_openBottomSheet;
    notifyListeners();
  }

  clearMediaUrl() {
    mediaUrl = null;
    notifyListeners();
  }

  pickImage({bool camera = false, BuildContext? context}) async {
    loading = true;
    _openBottomSheet = false;
    notifyListeners();
    try {
      XFile? pickedFile = await picker.pickImage(
          source: camera ? ImageSource.camera : ImageSource.gallery);
      CroppedFile? croppedFile = await ImageCropper()
          .cropImage(sourcePath: pickedFile!.path, uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: nero,
          toolbarWidgetColor: effectsBoxColor,
          activeControlsWidgetColor: appColor,
          dimmedLayerColor: nero.withOpacity(0.3),
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(minimumAspectRatio: 1.0)
      ]);
      mediaUrl = File(croppedFile!.path);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      cprint(e.toString());
      notifyListeners();
      AppViewWidgets.customSnackBar(context!, 'Cancelled');
      //showInSnackBar('Cancelled', context);
    }
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: nero,
        content: _SnackBarContent._snackBarContent(value)));
  }
}

class _SnackBarContent {
  static final double _fontSize = 16;

  static Row _snackBarContent(String value) => Row(children: [
        Icon(Icons.cancel_outlined, color: scaffoldBackgroundColor),
        SizedBox(width: defaultSize),
        Expanded(
            child: AppViewWidgets.textMontserrat(value,
                fontSize: _fontSize, color: scaffoldBackgroundColor))
      ]);
}
