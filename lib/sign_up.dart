import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                  controller: fullNameController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Full Name Cannot be empty';
                    }
                    if (value!.startsWith(RegExp(r'[a-z0-9]'))) {
                      return 'Full Name should start with a capital letter';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: emailController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Email Cannot be empty';
                    }
                    if (!value!.contains('@')) {
                      return 'Email should contain @';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(hiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          togglePassword();
                        },
                      )),
                  controller: passwordController,
                  obscureText: hiddenPassword,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Password Cannot be empty';
                    }
                    if (value!.length < 6) {
                      return 'Password should be at least 6 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(hiddenConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          toggleConfirmPassword();
                        },
                      )),
                  controller: confirmPasswordController,
                  obscureText: hiddenConfirmPassword,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'This field Cannot be empty';
                    }
                    if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: Text('SignUp'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                )
              ],
            ),
          )),
    );
  }

  togglePassword() {
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
}
