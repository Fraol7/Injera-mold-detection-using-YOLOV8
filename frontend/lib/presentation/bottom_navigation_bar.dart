
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/presentation/home_page.dart';
import 'package:frontend/presentation/take_photo.dart';

class BottomNavigationBarPart extends StatefulWidget {
 final Function(int) onTap;
  const BottomNavigationBarPart({required Key key, required this.onTap}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationBarPartState createState() =>
      _BottomNavigationBarPartState();
}

class _BottomNavigationBarPartState extends State<BottomNavigationBarPart> {
  int activePage = 0;
  

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
   
    return CurvedNavigationBar(
      height: screenHeight * 0.07,
      color: const Color(0xff907f7f),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      animationCurve: Curves.easeInOut,
      onTap: (index) {
        setState(() {
          activePage = index;
        });
        widget.onTap(index);
      },
      items: const<Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.camera_alt, size: 30),
      ],
    );
  }
}
