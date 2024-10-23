import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_application/models/activity.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel activity;

  const ActivityWidget({required this.activity});

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  "https://i.pinimg.com/originals/87/47/9f/87479f8c4844125a31881f47ce28f70a.png",
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
                    // Container(
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         color: Colors.purple),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(
                    //           left: 3, right: 3, top: 1, bottom: 1),
                    //       child: Text(
                    //         activity.type,
                    //         style: GoogleFonts.lato(color: Colors.white),
                    //       ),
                    //     )),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _getActivityColor(activity.type), // Use a function to set color based on type
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
                        child: Text(
                          activity.type,
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(activity.startDateTime),
                    Flexible(
                        child: Text(
                      activity.title,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                      ),
                    )),
                    Expanded(
                      child: Text(
                        activity.location,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(activity.slot),
                    Spacer()
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          )
          // ListTile(
          //   leading: Container(
          //       height: 120,
          //       child: Image.network(
          //         "https://i.pinimg.com/originals/87/47/9f/87479f8c4844125a31881f47ce28f70a.png",
          //       )),
          //   subtitle: Text('${activity.type} - ${activity.location}'),
          //   trailing: Text(activity.slot),
          // ),
          ),
    );
  }

  Color _getActivityColor(String type) {
  switch (type) {
    case 'In-reach programme':
      return Colors.purple; 
    case 'Art Bazaar':
      return Colors.green; 
    case 'Guided Tour':
      return Colors.blue;
    default:
      return Colors.grey; 
  }
}

}
