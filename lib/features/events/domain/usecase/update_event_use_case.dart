import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';

class UpdateEventUseCase {
  final EventsRepository _repository;
  UpdateEventUseCase(this._repository);

  /// Updates an existing event — returns Success or Failure.
  Future<Result<void>> call(EventEntity event) {
    return _repository.updateEvent(event);
  }
}