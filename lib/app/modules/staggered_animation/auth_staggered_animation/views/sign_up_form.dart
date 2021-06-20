import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required this.onLoginPressed,
  }) : super(key: key);

  final VoidCallback onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(decoration: InputDecoration(hintText: 'Name')),
        TextField(decoration: InputDecoration(hintText: 'Email')),
        TextField(decoration: InputDecoration(hintText: 'Password')),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('SignUp'),
                onPressed: onLoginPressed,
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                child: Text('Already Account!'),
                onPressed: onLoginPressed,
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
              ),
            ],
          ),
        ),
      ],
    );
    //return Container(alignment: Alignment.center,child: Text('Sign Up'),);

    /*return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Create an account'),
              ),
              TextField(decoration: InputDecoration(hintText: 'Name')),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              ElevatedButton(
                child: Text('SignUp Now!'),
                onPressed: onLoginPressed,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already have an account?'),
                  ElevatedButton(
                    child: Text('Sign in'),
                    onPressed: onLoginPressed,
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
