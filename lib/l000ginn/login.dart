
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:flutter/material.dart';



import '../firebase_funcation.dart';
import 'Signip account.dart';
import 'helper_ui.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  void siginup(String email, String password) async {
    if (email == "" || password == "") {
      HelperUI.customAlertBox('Enter The required Fields', context);
    } else {
      // Perform any other necessary actions here
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sign in with your email and password  \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50,),
          
              HelperUI.customTextField(emailController, "Email",Icons.email_outlined, false,),
              SizedBox(height: 10,),
              HelperUI.customTextField(passwordController, "Password", Icons.password, true),
              SizedBox(height: 30,),
              HelperUI.customButton(() {
                signInWithEmailAndPassword(emailController.text,passwordController.text,context);
                siginup(emailController.text, passwordController.text);
              }, "Login Now"),

              SizedBox(height: 20),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,),),
                  SizedBox(width: 5,),
                  InkWell(
                      onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>Siginup())),
                      child: Text("SiginUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.red),)),
          
                ],
              )
              
          
          
          
            ],
          ),
        ),
      ),
    );
  }

}
