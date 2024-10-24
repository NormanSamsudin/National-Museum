import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_application/models/activity.dart';
import 'package:intl/intl.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel activity;

  ActivityWidget({required this.activity});

  DateFormat dateFormat = DateFormat('EEEE, MMMM d, yyyy, h:mm a');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
          height: 180,
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
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _getActivityColor(activity.type),
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
                    const SizedBox(height: 3,),
                    Text(
                        dateFormat
                            .format(DateTime.parse(activity.startDateTime)),
                        style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    Flexible(
                        child: Text(
                      activity.title,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Expanded(
                        child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.pin_drop_rounded,
                                color: Colors.grey),
                          ),
                          TextSpan(
                            text: activity.location,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )),
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
                    ),
                    Spacer()
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          )),
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
