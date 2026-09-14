import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/data/data_sources/online/events_online_data_source.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';

class EventsRepositoryImpl implements EventsRepository {
  final EventsOnlineDataSource _onlineDataSource;

  EventsRepositoryImpl({EventsOnlineDataSource? onlineDataSource})
    : _onlineDataSource = onlineDataSource ?? EventsOnlineDataSourceImpl();

  @override
  Future<Result<void>> addEvent(EventEntity event) =>
      _onlineDataSource.addEvent(event);

  @override
  Future<Result<void>> deleteEvent(EventEntity event) =>
      _onlineDataSource.deleteEvent(event);

  @override
  Stream<List<EventEntity>> getEvents(String categoryId) =>
      _onlineDataSource.getEvents(categoryId);

  @override
  Stream<List<EventEntity>> getFavoritesEvents() =>
      _onlineDataSource.getFavoriteEvents();

  @override
  Future<Result<void>> toggleFavorite(EventEntity event) =>
      _onlineDataSource.toggleFavorite(event);

  @override
  Future<Result<void>> updateEvent(EventEntity event) =>
      _onlineDataSource.updateEvent(event);
}
