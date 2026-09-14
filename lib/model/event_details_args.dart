import 'package:event_app/model/event_category_model.dart';
import 'package:event_app/features/events/data/data_sources/model/event_model.dart';

class EventDetailsArgs {
final EventDataModel event;
final EventCategoryModel? category;

EventDetailsArgs({required this.event,  this.category});
}