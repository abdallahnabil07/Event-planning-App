import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/enums/event_error_code.dart';
import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/events/data/data_sources/model/event_model.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';

abstract class EventsOnlineDataSource {
  Stream<List<EventEntity>> getEvents(String categoryId);

  Stream<List<EventEntity>> getFavoriteEvents();

  Future<Result<void>> addEvent(EventEntity event);

  Future<Result<void>> updateEvent(EventEntity event);

  Future<Result<void>> deleteEvent(EventEntity event);

  Future<Result<void>> toggleFavorite(EventEntity event);
}

class EventsOnlineDataSourceImpl implements EventsOnlineDataSource {
  static const String _collection = 'EventCollection';
  final FirebaseFirestore _firestore;

  EventsOnlineDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<void>> addEvent(EventEntity event) async {
    try {
      await _firestore.collection(_collection).add(event.toFireStore());
      return const Success(null);
    } catch (e) {
      return const Failure(EventErrorCode.unknown);
    }
  }

  @override
  Future<Result<void>> deleteEvent(EventEntity event) async {
    try {
      await _firestore.collection(_collection).doc(event.eventId).delete();
      return const Success(null);
    } catch (e) {
      return const Failure(EventErrorCode.unknown);
    }
  }

  @override
  Future<Result<void>> updateEvent(EventEntity event) async {
    try {
      await _firestore
          .collection(_collection)
          .doc(event.eventId)
          .update(event.toFireStore());
      return const Success(null);
    } catch (e) {
      return const Failure(EventErrorCode.unknown);
    }
  }

  @override
  Stream<List<EventEntity>> getEvents(String categoryId) {
    Query<Map<String, dynamic>> query = _firestore.collection(_collection);
    if (_collection != 'all') {
      query = query.where('eventCategoryId', isEqualTo: categoryId);
    }
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return EventModel.fromFireStore(doc.data(), doc.id);
      }).toList();
    });
  }

  @override
  Stream<List<EventEntity>> getFavoriteEvents() {
    return _firestore
        .collection(_collection)
        .where('isFavorite', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return EventModel.fromFireStore(doc.data(), doc.id);
          }).toList();
        });
  }

  @override
  Future<Result<void>> toggleFavorite(EventEntity event) async {
    try {
      await _firestore.collection(_collection).doc(event.eventId).update({
        'isFavorite': !event.isFavorite,
      });
      return const Success(null);
    } catch (e) {
      return const Failure(EventErrorCode.unknown);
    }
  }
}
