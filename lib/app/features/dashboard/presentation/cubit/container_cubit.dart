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

  void deleteContainers(String id) async {
    emit(ContainerInitial());
    containers.removeWhere((element) => element.id == id);
    emit(ContainersSuccess(data: containers));
    int response = await _containerRepo.deleteContainers(id);
    if (response != 200) {
      fetchContainers();
    }
  }

  void createContainers(String image, name) async {
    emit(ContainerCreateLoading());
    int response = await _containerRepo.createContainers(image, name);
    if (response != 200) {
      emit(ContainerCreateFailure());
    } else {
      emit(ContainerCreateSuccess());
    }
  }
}
