import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'take_photo.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isHomePage = true;
    return Scaffold(
      appBar: AppBarDesign(
        showBackArrow: !isHomePage,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        final double screenHeight = MediaQuery.of(context).size.height;

        return Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 227, 223, 223),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    35,
                  ),
                  topRight: Radius.circular(
                    35,
                  ),
                ),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        35,
                      ),
                      topRight: Radius.circular(
                        35,
                      ),
                    ),
                    child: Image(
                      image: const AssetImage(
                        'images/Jw_R192A.png',
                      ),
                      width: double.infinity,
                      // height:orientation == Orientation.portrait? screenHeight * 0.5: screenWidth*0.2,
                      height: screenHeight * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    '🔍 Enjoy injera with confidence! ',
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    padding: const EdgeInsets.symmetric(),
                    width: screenHeight * 0.2,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      color: const Color(0xffb2a4a4),
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/take_photo');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Center(
                          child: Text(
                            'start now',
                            style: TextStyle(
                                fontSize: screenHeight * 0.020,
                                fontStyle: FontStyle.normal,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
  //     bottomNavigationBar: BottomNavigationBarPart(
  //       key: UniqueKey(),
  //   onTap: (index) {
  //     switch (index) {
  //       case 0:
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => const MyHomePage()),
  //         );
  //         break;
  //       case 1:
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => const TakePhoto()),
  //         );
  //         break;
       
  //     }
  //   },
  // ),
    );
  }
}
