import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/sigin_in/sign_in.dart';
import 'package:spotify/presentation/widgets/back_botton.dart';

class RegisterOrSiginin extends StatelessWidget {
  const RegisterOrSiginin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(left: 10, top: 10, child: CustomBackButton()),
          Positioned(
            right: -40,
            bottom: 0,
            child: Transform.rotate(
              angle: 90,
              child: SvgPicture.asset(AppVectors.unionLogo),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 330,
              child: Image.asset(AppVectors.billeEilish),
            ),
          ),
          Positioned(right: 0, child: SvgPicture.asset(AppVectors.unionLogo)),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 130),
                SizedBox(
                  height: 60,
                  child: Image.asset(AppVectors.spotifyLogo),
                ),
                SizedBox(height: 55),
                Text(
                  "Enjoy listening to music",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "Spotify is a proprietary Swedish audio\n streaming and media services provider ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),

          Positioned(
            top: 370,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Rigester",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
