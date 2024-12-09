import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  // make a year
  final String newDate = DateTime.now().year.toString();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "© $newDate Moofy. All Rights Reserved",
            style: TextStyle(color: Colors.grey[400]),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.link,
                  color: Colors.grey[400],
                ),
                tooltip: "Instagram",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.link,
                  color: Colors.grey[400],
                ),
                tooltip: "Threads",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.link,
                  color: Colors.grey[400],
                ),
                tooltip: "Youtube",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.link,
                  color: Colors.grey[400],
                ),
                tooltip: "Tiktok",
              ),
            ],
          )
        ],
      ),
    );
  }
}
