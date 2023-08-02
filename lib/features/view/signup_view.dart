import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../auth/auth_field.dart';
import '../auth/authen_field.dart';
import '../common/rounded_small_button.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  static Route get route => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );

  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isTeacherSelected = false;
  bool isStudentSelected = true;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void _signUpAsTeacher() {
    setState(() {
      isTeacherSelected = true;
      isStudentSelected = false;
    });
    // Implement your logic for teacher sign-up here
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherSignUpView()));
  }

  void _signUpAsStudent() {
    setState(() {
      isTeacherSelected = false;
      isStudentSelected = true;
    });
    // Implement your logic for student sign-up here
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => StudentSignUpView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/icons/sign.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _signUpAsTeacher,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: isTeacherSelected ? Colors.blue.withOpacity(0.8) : Colors.transparent,
                                blurRadius: isTeacherSelected ? 10 : 0,
                                spreadRadius: isTeacherSelected? 2 : 0,
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.blue,
                            shape: CircleBorder(),
                            child: Ink.image(
                              image: AssetImage('lib/assets/icons/teacher_icon.png'),
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                transitionBuilder: (Widget child, Animation<double> animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: isTeacherSelected
                                    ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                )
                                    : SizedBox.shrink(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Teacher',
                          style: TextStyle(
                            color: isTeacherSelected ? Colors.green : Colors.black,
                            fontWeight: isTeacherSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //onTap: _signUpAsStudent,
                  GestureDetector(
                    onTap: _signUpAsStudent,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: isStudentSelected ? Colors.blue.withOpacity(0.8) : Colors.transparent,
                                blurRadius: isStudentSelected ? 10 : 0,
                                spreadRadius: isStudentSelected ? 2 : 0,
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.blue,
                            shape: CircleBorder(),
                            child: Ink.image(
                              image: AssetImage('lib/assets/icons/student_icon.png'),
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                transitionBuilder: (Widget child, Animation<double> animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: isStudentSelected
                                    ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                )
                                    : SizedBox.shrink(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Student',
                          style: TextStyle(
                            color: isStudentSelected ? Colors.green : Colors.black,
                            fontWeight: isStudentSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height: 40),
              AuthField(
                controller: nameController,
                labelText: 'Your Name',
                hintText: 'Aniket',
              ),
              const SizedBox(height: 20),
              AuthField(
                labelText: 'NFSU Email id',
                controller: emailController,
                hintText: '102abc@nfsu.ac.in',
              ),
              const SizedBox(height: 20),
              AuthenField(
                labelText: 'Password',
                controller: passwordController,
                hintText: 'Secret password',
              ),
              const SizedBox(height: 40),
              RoundedSmallButton(
                allignment: Alignment.center,
                onTap: () {},
                label: 'done',
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' Sign in',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
