import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/model/user.dart';

class DatabaseService{
final String uid;

DatabaseService({this.uid});

final CollectionReference _collectionReference = Firestore().collection('chai');

Future updateUserData(String cheeni, String naam ,int strength) async{

return await _collectionReference.document(uid).setData({
  'cheeni' : cheeni,
  'naam' : naam,
  'strenght' : strength
});
}

}