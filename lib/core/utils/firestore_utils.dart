import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventy_app/model/event_data_model.dart';

abstract class FirestoreUtils {
  static CollectionReference<EventDataModel> _getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
          fromFirestore: (snapshot, _) =>
              EventDataModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );
  }

  static Future<bool> addEvent(EventDataModel data) async {
    try {
      var collectionRef = _getCollectionReference();
      var docRef = collectionRef.doc();
      data.eventId = docRef.id;
      await docRef.set(data);
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<List<EventDataModel>> getDataFromFireStore() async {
    List<EventDataModel> eventList = [];
    var collectionRef = _getCollectionReference();
    var data = await collectionRef.get();
    data.docs.map((element) {
      eventList.add(element.data());
    }).toList();
    return eventList;
  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamDataFromFireStore(
    String categoryId,
  ) {
    var collectionRef = FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
          fromFirestore: (snapshot, _) =>
              EventDataModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );

    if (categoryId == "all") {
      return collectionRef.snapshots();
    } else {
      return collectionRef
          .where("eventCategoryId", isEqualTo: categoryId)
          .snapshots();
    }
  }

  static Stream<QuerySnapshot<EventDataModel>>
  getStreamFavoriteDataFromFireStore() {
    var collectionRef = _getCollectionReference().where(
      //inFireBAse
      "isFavorite",
      isEqualTo: true, //compersion
    );
    return collectionRef.snapshots();
  }

  static Future<void> updateEvent(EventDataModel data) async {
    var collectionRef = _getCollectionReference();
    var docRef = collectionRef.doc(data.eventId);
    docRef.update(data.toFireStore());
  }

  static Future<void> deleteEvent(EventDataModel data) async {
    var collectionRef = _getCollectionReference();
    var docRef = collectionRef.doc(data.eventId);
    docRef.delete();
  }
}
