import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_application/models/activity.dart';
import 'package:intl/intl.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel activity;

  const ActivityWidget({required this.activity});

  @override
  Widget build(BuildContext context) {

  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('EEE, d MMM yyyy, h:mm a').format(date);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.network(
                  fit: BoxFit.fill,
                  activity.imgUrl,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _getActivityColor(activity
                            .type), 
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 3, right: 3, top: 1, bottom: 1),
                        child: Text(
                          activity.type,
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(formattedDate, color: Colors.grey),
                    Flexible(
                        child: Text(
                      activity.title,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Expanded(
                      child: 
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.location, color: Colors.grey),
                            ),
                            TextSpan(
                              text: activity.location,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ),
                    RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.person, color: Colors.grey),
                            ),
                            TextSpan(
                              text: activity.slot,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    Spacer()
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          )
          ),
    );
  }

  Color _getActivityColor(String type) {
    switch (type) {
      case 'Art Bazaar':
        return Colors.green;
      case 'Guided Tour':
        return Colors.blue;
      default:
        return Colors.purple;
    }
  }
}
