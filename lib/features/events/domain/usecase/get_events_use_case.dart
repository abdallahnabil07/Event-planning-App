import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';

class GetEventsUseCase {
  final EventsRepository _repository;

  GetEventsUseCase(this._repository);

  Stream<List<EventEntity>> call(String categoryId) {
    return _repository.getEvents(categoryId);
  }
}
