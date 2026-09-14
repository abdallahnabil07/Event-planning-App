import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';

class AddEventUseCase {
  final EventsRepository _repository;

  AddEventUseCase(this._repository);

  Future<Result<void>> call(EventEntity event) {
    return _repository.addEvent(event);
  }
}
