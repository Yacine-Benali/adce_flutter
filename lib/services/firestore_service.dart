import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hello_world/services/database.dart';

class FirestoreService implements Database {
  @override
  Future<dynamic> uploadFile({
    @required String path,
    @required File file,
  }) async {
    Reference storageReference = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = storageReference.putFile(file);
    TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {});
    print("upload done ");
    String result = await storageTaskSnapshot.ref.getDownloadURL();
    print('uploadUrl $result');
    return result;
  }

  @override
  Future<void> setData({
    @required String path,
    @required Map<String, dynamic> data,
    @required bool merge,
  }) async {
    final DocumentReference dcumentReference =
        FirebaseFirestore.instance.doc(path);
    print('set $path: $data');
    await dcumentReference.set(data, SetOptions(merge: merge));
  }

  Future<void> addDocument({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    print('created ${collectionReference.path}: $data');
    await collectionReference.add(data);
  }

  @override
  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
    Query queryBuilder(Query query),
  }) {
    // refrence te3 collection 9bal ma ne applicou query
    Query refrenceTe3Collection = FirebaseFirestore.instance.collection(path);

    // nevirifou la kayan query wala makanch
    if (queryBuilder != null) {
      // tsma fiha
      refrenceTe3Collection = queryBuilder(refrenceTe3Collection);
    }

    // njibou les documents mel collections
    final Stream<QuerySnapshot> streamTe3LesDocuments =
        refrenceTe3Collection.snapshots();

    return streamTe3LesDocuments.map((chaqueVagueTe3LesDocument) {
      final List<T> listTe3LesObjet = chaqueVagueTe3LesDocument.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .toList();

      return listTe3LesObjet;
    });
  }

  @override
  Stream<T> documentStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
  }) {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> streamte3DocumentWahad =
        reference.snapshots();
    return streamte3DocumentWahad.map(
      (documentLiRahFayat) {
        return builder(documentLiRahFayat.data(), documentLiRahFayat.id);
      },
    );
  }
}
