class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.title),
      subtitle: Text('${activity.activityType} - ${activity.location}'),
      trailing: Text(activity.slot),
    );
  }
}
