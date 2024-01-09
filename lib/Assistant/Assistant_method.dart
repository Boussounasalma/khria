import 'package:firebase_database/firebase_database.dart';
import 'package:projetv2/global/golobal.dart';
import 'package:projetv2/model/user_model.dart';

class AssistandMethode{
 static void readCurrentOnlineUserInfo() async{

   currentUser = firebaseAuth.currentUser;
   DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);

   userRef.once().then((snap){
     if(snap.snapshot.value != null){
       userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
     }

   });
 }


}