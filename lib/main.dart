import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner/app/features/dashboard/presentation/cubit/container_cubit.dart';

import 'app/app.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ContainerCubit>(
      create: (context) => ContainerCubit(),
    ),
  ], child: const MyApp()));
}
