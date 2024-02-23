import 'package:flutter/material.dart';
import 'package:islamic_app/services/assets_manager.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.radio_02,height: size.height*.3,),
            SizedBox(
              height: size.width * 0.05,
            ),
            const Text(
              "اذاعه القران الكريم",
              style: TextStyle(
                fontFamily: "Elmessiri",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: size.width * .09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(AssetsManager.iconMetroPlayPrevious),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(AssetsManager.iconAwesomePlayNext),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(AssetsManager.iconMetroPlayNext),
                ),
              ],
            ),
            const SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}
