import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowPlayingSkeleton extends StatelessWidget {
  const NowPlayingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  color: Colors.grey[800],
                  width: 80,
                  height: 120,
                ),
                title: Container(
                  color: Colors.grey[800],
                  height: 30,
                ),
                subtitle: Container(
                  color: Colors.grey[800],
                  
                  height: 40,
                ),
              );
            }));
  }
}
