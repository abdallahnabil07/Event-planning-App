import 'dart:ffi';

import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';

abstract class EventsRepository {
  Stream<List<EventEntity>> getEvents(String categoryId);

  Stream<List<EventEntity>> getFavoritesEvents();

  Future<Result<void>> addEvent(EventEntity event);

  Future<Result<void>> updateEvent(EventEntity event);

  Future<Result<void>> deleteEvent(EventEntity event);

  Future<Result<void>> toggleFavorite(EventEntity event);
}
