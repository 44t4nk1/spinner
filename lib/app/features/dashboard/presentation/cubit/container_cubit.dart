import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/container.dart';

part 'container_state.dart';

class ContainerCubit extends Cubit<ContainerState> {
  ContainerCubit() : super(ContainerInitial());

  var containers = <Container>[];

  void fetchContainers() async {
    emit(ContainerLoading());
    containers.clear();
    // emit(ContainersSuccess(data: data));
  }

  // final GroupsRepo _groupsRepo = GroupsRepo();

  // var groups = <Groups>[];

  // void fetchMyGroups({required bool cacheRefresh}) async {
  //   emit(MyGroupsLoading());
  //   groups.clear();
  //   var response = await _groupsRepo.getMyGroups(cacheRefresh);
  //   response.fold(
  //     (l) => emit(MyGroupsError(message: l.message)),
  //     (r) {
  //       groups.addAll(r);
  //       emit(MyGroupsSuccess(r));
  //     },
  //   );
  // }

}
