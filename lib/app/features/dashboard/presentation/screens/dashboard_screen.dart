import 'package:flutter/material.dart';
import 'package:spinner/app/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:spinner/app/styles/colors.dart';
import 'package:spinner/app/styles/fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> dockers = const [
    {
      'id': '8fd025f4da42f0694ffcf2cbd3ba04f82df9e7b8fff4c6784e6588bb3dcf88cb',
      'name': 'frosty_tereshkova',
      'image': 'redis',
      'created': 1658660078,
      'portType': 'tcp',
      'port': 6379,
      'state': 'running',
      'status': 'Up 12 minutes',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            DashboardCard(
              status: dockers[0]['status'],
              state: dockers[0]['state'],
              name: dockers[0]['name'],
              createdAt: dockers[0]['created'],
              image: dockers[0]['image'],
              portType: dockers[0]['portType'],
              port: dockers[0]['port'],
            )
          ],
        ),
      ),
    );
  }
}
