import 'package:flutter/material.dart';
import 'package:mobile_application/models/activity.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel activity;

  const ActivityWidget({required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.title),
      subtitle: Text('${activity.type} - ${activity.location}'),
      trailing: Text(activity.slot),
    );
  }
}
