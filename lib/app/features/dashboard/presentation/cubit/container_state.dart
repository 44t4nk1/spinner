part of 'container_cubit.dart';

abstract class ContainerState extends Equatable {
  const ContainerState();

  @override
  List<Object> get props => [];
}

class ContainerInitial extends ContainerState {}

class ContainerLoading extends ContainerState {}

class ContainerFailure extends ContainerState {}

class ContainersSuccess extends ContainerState {
  final List<Container> data;

  const ContainersSuccess({required this.data});
}
