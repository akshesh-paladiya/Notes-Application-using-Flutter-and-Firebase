import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DataBaseServices{
  static Future<void> addData(String title, String detail) async{
    firebaseFirestore
    .collection('notes')
        .add({"title":title, "detail":detail})
        .whenComplete(() => print('Add Successfully'))
        .catchError((e){
          print(e.toString());
    });
}

static Future<void> delete(String id) async{
    await firebaseFirestore.collection('notes').doc(id).delete();
}

  static Future<void> updateData(String id, String title,String detail) async{
    await firebaseFirestore.collection('notes').doc(id).update({
      "title":title, "detail":detail
    });

  }
}