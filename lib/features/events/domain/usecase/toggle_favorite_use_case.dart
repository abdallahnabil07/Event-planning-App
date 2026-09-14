import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';

class ToggleFavoriteUseCase {
  final EventsRepository _repository;
  ToggleFavoriteUseCase(this._repository);

  /// Toggles isFavorite on an event — returns Success or Failure.
  Future<Result<void>> call(EventEntity event) {
    return _repository.toggleFavorite(event);
  }
}