import 'package:flutter/material.dart';
import 'package:simple_shopping_app/home_page.dart';

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
                      // Check if the form is valid
                      successDialog();
                    }
                  },
                )
              ],
            ),
          )),
    );
  }

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

  Future<void> successDialog() async {
    // Show the success dialog
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hello'),
          content: const Text('Account Created Successfully'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                // Close the dialog and navigate to the home page
                Navigator.of(context).push(FadeInPageRoute(child: HomePage()));
              },
            ),
          ],
        );
      },
    );
  }
}

class FadeInPageRoute<T> extends PageRouteBuilder<T> {
  // Define a custom page route that fades in the new page
  final Widget child; // The child widget to navigate to in our case HomePage

  FadeInPageRoute({required this.child})
      : super(
          transitionDuration: Duration(
              milliseconds:
                  5000), // Duration of the transition change it as you like to experiment the effect
          pageBuilder: (context, animation, secondaryAnimation) =>
              child, //this function returns the widget for the new page
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // This function defines how the page transition animation will be
            return FadeTransition(
              // creates a fading effect the opacity of the new page changes from completely transparent to completely opaque
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            );
          },
        );
}
