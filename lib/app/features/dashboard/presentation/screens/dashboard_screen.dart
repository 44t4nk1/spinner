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
            ListView(
              children: [
                for (int i = 0; i < dockers.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: sh.hHelper(1.5),
                    ),
                    child: DashboardCard(
                      id: dockers[i].id,
                      status: dockers[i].status,
                      state: dockers[i].state,
                      name: dockers[i].name,
                      createdAt: dockers[i].created,
                      image: dockers[i].image,
                      portType: dockers[i].portType,
                      port: dockers[i].port,
                      onCallback: (id) {
                        BlocProvider.of<ContainerCubit>(context)
                            .deleteContainers(id);
                      },
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
