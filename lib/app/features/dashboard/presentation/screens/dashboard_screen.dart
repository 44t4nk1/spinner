import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spinner/app/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:spinner/app/helpers/size.dart';
import 'package:spinner/app/styles/colors.dart';
import 'package:spinner/app/styles/fonts.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> dockers = const [
    {
      "id": "f5f83c51682790011659c352ae5716f56fa62eee921da45a46e14f25ae57f607",
      "name": "/upbeat_dewdney",
      "image": "ubuntu",
      "created": 1658661916,
      "port": 0,
      "portType": "NA",
      "state": "running",
      "status": "Up 5 minutes"
    },
    {
      "id": "8fd025f4da42f0694ffcf2cbd3ba04f82df9e7b8fff4c6784e6588bb3dcf88cb",
      "name": "/frosty_tereshkova",
      "image": "redis",
      "created": 1658660078,
      "port": 6379,
      "portType": "tcp",
      "state": "running",
      "status": "Up 36 minutes"
    },
    {
      "id": "f5f83c51682790011659c352ae5716f56fa62eee921da45a46e14f25ae57f607",
      "name": "/upbeat_dewdney",
      "image": "ubuntu",
      "created": 1658661916,
      "port": 0,
      "portType": "NA",
      "state": "running",
      "status": "Up 5 minutes"
    },
    {
      "id": "8fd025f4da42f0694ffcf2cbd3ba04f82df9e7b8fff4c6784e6588bb3dcf88cb",
      "name": "/frosty_tereshkova",
      "image": "redis",
      "created": 1658660078,
      "port": 6379,
      "portType": "tcp",
      "state": "running",
      "status": "Up 36 minutes"
    }
  ];

  final _formKey = GlobalKey<FormState>();

  AlertDialog alertDialog() {
    return AlertDialog(
      backgroundColor: primaryBlue,
      content: Builder(
        builder: (context) {
          SizeHelper sh = SizeHelper(context);

          return SizedBox(
            height: sh.hHelper(30),
            width: sh.wHelper(80),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper sh = SizeHelper(context);
    return Scaffold(
      backgroundColor: primaryBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBlue,
        title: Text(
          "Spinner",
          style: appBarFont,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            ListView(
              children: [
                for (int i = 0; i < dockers.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: sh.hHelper(1.5),
                    ),
                    child: DashboardCard(
                      status: dockers[i]['status'],
                      state: dockers[i]['state'],
                      name: dockers[i]['name'],
                      createdAt: dockers[i]['created'],
                      image: dockers[i]['image'],
                      portType: dockers[i]['portType'],
                      port: dockers[i]['port'],
                    ),
                  )
              ],
            ),
            Positioned(
              bottom: sh.hHelper(5),
              left: sh.wHelper(14),
              right: sh.wHelper(14),
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alertDialog();
                    },
                  );
                },
                child: Container(
                  height: sh.hHelper(6),
                  decoration: BoxDecoration(
                    color: secondaryBlue,
                    border: Border.all(
                      color: secondaryBlue,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: sh.wHelper(2),
                      ),
                      Text(
                        "New Container",
                        style: buttonFont,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
