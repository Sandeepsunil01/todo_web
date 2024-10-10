import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_web/1_domain/entities/unique_id.dart';
import 'package:todo_app_web/1_domain/use_cases/load_entry_ids_for_collection.dart';
import 'package:todo_app_web/core/use_case.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({
    required this.collectionId,
    required this.loadTodoEntryIdsForCollections,
  }) : super(DetailsLoading());

  final CollectionId collectionId;
  final LoadEntryIdsForCollection loadTodoEntryIdsForCollections;

  Future<void> fetch() async {
    emit(DetailsLoading());
    try {
      final entryIds = await loadTodoEntryIdsForCollections
          .call(CollectiondIdParams(collectionId: collectionId));
      if (entryIds.isLeft) {
        emit(DetailsError());
      } else {
        emit(DetailsLoaded(entryIds: entryIds.right));
      }
    } on Exception {
      emit(DetailsError());
    }
  }
}
