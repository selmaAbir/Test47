// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/screens/single_user_card.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/user_model.dart';
import 'package:admin/provider/app_provider.dart';
import 'package:provider/provider.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User view "),
      ),
      body: Consumer<AppProvider>
      (builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.getUserList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            UserModel userModel = value.getUserList[index];
            return SingleUserCard(userModel: userModel,);
          },
        );
      },
    ),
    );
  }
}