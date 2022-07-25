import 'package:flutter/material.dart';
import 'package:spinner/app/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:spinner/app/helpers/size.dart';
import 'package:spinner/app/styles/colors.dart';
import 'package:spinner/app/styles/fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
    }
  ];

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
        child: Column(
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
      ),
    );
  }
}
