import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_with_firebase_auth/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  togglePassword() {
    // toggle the password visibility
    hiddenPassword = !hiddenPassword;
    setState(
      () {},
    );
  }

  toggleConfirmPassword() {
    hiddenConfirmPassword = !hiddenConfirmPassword;
    setState(
      () {},
    );
  }

  Future<void> signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Unknown Error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  // Full Name field
                  decoration: InputDecoration(labelText: 'Full Name'),
                  controller: fullNameController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Full Name Cannot be empty';
                    }
                    if (value!.startsWith(RegExp(r'[a-z0-9]'))) {
                      // Check if the first letter is capital using regular expression.
                      return 'Full Name should start with a capital letter';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // Email field
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: emailController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Email Cannot be empty';
                    }
                    if (!value!.contains('@')) {
                      // Check if the email contains @
                      return 'Email should contain @';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // Password field
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        // if the password is hidden, show the visibility icon, else show the visibility_off icon
                        icon: Icon(hiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          togglePassword();
                        },
                      )),
                  controller: passwordController,
                  obscureText: hiddenPassword, // hide the password
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Password Cannot be empty';
                    }
                    if (value!.length < 6) {
                      // Check if the password is less than 6 characters
                      return 'Password should be at least 6 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // Confirm Password field
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        // if the password is hidden, show the visibility icon, else show the visibility_off icon
                        icon: Icon(hiddenConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          toggleConfirmPassword();
                        },
                      )),
                  controller: confirmPasswordController,
                  obscureText: hiddenConfirmPassword, // hide the password
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'This field Cannot be empty';
                    }
                    if (value != passwordController.text) {
                      // Check if the password matches the confirm password
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  // Sign Up button
                  child: Text('SignUp'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
