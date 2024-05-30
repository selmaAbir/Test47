// import 'dart:io';

import 'package:admin/constants/constant.dart';
import 'package:admin/models/category.dart';
import 'package:admin/models/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:admin/firebase_helper/firebase_firestore.dart';

// import'package:home/constants/constants.dart';
// import 'package:home/firebase_helper'
// import 'package:home/models/user_model/user_model.dart';


class AppProvider with ChangeNotifier {

    // Cart Work 
    List<UserModel> _userList=[];
    List<CategoryModel> _categoriesList=[];

    Future<void> getUserListFun() async {

      _userList = await FirebaseFirestoreHelper.instance.getUserList();

    }

    Future<void> getCategoriesListFun() async {

      _categoriesList = await FirebaseFirestoreHelper.instance.getCategories();

    }
    // bool isDeletingLoading = false;
    Future<void> deleteUserFromFirebase(UserModel userModel) async {
      //  isDeletingLoading = true;
        notifyListeners();
       String value = await FirebaseFirestoreHelper.instance.deleteSingleUser(userModel.id);
       if(value == "Successfuly Deleted"){
        _userList.remove(userModel);
        showMessage("Successfuly Deleted");
       }

      // isDeletingLoading = false;
       notifyListeners();

    }

    List<UserModel> get getUserList => _userList; 
    // bool get getIsDeletingLoading => isDeletingLoading;

    List<CategoryModel> get getCategoriesList => _categoriesList;

    Future<void> callBackFunction() async {
      await  getUserListFun();
      await getCategoriesListFun();
    }


void updateUserList(UserModel userModel) async {
     await FirebaseFirestoreHelper.instance.UpdateUser( userModel);
     int index =_userList.indexOf(userModel);
    _userList[index] = userModel;
    notifyListeners();
}











// bool isLoading= false;

//     void callBackFunction() async {
//        isLoading =true;





































    //  final List<ProductModel> _cartProductList =[];
    //  final List<ProductModel> _buyProductList = [];

//         UserModel? _userModel;

//         UserModel get getUserInformation => _userModel!;

//         void addCartProduct (ProductModel productModel) {

//         _cartProductList.add(productModel);

//         notifyListeners();

//         void removeCartProduct (ProductModel productModel) (

//         _cartProductList.remove(productModel);

//          notifyListeners();
// }

// void removeCartProduct (ProductModel productModel) {

// _cartProductList.remove (productModel);

// notifyListeners();

// }


// List<ProductModel> get getCartProductList => _cartProductList;


// ///// Favourite ///////

// final List<ProductModel> _favouriteProductList = [];

// void addFavourite Product (ProductModel productModel) {

// _favouriteProductList.add(productModel);

// notifyListeners();

// }

// void removeFavouriteProduct (ProductModel productModel) {

// _favouriteProductList.remove(productModel);

// notifyListeners();

// }

// List<ProductModel> get getFavouriteProductList => _favouriteProductList;


// ////// USer Information

// void getUserInfoFirebase() async {

// _userModel = await FirebaseFirestoreHelper.instance.getUserInformation( notifyListeners();

// }

// void updateUserInfoFirebase(

// BuildContext context, UserModel userModel, File? file) async {

// if (file == null) {

// // methode or class 
//   showLoaderDialog(context);

// _userModel = userModel;


// await FirebaseFirestore.instance

//     .collection("users")

//     .doc(_userModel!.id)

//     .set(_userModel!.toJson());

// Navigator.of(context, rootNavigator: true).pop();

// Navigator.of(context).pop();

// } else {

// showLoaderDialog(context);


// String imageUrl =
//  // firebase storage dependecy 
// await FirebaseStorageHelper.instance.uploadUserImage(file);

// _userModel = userModel.copyWith(image: imageUrl);

// await FirebaseFirestore.instance

// .collection("users")

// .doc(_userModel!.id)

// .set(_userModel!.toJson());

// Navigator.of(context, rootNavigator: true).pop();

// Navigator.of(context).pop();
// }

// showMessage("Successfully updated profile");


// notifyListeners();

// }

// //////// TOTAL PRICE //////// 
// ///
// double totalPrice() {

// double totalPrice = 0.0;

// for (var element in _cartProductList) {

//     totalPrice += element.price * element.qty!;
// }
// return totalPrice;

// }
// double totalPriceBuyProductList() {

// double totalPrice = 0.0;

// for (var element in _buyProductList) {

// totalPrice += element.price * element.qty!;

// }

// return totalPrice;

// }

// void updateQty (ProductModel productModel, int qty) {

// int index = _cartProductList.indexOf(productModel);

// _cartProductList[index].qty = qty;

// notifyListeners();

// }



// ////////// BUY PRODUCT 


// void addBuyProduct(ProductModel model){
//   _buyProductList.add(model);
//    notifyListeners();
// }

// void addBuyProductCartList(){
//   _buyProductList.addAll(_cartProductList);
//    notifyListeners();
// }


// void clearCart(){
//   _cartProductList.clear();
//    notifyListeners();
// }

// void clearBuyProduct(){
//   _buyProductList.clear();
//    notifyListeners();
// }

// List<ProductModel> get getBuyProductList => _buyProductList;

//++  UserModel userModel = appProvider.getUserInformation
                // .copyWith(name:textEditingController.text);

}