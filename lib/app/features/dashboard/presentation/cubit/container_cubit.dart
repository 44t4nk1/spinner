import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spinner/app/features/dashboard/domain/repository/container.dart';

import '../../data/container.dart';

part 'container_state.dart';

class ContainerCubit extends Cubit<ContainerState> {
  ContainerCubit() : super(ContainerInitial());

  final ContainerRepo _containerRepo = ContainerRepo();

  var containers = <MyContainer>[];

  void fetchContainers() async {
    emit(ContainerLoading());
    containers.clear();
    var response = await _containerRepo.getContainers();
    response.fold((l) => emit(ContainerFailure(error: l)), (r) {
      containers.addAll(r);
      emit(ContainersSuccess(data: r));
    });
  }
}
