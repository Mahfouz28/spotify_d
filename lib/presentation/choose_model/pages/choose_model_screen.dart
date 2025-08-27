import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/choose_model/bloc/theme_cubit.dart';
import 'package:spotify/presentation/register_or_siginin/register_or_siginin.dart';
import 'package:spotify/presentation/widgets/basic_elvated_botton.dart';

class ChooseModelScreen extends StatelessWidget {
  const ChooseModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.chooseModelImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  SizedBox(
                    height: 60,
                    width: 196,
                    child: Image.asset(AppVectors.spotifyLogo),
                  ),

                  SizedBox(height: 390),
                  Text(
                    "Choose Mode",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 73,
                            height: 73,
                            child: IconButton(
                              onPressed: () {
                                context.read<ThemeCubit>().updateThemeMode(
                                  ThemeMode.light,
                                );
                              },
                              icon: Icon(
                                Icons.light_mode_outlined,
                                color: Colors.white70,
                                size: 30,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.grey[800],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Light Mode",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(width: 70),
                      Column(
                        children: [
                          SizedBox(
                            width: 73,
                            height: 73,
                            child: IconButton(
                              onPressed: () {
                                context.read<ThemeCubit>().updateThemeMode(
                                  ThemeMode.dark,
                                );
                              },
                              icon: Icon(
                                Icons.dark_mode_outlined,
                                color: Colors.white70,
                                size: 30,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.grey[800],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dark Mode",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 140),
                  SizedBox(
                    width: 330,
                    height: 92,
                    child: BasicElevatedBotton(
                      text: "Continue",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterOrSiginin(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
