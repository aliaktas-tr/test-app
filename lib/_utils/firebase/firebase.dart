import 'package:firebase_database/firebase_database.dart';
import 'package:new_weedus/export.dart';

final kAnalytics = FirebaseAnalytics.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final DatabaseReference kDatabase = FirebaseDatabase.instance.ref();
FirebaseStorage storage = FirebaseStorage.instance;
final Uuid uuid = Uuid();


