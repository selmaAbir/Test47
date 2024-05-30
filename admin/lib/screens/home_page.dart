// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/constants/routes.dart';
import 'package:admin/provider/app_provider.dart';
import 'package:admin/widgets/single_dash_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:admin/screens/user_view.dart';
import 'package:provider/provider.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  void getData() async {
    setState(() {
      isLoading = true;
    });
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    await appProvider.callBackFunction(); // Ensure the data fetching is awaited
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // IMPORTANT TO MAINTAIN THE CODE 
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: isLoading
          ? Center(
            child: CircularProgressIndicator()
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    Text(
                      "ABIR dev",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "abir@gmail.com",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.only(top: 12.0),
                      crossAxisCount: 2,
                      children:  [
                        
                        SingleDashItem(subtitle: "Users", onPressed: () { Routes.instance.push (widget: const UserView(), context: context);},  title: appProvider.getUserList.length.toString()),
                        SingleDashItem(subtitle: "Categories", onPressed: () {},title: appProvider.getCategoriesList.length.toString()),
                        SingleDashItem(subtitle: "Products",onPressed: () {}, title: "121"),
                        SingleDashItem(subtitle: "Earnings", onPressed: () {},title: "2325"),
                        SingleDashItem(subtitle: "Pending Orders",onPressed: () {}, title: "11"),
                        SingleDashItem(subtitle: "Completed Orders", onPressed: () {},title: "12"),
                        SingleDashItem(subtitle: "Cancel Orders",onPressed: () {}, title: "11"),
                        SingleDashItem(subtitle: "Pending Orders", onPressed: () {},title: "2"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  final List<Map<String, dynamic>> dashboardItem = [
    {
      "title": "400",
      "subtitl": "Users",
    },
    {
      "title": "5",
      "subtitl": "Categories",
    },
    {
      "title": "\$600",
      "subtitl": "Earnings",
    },
    {
      "title": "12",
      "subtitl": "Pending Order",
    },
    {
      "title": "5",
      "subtitl": "Completed Order",
    },
    {
      "title": "2",
      "subtitl": "Cancel Order",
    },
    {
      "title": "5",
      "subtitl": "Delivery Order",
    },
  ];
}
