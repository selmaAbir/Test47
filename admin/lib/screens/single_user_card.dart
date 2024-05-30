import 'package:admin/models/user_model.dart';
import 'package:admin/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SingleUserCard extends StatefulWidget {
  final UserModel userModel;
  const SingleUserCard({
    super.key,
    required this.userModel,
  });

  @override
  State<SingleUserCard> createState() => _SingleUserCardState();
}

class _SingleUserCardState extends State<SingleUserCard> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            widget.userModel.image != null
                ? Image.network(widget.userModel.image!)
                : CircleAvatar(
                    child: const Icon(Icons.person),
                  ),
            const SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.userModel.name),
                Text(widget.userModel.email),
              ],
            ),
           const Spacer(),
            isLoading
                ? const CircularProgressIndicator()
                : GestureDetector(
                  //padding: EdgeInsets.zero,
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                       await appProvider
                       .deleteUserFromFirebase(widget.userModel);
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                    ),
                GestureDetector(
                 // padding: EdgeInsets.zero,
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                       await appProvider
                       .deleteUserFromFirebase(widget.userModel);
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
