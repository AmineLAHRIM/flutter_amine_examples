import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.onSignUpPressed,
  }) : super(key: key);

  final VoidCallback onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      TextField(decoration: InputDecoration(hintText: 'Email')),
      TextField(decoration: InputDecoration(hintText: 'Password')),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Login'),
              onPressed: onSignUpPressed,
            ),
            SizedBox(width: 16,),
            ElevatedButton(
              child: Text('No Account SignUp!'),
              onPressed: onSignUpPressed,
            ),
          ],
        ),
      )
    ],);
    //return Container(alignment: Alignment.center,child: Text('Login'),);
    /*return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Login'),
              ),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              ElevatedButton(
                child: Text('Login Now!'),
                onPressed: onSignUpPressed,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('don\'nt have an account?'),
                  ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: onSignUpPressed,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
