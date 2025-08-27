import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/SpotifySnackBar.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/creat_user_req.dart';
import 'package:spotify/domain/usecases/auth/sign_up.dart';
import 'package:spotify/presentation/auth/sigin_in/sign_in.dart';
import 'package:spotify/presentation/root/pages/root.dart';
import 'package:spotify/presentation/widgets/back_botton.dart';
import 'package:spotify/presentation/widgets/basic_elvated_botton.dart';
import 'package:spotify/presentation/widgets/text_form_field.dart';
import 'package:spotify/service_locator.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Form(
              key: formKey,
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
                    "Register",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If You Need Any Support ",
                        style: TextStyle(
                          fontSize: 12,
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
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 38),
                  CustomTextFormField(
                    hintText: "Full Name",
                    controller: namecontroller,
                  ),

                  SizedBox(height: 16),

                  CustomTextFormField(
                    hintText: "Enter UserName OR Email",
                    controller: emailcontroller,
                  ),
                  SizedBox(height: 16),

                  CustomTextFormField(
                    controller: passwordcontroller,
                    hintText: "Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 22),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: BasicElevatedBotton(
                      text: "Sign In",
                      onPressed: () async {
                        var result = await sl<SignupUseCase>().call(
                          params: CreatUserReq(
                            email: emailcontroller.text.trim().toString(),
                            password: passwordcontroller.text.trim().toString(),
                            fullname: namecontroller.text.trim().toString(),
                          ),
                        );
                        result.fold(
                          (l) {
                            showSpotifySnackBar(context, l.toString());
                          },
                          (r) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootPage(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 32),
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
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 28,
                        child: SvgPicture.asset(AppVectors.googelIcone),
                      ),
                      SizedBox(width: 60),

                      SizedBox(
                        height: 28,
                        child: SvgPicture.asset(AppVectors.appelIcone),
                      ),
                    ],
                  ),
                  SizedBox(height: 57),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do You Have An Account ?",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Text(
                          " Sigin In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 19,
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
      ),
    );
  }
}
