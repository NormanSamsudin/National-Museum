import 'dart:convert';

class ActivityModel {
  final String id;
  final String type;
  final String startDateTime;
  final String title;
  final String location;
  final String slot;
  final String imgUrl;

  ActivityModel({
    required this.id,
    required this.type,
    required this.startDateTime,
    required this.title,
    required this.location,
    required this.slot,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": id,
      "type": type,
      "startDateTime": startDateTime,
      "title": title,
      "location": location,
      "slot": slot,
      'imgUrl': imgUrl
    };
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['_id'] as String,
      type: map['type'] as String,
      startDateTime: map['startDateTime'] as String,
      title: map['title'] as String,
      location: map['location'] as String,
      slot: map['slot'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }
}
