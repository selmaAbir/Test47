import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:admin/models/user_model.dart';
import 'package:admin/provider/app_provider.dart';

class EditProfile extends StatefulWidget {
  final UserModel userModel;
  const EditProfile({super.key, required this.userModel});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  TextEditingController nameController = TextEditingController();

  void takePicture() async {
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Center(
            child: image == null
                ? CupertinoButton(
                    onPressed: takePicture,
                    child: const CircleAvatar(
                      radius: 55,
                      child: Icon(Icons.camera_alt),
                    ),
                  )
                : CupertinoButton(
                    onPressed: takePicture,
                    child: CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 55,
                    ),
                  ),
          ),
          const SizedBox(height: 12.0),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: widget.userModel.name,
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            child: const Text("Update"),
            onPressed: () async {
              UserModel updatedUser = widget.userModel.copyWith(
                name: nameController.text.isEmpty ? null : nameController.text,
                image: image?.path,
              );

              appProvider.updateUserList(updatedUser);

              // Update user info in Firebase
              // await appProvider.updateUserInfoFirebase(context, updatedUser, image);
            },
          ),
        ],
      ),
    );
  }
}


























































// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:admin/models/user_model.dart';
// import 'package:admin/provider/app_provider.dart';

// class EditProfile extends StatefulWidget {
//   final UserModel userModel;
//   const EditProfile({super.key, required this.userModel});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   File? image;

//   void takePicture() async {
//     XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 40);
//     if (value != null) {
//       setState(() {
//         image = File(value.path);
//       });
//     }
//   }

//   TextEditingController nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     AppProvider appProvider = Provider.of<AppProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Profile",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         children: [
//           Center(
//             child: image == null
//                 ? CupertinoButton(
//                     onPressed: takePicture,
//                     child: const CircleAvatar(
//                       radius: 55,
//                       child: Icon(Icons.camera_alt),
//                     ),
//                   )
//                 : CupertinoButton(
//                     onPressed: takePicture,
//                     child: CircleAvatar(
//                       backgroundImage: FileImage(image!),
//                       radius: 55,
//                     ),
//                   ),
//           ),
//           const SizedBox(height: 12.0),
//           TextFormField(
//             controller: nameController,
//             decoration: InputDecoration(
//               hintText: widget.userModel.name,
//             ),
//           ),
//           const SizedBox(height: 24.0),
//           ElevatedButton(
//             child: const Text("Update"),
//             onPressed: () async {
//               UserModel updatedUser = widget.userModel.copyWith(
//                 name: nameController.text.isEmpty ? null : nameController.text,
//                 image: image?.path,
//               );
//               appProvider.updateUserList(userModel);
//               // Update user info in Firebase
//               // await appProvider.updateUserInfoFirebase(context, updatedUser, image);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



























































































// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import'package:admin/models/user_model.dart';
// import 'package:admin/provider/app_provider.dart';

// class EditPrfile extends StatefulWidget {
//   final UserModel userModel;
//   const EditPrfile({super.key, required this.userModel});

//   @override
//   State<EditPrfile> createState() => _EditPrfileState();
// }



// class _EditPrfileState extends State<EditPrfile> {
//    File? image;
//     void takePicture() async {
//     XFile? value = await ImagePicker()
//     .pickImage(source: ImageSource.gallery,imageQuality :40);
//     if(value != null){
//       setState(() {
//         image= File(value.path);
//       });
//     }
//    }

//   TextEditingController name = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     AppProvider appProvider = Provider.of<AppProvider>(
//       context,);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white ,
//         title: const Text(
//           "Profile",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         children: [
//           image == null
//             ? CupertinoButton(
//                onPressed: () {
//                  takePicture();
//                },
//                child: const CircleAvatar(
//                 radius:55, child:Icon(Icons.camera_alt)),
//                 )
//             : CupertinoButton(
//                onPressed: () {
//                  takePicture();
//                },
//                child: CircleAvatar(
//                 backgroundImage: FileImage(image!),
//                 radius: 55,
//                 ),
//             ),
//             const SizedBox(height: 12.0,
//             ),
//             TextFromField(
//               controller: name,
//               decoration: InputDecoration(
//               hintText : widget.userModel.name,
//               ),
//             ),
//             const SizedBox(height: 24.0,
//             ),
//             ElevatedButton(
//               child:const Text("Update"),
//               onPressed: () async {
//                 UserModel userModel= widget.userModel.copyWith(
//                   image: image,
//                   name: name.text,
//                 );
               
//             // appProvider.updateUserInfoFirebase(context, userModel,image);
//               },
//             ),  
//         ],    
//       ),
//     );
//   }

// }




  
