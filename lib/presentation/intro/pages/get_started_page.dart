import 'package:flutter/material.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_color.dart';
import 'package:spotify/presentation/choose_model/pages/choose_model_screen.dart';
import 'package:spotify/presentation/widgets/basic_elvated_botton.dart';

class Getstartedpage extends StatelessWidget {
  const Getstartedpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(AppImages.getStartedImage, fit: BoxFit.cover),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.asset(AppVectors.spotifyLogo, height: 60, width: 196),
                Spacer(),
                Text(
                  "Enjoy listening to music",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  textAlign: TextAlign.center,
                  "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Sagittis enim\n purus sed phasellus. Cursus ornare id\n scelerisque aliquam.",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(
                  height: 80,
                  width: 330,
                  child: BasicElevatedBotton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ChooseModelScreen(),
                        ),
                      );
                    },
                    text: 'Get Started',
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
