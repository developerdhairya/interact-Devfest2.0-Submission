
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sawo/sawo.dart';

CollectionReference userCollection=FirebaseFirestore.instance.collection('users');
DocumentReference userDocument=userCollection.doc(FirebaseAuth.instance.currentUser!.uid);

CollectionReference messageCollection=FirebaseFirestore.instance.collection('Messages');

FirebaseStorage firebaseStorage=FirebaseStorage.instance;


// Sawo sawo=Sawo(apiKey: apiKey, secretKey: secretKey)