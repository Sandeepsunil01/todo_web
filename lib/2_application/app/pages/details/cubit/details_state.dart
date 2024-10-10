part of 'details_cubit.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsError extends DetailsState {}

final class DetailsLoaded extends DetailsState {
  final List<EntryId> entryIds;

  const DetailsLoaded({
    required this.entryIds,
  });

  @override
  List<Object> get props => [entryIds];
}
