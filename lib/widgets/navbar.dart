import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(backgroundColor: Color(0xFFE2B616)),
            child: Text(
              "Moofy",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(0)),
              child: TextField(
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.clear),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.cancel),
                    ),
                    hintText: "Search...",
                    border: InputBorder.none
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
