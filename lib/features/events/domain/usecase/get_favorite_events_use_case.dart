import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';

class GetFavoriteEventsUseCase {
  final EventsRepository _repository;

  GetFavoriteEventsUseCase(this._repository);

  Stream<List<EventEntity>> call() {
    return _repository.getFavoritesEvents();
  }
}
