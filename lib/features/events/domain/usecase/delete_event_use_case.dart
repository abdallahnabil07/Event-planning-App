import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';

class DeleteEventUseCase {
  final EventsRepository _repository;

  DeleteEventUseCase(this._repository);

  Future<Result<void>> call(EventEntity event) {
    return _repository.deleteEvent(event);
  }
}
