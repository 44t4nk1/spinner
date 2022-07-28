import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner/app/features/dashboard/presentation/cubit/container_cubit.dart';
import 'package:spinner/app/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:spinner/app/helpers/size.dart';
import 'package:spinner/app/styles/colors.dart';
import 'package:spinner/app/styles/fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    BlocProvider.of<ContainerCubit>(context).fetchContainers();
    super.initState();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  // final List<Map<String, dynamic>> dockers = const [
  //   {
  //     "id": "f5f83c51682790011659c352ae5716f56fa62eee921da45a46e14f25ae57f607",
  //     "name": "/upbeat_dewdney",
  //     "image": "ubuntu",
  //     "created": 1658661916,
  //     "port": 0,
  //     "portType": "NA",
  //     "state": "running",
  //     "status": "Up 5 minutes"
  //   },
  //   {
  //     "id": "8fd025f4da42f0694ffcf2cbd3ba04f82df9e7b8fff4c6784e6588bb3dcf88cb",
  //     "name": "/frosty_tereshkova",
  //     "image": "redis",
  //     "created": 1658660078,
  //     "port": 6379,
  //     "portType": "tcp",
  //     "state": "running",
  //     "status": "Up 36 minutes"
  //   },
  //   {
  //     "id": "f5f83c51682790011659c352ae5716f56fa62eee921da45a46e14f25ae57f607",
  //     "name": "/upbeat_dewdney",
  //     "image": "ubuntu",
  //     "created": 1658661916,
  //     "port": 0,
  //     "portType": "NA",
  //     "state": "running",
  //     "status": "Up 5 minutes"
  //   },
  //   {
  //     "id": "8fd025f4da42f0694ffcf2cbd3ba04f82df9e7b8fff4c6784e6588bb3dcf88cb",
  //     "name": "/frosty_tereshkova",
  //     "image": "redis",
  //     "created": 1658660078,
  //     "port": 6379,
  //     "portType": "tcp",
  //     "state": "running",
  //     "status": "Up 36 minutes"
  //   }
  // ];

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter container details",
                    style: nameFont,
                  ),
                  SizedBox(
                    height: sh.hHelper(2),
                  ),
                  TextFormField(
                    controller: nameController,
                    cursorColor: secondaryBlue,
                    style: nameFont,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: hintFont,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: secondaryBlue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: secondaryBlue,
                        ),
                      ),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: sh.hHelper(2),
                  ),
                  TextFormField(
                    controller: imageController,
                    cursorColor: secondaryBlue,
                    style: nameFont,
                    decoration: InputDecoration(
                      hintText: "Image",
                      hintStyle: hintFont,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: secondaryBlue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: secondaryBlue,
                        ),
                      ),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: sh.hHelper(2),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: sh.hHelper(6),
                      alignment: Alignment.center,
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
                      child: Text(
                        "Create Container",
                        style: buttonFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildUI(SizeHelper sh, BuildContext context) {
    var dockers = BlocProvider.of<ContainerCubit>(context).containers;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Column(
              children: [
                for (int i = 0; i < dockers.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: sh.hHelper(1.5),
                    ),
                    child: DashboardCard(
                      status: dockers[i].status,
                      state: dockers[i].state,
                      name: dockers[i].name,
                      createdAt: dockers[i].created,
                      image: dockers[i].image,
                      portType: dockers[i].portType,
                      port: dockers[i].port,
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

  _buildLoading(SizeHelper sh, BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(secondaryBlue),
        ),
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
      body: Column(
        children: [
          BlocBuilder<ContainerCubit, ContainerState>(
            builder: (context, state) {
              if (state is ContainerLoading) {
                return _buildLoading(sh, context);
              }
              return _buildUI(sh, context);
            },
          ),
        ],
      ),
    );
  }
}
