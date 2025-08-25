import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/widgets/back_botton.dart';
import 'package:spotify/presentation/widgets/basic_elvated_botton.dart';
import 'package:spotify/presentation/widgets/text_form_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomBackButton(),
                    SizedBox(
                      height: 33,
                      width: 100,
                      child: Image.asset(AppVectors.spotifyLogo),
                    ),
                    const SizedBox(width: 50), // علشان يوازن الصف
                  ],
                ),
                SizedBox(height: 80),
                Text(
                  "Sigin In",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you need any help ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {},
                      child: Text(
                        "Click Here ",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                CustomTextFormField(hintText: "Enter UserName OR Email"),
                SizedBox(height: 16),

                CustomTextFormField(
                  hintText: "Password",
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black87,
                    ),
                    onPressed: () {},
                    child: Text("Rcovery Password"),
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: BasicElevatedBotton(text: "Sign In", onPressed: () {}),
                ),
                SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.grey, // لون الخط
                        thickness: 1, // سُمك الخط
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  ],
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.googelIcone),
                    SizedBox(width: 60),

                    SvgPicture.asset(AppVectors.appelIcone),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not A Member ?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {},
                      child: Text(
                        " Rigister Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
