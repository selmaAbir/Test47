// import 'dart:convert';
// import 'dart:html';

import 'package:admin/models/category.dart';
import 'package:admin/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:admin/constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';




class FirebaseFirestoreHelper{
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<UserModel>> getUserList() async {

   QuerySnapshot<Map<String, dynamic>> querySnapchot =
    await  _firebaseFirestore.collection("users").get();
    // lezm fromjson error trouh 
   return  querySnapchot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  }

    Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = 
      await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoriesList =querySnapshot.docs 
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

        return categoriesList;

        } catch (e) {
          showMessage(e.toString());
          return [];
        }

    }

    Future<String> deleteSingleUser(String id ) async {
       try {
         await _firebaseFirestore.collection("users").doc(id).delete();

        return "Successfuly Deleted";
       } catch (e) {
          
        return e.toString();
         
       }
    }
    Future<void> UpdateUser(UserModel userModel ) async {
       try {
         await _firebaseFirestore
         .collection("users").doc(userModel.id)
         .update(userModel.toJson());

        
       } catch (e) {}
    }

}
 

//  Future<List<ProductModel>> getCategoryViewProduct( String id) async {

//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await _firebaseFirestore
//         .collection("categories")
//         .doc(id)
//         .collection("products")
//         /// some code 
//         .collection("orders")
//         .doc();

//       DocumentReference admin = _firebaseFirestorecollection("orders").doc;
      
//       admin.set( {
//         "products": list.map((e) => e.toJson()),
//         "status":" Pending",
//         "totalPrice":  totalPrice,
//         "payment": payment,
//         "orderId": admin.id,
//       });
//       documentReference.set({
//         "products":list.map((e) => e.toJson()),
//         "status": "Pending",
//         "totalPrice" :totalPrice,
//         "payment": payement,
//         "orderId": admin.Id,
//       }); 
    
//      }
//  }

//  void updateTokenFromFirebase() async {
//    String? token = await FirebaseMessaging.instance.getToken();
//    if(token != null) {
//     await _firebaseFirestore 
//       .collection("users")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .update({
//         "notificationToken": token,
//       });
//    }
//  }


