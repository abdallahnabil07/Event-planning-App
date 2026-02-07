import 'package:eventy_app/model/event_category_model.dart';
import 'package:eventy_app/model/event_data_model.dart';

class EventDetailsArgs {
final EventDataModel event;
final EventCategoryModel? category;

EventDetailsArgs({required this.event,  this.category});
}