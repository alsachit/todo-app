import 'package:flutter/material.dart';
import 'package:test1/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login Page',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 const SizedBox(
                    height: 40,
                  ),
                  defaultTextFormField(
                    validate: (String? value) {
                      if (value!.isEmpty){
                        return "Email address is required";
                      }
                      return null;
                    },
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email Address",
                    controller: emailController
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      controller: passwordController,
                      isPassword: isPasswordShow,
                      validate: (String? value){
                        if(value!.isEmpty){
                          return "Password is required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      label: "Password",
                      prefixIcon: Icons.lock,
                    suffixIcon: isPasswordShow == true ? Icons.visibility : Icons.visibility_off,
                    suffixPressed: (){
                        setState((){
                          isPasswordShow = !isPasswordShow;
                        });

                    }
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: (){
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    label: 'login',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
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
