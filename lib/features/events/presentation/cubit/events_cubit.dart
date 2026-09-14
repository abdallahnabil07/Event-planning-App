import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:event_app/core/enums/event_error_code.dart';
import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/usecase/add_event_use_case.dart';
import 'package:event_app/features/events/domain/usecase/delete_event_use_case.dart';
import 'package:event_app/features/events/domain/usecase/get_events_use_case.dart';
import 'package:event_app/features/events/domain/usecase/get_favorite_events_use_case.dart';
import 'package:event_app/features/events/domain/usecase/toggle_favorite_use_case.dart';
import 'package:event_app/features/events/domain/usecase/update_event_use_case.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final GetEventsUseCase _getEventsUseCase;
  final GetFavoriteEventsUseCase _getFavoriteEventsUseCase;
  final AddEventUseCase _addEventUseCase;
  final UpdateEventUseCase _updateEventUseCase;
  final DeleteEventUseCase _deleteEventUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;
  StreamSubscription<List<EventEntity>>? _eventsSubscription;

  EventsCubit({
    required GetEventsUseCase getEventsUseCase,
    required GetFavoriteEventsUseCase getFavoriteEventsUseCase,
    required AddEventUseCase addEventUseCase,
    required UpdateEventUseCase updateEventUseCase,
    required DeleteEventUseCase deleteEventUseCase,
    required ToggleFavoriteUseCase toggleFavoriteUseCase,
  }) : _getEventsUseCase = getEventsUseCase,
       _getFavoriteEventsUseCase = getFavoriteEventsUseCase,
       _addEventUseCase = addEventUseCase,
       _updateEventUseCase = updateEventUseCase,
       _deleteEventUseCase = deleteEventUseCase,
       _toggleFavoriteUseCase = toggleFavoriteUseCase,
       super(EventsInitial());

  // ✅ listen to live events stream by category
  void getEvents(String categoryId) {
    // cancel any previous subscription before starting a new one
    _eventsSubscription?.cancel();
    _eventsSubscription = _getEventsUseCase(categoryId).listen(
      (events) => emit(EventsLoaded(events)),
      onError: (error) => emit(EventsFailure(EventErrorCode.unknown)),
    );
  }

  void getFavoriteEvents() {
    _eventsSubscription?.cancel();
    _eventsSubscription = _getFavoriteEventsUseCase().listen(
      (events) => emit(EventsLoaded(events)),
      onError: (error) => emit(EventsFailure(EventErrorCode.unknown)),
    );
  }

  Future<void> toggleFavorite(EventEntity event) async {
    final result = await _toggleFavoriteUseCase(event);
    // no loading for toggle — instant UI feel
    _emitResult(result);
  }

  Future<Result<void>> addEvent(EventEntity event) async {
    emit(EventsLoading());
    final result = await _addEventUseCase(event);

    return result;
  }

  Future<void> deleteEvent(EventEntity event) async {
    emit(EventsLoading());
    final result = await _deleteEventUseCase(event);
    _emitResult(result);
  }

  Future<void> updateEvent(EventEntity event) async {
    emit(EventsLoading());
    final result = await _updateEventUseCase(event);
    _emitResult(result);
  }

  void _emitResult(Result<void> result) {
    switch (result) {
      case Success():
        emit(EventsOperationSuccess());
      case Failure failure:
        final code = failure.code;
        emit(EventsFailure(code as EventErrorCode));
    }
  }

  @override
  Future<void> close() {
    _eventsSubscription?.cancel();
    return super.close();
  }
}
