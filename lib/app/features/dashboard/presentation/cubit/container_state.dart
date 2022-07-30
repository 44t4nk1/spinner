part of 'container_cubit.dart';

abstract class ContainerState extends Equatable {
  const ContainerState();

  @override
  List<Object> get props => [];
}

class ContainerInitial extends ContainerState {}

class ContainerLoading extends ContainerState {}

class ContainerEmpty extends ContainerState {}

class ContainerCreateLoading extends ContainerState {}

class ContainerCreateSuccess extends ContainerState {}

class ContainerCreateFailure extends ContainerState {}

class ContainerFailure extends ContainerState {
  final String error;

  const ContainerFailure({required this.error});
}

class ContainersSuccess extends ContainerState {
  final List<MyContainer> data;

  const ContainersSuccess({required this.data});
}
