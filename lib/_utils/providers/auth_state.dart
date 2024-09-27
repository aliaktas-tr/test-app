import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:new_weedus/export.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_database/firebase_database.dart' as database;
import 'package:google_sign_in_web/google_sign_in_web.dart';

///
/*
class AuthState extends AppState {
  String serverToken = "<FCM SERVER KEY>";
  bool isBusyT = false;
  var uuid = Uuid();
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  bool isSignInWithGoogle = false;
  User? user;
  String? userID;
  String? verificationId;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  final kAnalytics = FirebaseAnalytics.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference kDatabase = FirebaseDatabase.instance.ref();
  FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  database.Query? _profileQuery;
  List<UserModel?>? _profileUserModelList;
  UserModel? _userModel;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  UserModel? get userModel => _userModel;

  UserModel? get profileUserModel {
    if (_profileUserModelList != null && _profileUserModelList!.length > 0) {
      return _profileUserModelList!.last;
    } else {
      return null;
    }
  }

  void removeLastUser() {
    _profileUserModelList!.removeLast();
  }

  void logoutCallback() {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    userID = '';
    _userModel = null;
    user = null;
    _profileUserModelList = null;
    _firebaseAuth.signOut();
    // _googleSignIn.signOut();

    notifyListeners();
  }

  databaseInit() {
    try {
      if (_profileQuery == null) {
        _profileQuery = kDatabase.child("profile").child(user!.uid);
        _profileQuery!.onValue.listen(_onProfileChanged);
      }
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        cprint(error.code, errorIn: 'AuthStateDatabaseInit');
      }
    }
  }

  Stream<DatabaseEvent> listenUser() {
    return kDatabase.child('profile').child(user!.uid).onValue;
  }

  Future<String?> signUp(BuildContext context, UserModel userModel,
      GlobalKey<ScaffoldState>? scaffoldKey,
      {required String password}) async {
    try {
      loading = true;
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email!, password: password);

      user = result.user;
      authStatus = AuthStatus.LOGGED_IN;
      kAnalytics.logSignUp(signUpMethod: 'register');
      result.user!.updateDisplayName(userModel.displayName);
      result.user!.updatePhotoURL(userModel.profileImage);

      _userModel = userModel;
      _userModel!.key = user!.uid;
      _userModel!.userID = user!.uid;
      createUser(_userModel!, newUser: true);
      return user!.uid;
    } on FirebaseAuthException catch (error) {
      loading = false;
      if (kDebugMode) {
        cprint(error, errorIn: 'signUp');
        cprint('Failed with error code: ${error.code}');
      }
      if (error.code == 'emaıl-already-ın-use') {
        AppViewWidgets.customSnackBar(context, 'emaıl-already-ın-use');
      }
      if (error.code == 'weak-password') {
        AppViewWidgets.customSnackBar(context, 'weak-password');
      }
      if (error.code == 'user-disabled') {
        AppViewWidgets.customSnackBar(context, 'user-disabled');
      }

      return null;
    }
  }

  Future<String?> signIn(BuildContext context, String email, String password,
      {GlobalKey<ScaffoldState>? scaffoldKey}) async {
    try {
      loading = true;
      var result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      userID = user!.uid;
      return user!.uid;
    } on FirebaseAuthException catch (error) {
      loading = false;
      if (kDebugMode) {
        cprint(error, errorIn: 'signIn');
        cprint('Failed with error code: ${error.code}');
      }
      kAnalytics.logLogin(loginMethod: 'email_login');
      if (error.code == 'invalid-email') {
        AppViewWidgets.customSnackBar(context, 'invalid-email');
      }
      if (error.code == 'user-not-found') {
        AppViewWidgets.customSnackBar(context, 'user-not-found');
      }
      if (error.code == 'user-disabled') {
        AppViewWidgets.customSnackBar(context, 'user-disabled');
      }
      if (error.code == 'wrong-password') {
        AppViewWidgets.customSnackBar(context, 'wrong-password');
      }
      if (error.code == 'too-many-requests') {
        AppViewWidgets.customSnackBar(context, 'too-many-requests');
      }

      return null;
    }
  }

  Future<User?> handleGoogleSignIn() async {
    try {
      kAnalytics.logLogin(loginMethod: 'google_login');
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google login cancelled by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      user = (await _firebaseAuth.signInWithCredential(credential)).user;
      authStatus = AuthStatus.LOGGED_IN;

      userID = user!.uid;
      isSignInWithGoogle = true;
      createUserFromGoogleSignIn(user!);
      notifyListeners();
      return user;
    } on PlatformException catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      if (kDebugMode) {
        cprint(error, errorIn: 'handleGoogleSignIn');
      }
      return null;
    } on Exception catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      if (kDebugMode) {
        cprint(error, errorIn: 'handleGoogleSignIn');
      }
      return null;
    } catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      if (kDebugMode) {
        cprint(error, errorIn: 'handleGoogleSignIn');
      }
      return null;
    }
  }

  createUserFromGoogleSignIn(User? user) {
    var diff = DateTime.now().difference(user!.metadata.creationTime!);
    if (diff < Duration(seconds: 15)) {
      UserModel model = UserModel(
          dob: DateTime(1950, DateTime.now().month, DateTime.now().day + 3)
              .toString(),
          location: '',
          profileImage: '',
          displayName: user.displayName,
          email: user.email,
          key: user.uid,
          userID: user.uid,
          phoneNumber: user.phoneNumber,
          isUserVerified: user.emailVerified);
      createUser(model, newUser: true);
    } else {
      if (kDebugMode) {
        cprint('Last login at: ${user.metadata.lastSignInTime}');
      }
    }
  }

  void loginWithPhone(
      BuildContext? context, GlobalKey<ScaffoldState>? _scaffoldKey,
      {required String? phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(String, int?) codeSent,
      int? resendTokenF,
      bool? otpVisibility = false,
      bool? showLoading,
      bool? isTimeOut = false}) async {
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber!,
      verificationCompleted: verificationCompleted,
      verificationFailed: (FirebaseAuthException e) {
        showLoading = false;
        if (e.code == 'invalid-phone-number') {
          AppViewWidgets.customSnackBar(
              context!, 'The provided phone number is not valid.');
          if (kDebugMode) {
            cprint('invalid-phone-number', errorIn: 'loginWithPhone');
          }
        }
        if (e.code == 'invalid-verification-code') {
          AppViewWidgets.customSnackBar(context!, 'Invalid verification code');
          if (kDebugMode) {
            cprint('invalid-verification-code', errorIn: 'loginWithPhone');
          }
        }
        if (kDebugMode) {
          print('ERROR : ${e.code.toString()}');
        }
      },
      timeout: Duration(seconds: 120),
      codeSent: codeSent,
      forceResendingToken: resendTokenF,
      codeAutoRetrievalTimeout: (String verificationId) {
        notifyListeners();
      },
    );
  }

  Future<String?> vO(BuildContext? context,
      {GlobalKey<ScaffoldState>? scaffoldKey,
      UserModel? userModel,
      String? verificationID,
      required String smsCode,
      required String? phoneNumber}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID!, smsCode: smsCode);

    try {
      loading = true;
      UserCredential _authResult =
          await _firebaseAuth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo!.isNewUser) {
        user = _authResult.user;
        authStatus = AuthStatus.LOGGED_IN;
        kAnalytics.logSignUp(signUpMethod: 'register');
        _authResult.user!.updateDisplayName(userModel!.displayName);
        _authResult.user!.updatePhotoURL(userModel.profileImage);

        _userModel = userModel;
        _userModel!.key = user!.uid;
        _userModel!.userID = user!.uid;
        createUser(_userModel!, newUser: true);
        return user!.uid;
      } else {
        loading = true;
        user = _authResult.user;
        userID = user!.uid;
        authStatus = AuthStatus.LOGGED_IN;
        return user!.uid;
      }
    } on FirebaseAuthException catch (error) {
      loading = false;
      if (error.code == 'invalid-verification-code') {
        cprint("datadatadatadatadata");
        AppViewWidgets.customSnackBar(
          context!,
          'The sms verification code used to create the phone auth credential is invalid.',
        );
      }
      if (error.code == 'too-many-requests') {
        AppViewWidgets.customSnackBar(context!, 'too-many-requests');
      }
      if (kDebugMode) {
        cprint('ERROR : ${error.toString()}', errorIn: 'verifyOTP');
      }
      return null;
    }
  }

  createUser(UserModel user, {bool newUser = false}) {
/*    if (newUser) {
      user.displayName =
          Utility.getUserName(id: user.userID!, name: user.displayName!);
      kAnalytics.logEvent(name: 'create_newUser');
      user.createdAt = DateTime.now().toUtc().toString();
    }*/

    kDatabase.child('profile').child(user.userID!).set(user.toJson());
    _userModel = user;
    loading = false;
  }

  Future<User?> getCurrentUser() async {
    try {
      loading = true;
      Utility.logEvent('get_currentUSer');
      user = _firebaseAuth.currentUser;
      if (user != null) {
        authStatus = AuthStatus.LOGGED_IN;
        userID = user!.uid;
        getProfileUser();
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      loading = false;
      return user;
    } on FirebaseAuthException catch (error) {
      loading = false;
      if (kDebugMode) {
        cprint('ERROR CODE : ' + error.code.toString());
      }
      cprint(error, errorIn: 'getCurrentUser');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      if (error.code == 'permission-denied') {
        if (kDebugMode) {
          cprint(error.code.toString());
        }
      }
      return null;
    }
  }

  reloadUser() async {
    await user!.reload();
    user = _firebaseAuth.currentUser;
    if (user!.emailVerified) {
      userModel!.isUserVerified = true;
      createUser(userModel!);
      if (kDebugMode) {
        cprint('UserModel email verification complete');
      }
      Utility.logEvent('email_verification_complete',
          parameter: {userModel!.displayName: user!.email});
    }
  }

  Future<void> sendEmailVerification(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) async {
    User user = _firebaseAuth.currentUser!;
    user.sendEmailVerification().then((_) {
      Utility.logEvent('email_verification_sent',
          parameter: {userModel!.displayName: user.email});
    }).catchError((error) {
      if (kDebugMode) {
        cprint(error, errorIn: 'sendEmailVerification');
      }
      Utility.logEvent('email_verification_block',
          parameter: {userModel!.displayName: user.email});
      AppViewWidgets.customSnackBar(context, error.comment);
    });
  }

  Future<bool> emailVerified() async {
    User user = _firebaseAuth.currentUser!;
    reloadUser();
    return user.emailVerified;
  }

  Future<void> forgetPassword(BuildContext context, String email,
      {GlobalKey<ScaffoldState>? scaffoldKey}) async {
    try {
      await _firebaseAuth
          .sendPasswordResetEmail(email: email.trim())
          .then((value) {
        AppViewWidgets.customSnackBar(context,
            'Please check your email and click on the provided link to reset your password.',
            icon: Icons.info, iconColor: appColor);
        Utility.logEvent('forgot+password');
      });
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        AppViewWidgets.customSnackBar(context, 'user-not-found');
      }
      if (error.code == 'user-disabled') {
        AppViewWidgets.customSnackBar(context, 'user-disabled');
      }
      return null;
    }
  }

  Future<void> updateUserProfile(UserModel? userModel,
      {File? profileImage, File? backgroundImage}) async {
    try {
      if (profileImage == null && backgroundImage == null) {
        createUser(userModel!);

        if (_profileUserModelList != null) {
          _profileUserModelList!.last = _userModel;
        }
      } else {
        if (profileImage != null) {
          userModel!.profileImage = await _uploadFileToStorage(profileImage,
              'user/profile/${userModel.displayName}/${Path.basename(profileImage.path)}');
          var name = userModel.displayName ?? user!.displayName;
          _firebaseAuth.currentUser!.updatePhotoURL(userModel.profileImage);
          _firebaseAuth.currentUser!.updateDisplayName(name);
        }

        if (userModel != null) {
          createUser(userModel);

          /// CREATEUSER dan buraya sonradan cektik

          if (_profileUserModelList != null) {
            _profileUserModelList!.last = _userModel;
          }

          ///
        } else {
          createUser(_userModel!);

          /// CREATEUSER dan buraya sonradan cektik

          if (_profileUserModelList != null) {
            _profileUserModelList!.last = _userModel;
          }

          ///
        }
      }

      Utility.logEvent('update_user');
    } catch (error) {
      if (kDebugMode) {
        cprint(error, errorIn: 'updateUserProfile');
      }
    }
  }

  Future<String> _uploadFileToStorage(File file, path) async {
    var task = _firebaseStorage.ref().child(path);
    var status = await task.putFile(file);
    print(status.state);
    return await task.getDownloadURL();
  }

  Future<UserModel?> getEmptyHomePageUserDetail(String? userID) async {
    UserModel user;
    String userId = userID!;
    var event = await kDatabase.child('profile').child(userId).once();
    if (event.snapshot.value != null) {
      var snapshot = event.snapshot;
      var map = snapshot.value as Map<dynamic, dynamic>?;
      user = UserModel.fromJson(map!);
      user.key = snapshot.key;
      return user;
    } else {
      return null;
    }
  }

  getProfileUser({String? userProfileId}) {
    try {
      loading = true;
      if (_profileUserModelList == null) {
        _profileUserModelList = [];
      }

      userProfileId = userProfileId == null ? user!.uid : userProfileId;
      kDatabase
          .child("profile")
          .child(userProfileId)
          .once()
          .then((DatabaseEvent event) {
        var snapshot = event.snapshot;
        var map = snapshot.value as Map<dynamic, dynamic>?;
        if (snapshot.value != null) {
          if (map != null) {
            _profileUserModelList!.add(UserModel.fromJson(map));
            if (userProfileId == user!.uid) {
              _userModel = _profileUserModelList!.last;
              _userModel!.isUserVerified = user!.emailVerified;
              if (!user!.emailVerified) {
                reloadUser();
              }
              /*if (_userModel!.fcmToken == null) {
                updateFCMToken();
              }*/
            }

            Utility.logEvent('get_profile');
          }
        }
        loading = false;
      });
    } on PlatformException catch (error) {
      loading = false;
      cprint(error, errorIn: 'getProfileUser');
    }
  }

/*  void updateFCMToken() {
    if (_userModel == null) {
      return;
    }
    getProfileUser();
    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      _userModel!.fcmToken = token;
      createUser(_userModel!);
    });
  }*/

  void _onProfileChanged(DatabaseEvent event) {
    final updatedUser =
        UserModel.fromJson(event.snapshot.value as Map<dynamic, dynamic>);
    if (updatedUser.userID == user!.uid) {
      _userModel = updatedUser;
    }
    cprint('UserModel Updated');
    notifyListeners();
  }
}

 */

/*class AuthState extends ChangeNotifier {
  String serverToken = "<FCM SERVER KEY>";
  bool isBusyT = false;
  final Uuid _uuid = Uuid();
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  bool isSignInWithGoogle = false;
  User? _user;
  String? userID;
  String? verificationId;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference? _userDocRef;
  StreamSubscription? _userDocSubscription;

  final _userModelController = StreamController<UserModel?>.broadcast();

  User? get user => _user;

  Stream<UserModel?> get userModelStream => _userModelController.stream;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    _userModelController.add(value);
    notifyListeners();
  }

  AuthState() {
    getCurrentUser();
  }

  @override
  void dispose() {
    _userDocSubscription?.cancel();
    _userModelController.close();
    super.dispose();
  }

  Future<void> getCurrentUser() async {
    try {
      _user = _firebaseAuth.currentUser;
      if (_user != null) {
        authStatus = AuthStatus.LOGGED_IN;
        await _loadUserProfile();
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      notifyListeners();
    } catch (e) {
      print('getCurrentUser error: $e');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      notifyListeners();
    }
  }

  Future<void> _loadUserProfile() async {
    if (_user == null) return;

    try {
      final userDoc =
          await _firestore.collection('users').doc(_user!.uid).get();
      if (userDoc.exists) {
        userModel = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        _userDocSubscription = _firestore
            .collection('users')
            .doc(_user!.uid)
            .snapshots()
            .listen((snapshot) {
          if (snapshot.exists) {
            userModel =
                UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
          }
        });
      } else {
        userModel = null;
      }
    } catch (e) {
      print('_loadUserProfile(): $e');
      userModel = null;
    }
  }

  Future<void> signUpWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
    UserModel userModel,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      authStatus = AuthStatus.LOGGED_IN;
      await _createUserDocument(userModel);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _handleAuthException(context, e);
    }
  }

  Future<void> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      authStatus = AuthStatus.LOGGED_IN;
      await _loadUserProfile();

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _handleAuthException(context, e);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      _user = userCredential.user;
      authStatus = AuthStatus.LOGGED_IN;

      if (!(await _userDocumentExists())) {
        await _createUserDocument(UserModel(
          userID: _user!.uid,
          email: _user!.email,
          displayName: _user!.displayName,
        ));
      } else {
        await _loadUserProfile();
      }

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _handleAuthException(context, e);
    } catch (e) {
      _handleAuthException(context, e);
    }
  }

  Future<User?> handleGoogleSignIn(BuildContext context) async {
    try {
      final googleSignIn = GoogleSignIn(
          clientId:
              '613744348808-ng5llor1arbqvbmqif4oj31c5bs2ntgr.apps.googleusercontent.com',
          scopes: ['email', 'profile']);

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('handleGoogleSignIn canceled by user');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      _user = (await _firebaseAuth.signInWithCredential(credential)).user;
      authStatus = AuthStatus.LOGGED_IN;

      userID = user!.uid;
      isSignInWithGoogle = true;

      if (!(await _userDocumentExists())) {
        await _createUserDocument(UserModel(
            userID: user!.uid,
            email: user!.email,
            displayName: user!.displayName));
      } else {
        await _loadUserProfile();
      }

      notifyListeners();
      return user;
    } on FirebaseAuthException catch (error) {
      _handleAuthException(context, error);
      return null;
    } catch (error) {
      _handleAuthException(context, error);
      return null;
    }
  }

  Future<bool> _userDocumentExists() async {
    if (_user == null) return false;

    final userDoc = await _firestore.collection('users').doc(_user!.uid).get();
    return userDoc.exists;
  }

  Future<void> _createUserDocument(UserModel userModel) async {
    if (_user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(_user!.uid)
          .set(userModel.toJson());
    } catch (e) {
      print('_createUserDocument error: $e');
    }
  }

  Future<void> updateUserProfile(UserModel userModel) async {
    if (_user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(_user!.uid)
          .update(userModel.toJson());
    } catch (e) {
      print('updateUserProfile error: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      _user = null;
      _userModel = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userDocSubscription?.cancel();
      SmartDialog.dismiss(force: true);
      notifyListeners();
    } catch (e) {
      print('signOut error: $e');
    }
  }

  void _handleAuthException(BuildContext context, Object e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          // ...
          break;
        case 'user-not-found':
          // ...
          break;
        case 'wrong-password':
          // ...
          break;
        default:
        // ...
      }
    } else {
      // ...
    }
  }
}*/

class AuthState extends ChangeNotifier {
  // Firebase instances and services
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Uuid _uuid = Uuid();

  // Auth-related variables
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  User? _user;
  UserModel? _userModel;
  String? userID;
  bool isSignInWithGoogle = false;
  String serverToken = "<FCM SERVER KEY>";
  bool isBusyT = false;

  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    _userModelController.add(value);
    notifyListeners();
  }

  // Firestore-related variables
  DocumentReference? _userDocRef;
  StreamSubscription? _userDocSubscription;
  final _userModelController = StreamController<UserModel?>.broadcast();

  // Getter for the user
  User? get user => _user;

  Stream<UserModel?> get userModelStream => _userModelController.stream;

  // Constructor: Load the current user when AuthState is created
  AuthState() {
    getCurrentUser();
  }

  // Dispose resources when not needed
  @override
  void dispose() {
    _userDocSubscription?.cancel();
    _userModelController.close();
    super.dispose();
  }

  // Load the current user if they are already signed in
  Future<void> getCurrentUser() async {
    try {
      _user = _firebaseAuth.currentUser;
      if (_user != null) {
        authStatus = AuthStatus.LOGGED_IN;
        await _loadUserProfile();
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      notifyListeners();
    } catch (e) {
      print('getCurrentUser error: $e');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      notifyListeners();
    }
  }

  // Load user profile from Firestore
  Future<void> _loadUserProfile() async {
    if (_user == null) return;

    try {
      final userDoc =
          await _firestore.collection('users').doc(_user!.uid).get();
      if (userDoc.exists) {
        _userModel = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        _userModelController.add(_userModel);
        // Subscribe to document updates
        _userDocSubscription = _firestore
            .collection('users')
            .doc(_user!.uid)
            .snapshots()
            .listen((snapshot) {
          if (snapshot.exists) {
            _userModel =
                UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
            _userModelController.add(_userModel);
          }
        });
      } else {
        _userModel = null;
      }
    } catch (e) {
      print('_loadUserProfile(): $e');
      _userModel = null;
    }
    notifyListeners();
  }

  // Email & password sign-up
  Future<void> signUpWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
    UserModel userModel,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      authStatus = AuthStatus.LOGGED_IN;
      await _createUserDocument(userModel);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _handleAuthException(context, e);
    }
  }

  // Email & password sign-in
  Future<void> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      authStatus = AuthStatus.LOGGED_IN;
      await _loadUserProfile();

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _handleAuthException(context, e);
    }
  }

  // Google Sign-In with platform-specific handling
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        // Web: Use Firebase Auth's signInWithPopup for Google Sign-In
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        // Initiating Google Sign-In via a popup
        final userCredential =
            await _firebaseAuth.signInWithPopup(googleProvider);

        _user = userCredential.user;
        authStatus = AuthStatus.LOGGED_IN;

        // Load or create user profile in Firestore
        if (!(await _userDocumentExists())) {
          await _createUserDocument(UserModel(
            userID: _user!.uid,
            email: _user!.email,
            displayName: _user!.displayName,
          ));
        } else {
          await _loadUserProfile();
        }
        notifyListeners();
      } else {
        // Mobile: Use GoogleSignIn for mobile platforms
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          throw Exception('Google Sign-In was canceled by the user.');
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        _user = userCredential.user;
        authStatus = AuthStatus.LOGGED_IN;

        if (!(await _userDocumentExists())) {
          await _createUserDocument(UserModel(
            userID: _user!.uid,
            email: _user!.email,
            displayName: _user!.displayName,
          ));
        } else {
          await _loadUserProfile();
        }
        notifyListeners();
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      _handleAuthException(context, e);
    }
  }

  // Check if the user document exists in Firestore
  Future<bool> _userDocumentExists() async {
    if (_user == null) return false;

    final userDoc = await _firestore.collection('users').doc(_user!.uid).get();
    return userDoc.exists;
  }

  // Create user document in Firestore
  Future<void> _createUserDocument(UserModel userModel) async {
    if (_user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(_user!.uid)
          .set(userModel.toJson());
    } catch (e) {
      print('_createUserDocument error: $e');
    }
  }

  // Update user profile
  Future<void> updateUserProfile(UserModel userModel) async {
    if (_user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(_user!.uid)
          .update(userModel.toJson());
    } catch (e) {
      print('updateUserProfile error: $e');
    }
  }

  // Sign out the user
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      _user = null;
      _userModel = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userDocSubscription?.cancel();
      SmartDialog.dismiss(force: true);
      notifyListeners();
    } catch (e) {
      print('signOut error: $e');
    }
  }

  // Handle FirebaseAuthException and display error message
  void _handleAuthException(BuildContext context, Object e) {
    if (e is FirebaseAuthException) {
      // Handle Firebase auth exceptions
      switch (e.code) {
        case 'invalid-email':
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Invalid email')));
          break;
        case 'user-not-found':
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('User not found')));
          break;
        case 'wrong-password':
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Wrong password')));
          break;
        default:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message!)));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred')));
    }
  }
}
