part of 'events_cubit.dart';

sealed class EventsState {}

// ✅ initial state — nothing loaded yet
class EventsInitial extends EventsState {}

// ✅ loading — for add, update, delete, toggle operations
class EventsLoading extends EventsState {}

// ✅ stream loaded — home and favorites list is ready
class EventsLoaded extends EventsState {
  final List<EventEntity> events;

  EventsLoaded(this.events);
}

// ✅ operation success — add, update, delete, toggle succeeded
class EventsOperationSuccess extends EventsState {}

// ✅ failure — any operation failed
class EventsFailure extends EventsState {
  final EventErrorCode code;

  EventsFailure(this.code);
}
