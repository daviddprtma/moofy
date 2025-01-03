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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  "https://www.instagram.com/daviddprtma/";
                },
                icon: Icon(
                  Icons.image,
                  color: Colors.grey[400],
                ),
                tooltip: "Instagram",
              ),
              IconButton(
                onPressed: () {
                  "https://www.threads.net/@daviddprtma?xmt=AQGzSnLf8sMsuZKFwwQ7cpEiB5F6YERP85PmrGB1jCISV7Y";
                },
                icon: Icon(
                  Icons.link,
                  color: Colors.grey[400],
                ),
                tooltip: "Threads",
              ),
              IconButton(
                onPressed: () {
                  "https://www.youtube.com/@daviddprtma";
                },
                icon: Icon(
                  Icons.video_collection,
                  color: Colors.grey[400],
                ),
                tooltip: "Youtube",
              ),
              IconButton(
                onPressed: () {
                  "https://www.tiktok.com/@daviddprtma2812";
                },
                icon: Icon(
                  Icons.tiktok,
                  color: Colors.grey[400],
                ),
                tooltip: "Tiktok",
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
