import 'package:flutter/material.dart';
import 'package:flutter_amine_examples/app/modules/staggered_animation/auth_staggered_animation/views/login_form.dart';
import 'package:flutter_amine_examples/app/modules/staggered_animation/auth_staggered_animation/views/sign_up_form.dart';
import 'package:flutter_amine_examples/app/modules/staggered_animation/custom_animation/controllers/custom_animation_controller.dart';

import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';

import '../controllers/auth_staggered_animation_controller.dart';

enum AuthState {
  login,
  signup,
  home,
}

enum AniProps {
  panelWidth,
  panelHeight,
  heightHeader,
  radius,
  colorHeader,
  percent,
}

class AuthStaggeredAnimationView extends StatefulWidget {
  // animation variables
  //AnimationController _controller;

  // variables to control the transition effect to the home page

  @override
  _AuthStaggeredAnimationViewState createState() => _AuthStaggeredAnimationViewState();
}

class _AuthStaggeredAnimationViewState extends State<AuthStaggeredAnimationView> {
  bool _isLogin = true;
  static const double _pannelWidth = 300;
  static const double _pannelHeight = 400;
  static const double _headerHeight = 60;
  static const double _borderRadius = 20;
  static const _colorHeaderLogin = Colors.blue;
  static const _colorHeaderSignUp = Colors.yellow;
  CustomAnimationControl _customAnimationControl = CustomAnimationControl.stop;

  AuthState _authState = AuthState.login;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _tween = TimelineTween<AniProps>()
    // heightHeader
    ..addScene(begin: 0.seconds, end: 0.5.seconds).animate(AniProps.heightHeader,
        tween: Tween(
          begin: _headerHeight,
          end: 200.0,
        ))
    // radius
    ..addScene(begin: 1.seconds, end: 2.seconds).animate(AniProps.radius,
        tween: Tween(
          begin: _borderRadius,
          end: 100.0,
        ))
    // panelHeight
    ..addScene(begin: 0.5.seconds, end: 1.5.seconds).animate(AniProps.panelHeight,
        tween: Tween(
          begin: _pannelHeight,
          end: 50.0,
        ))
    //panelWidth
    ..addScene(begin: 1.5.seconds, end: 2.seconds).animate(AniProps.panelWidth,
        tween: Tween(
          begin: _pannelWidth,
          end: 50.0,
        ))

    // colorHeader
    ..addScene(begin: 1.5.seconds, end: 2.5.seconds).animate(
      AniProps.colorHeader,
      tween: ColorTween(begin: _colorHeaderLogin, end: _colorHeaderSignUp),
    )

    // heightHeader
    ..addScene(begin: 3.seconds, end: 4.seconds).animate(AniProps.heightHeader,
        tween: Tween(
          begin: 200,
          end: _headerHeight,
        ))
    // radius
    ..addScene(begin: 2.seconds, end: 4.seconds).animate(AniProps.radius,
        tween: Tween(
          begin: 100.0,
          end: _borderRadius,
        ))
    // panelHeight
    ..addScene(begin: 2.5.seconds, end: 3.5.seconds).animate(AniProps.panelHeight,
        tween: Tween(
          begin: 50.0,
          end: _pannelHeight,
        ))
    //panelWidth
    ..addScene(begin: 2.seconds, end: 2.5.seconds).animate(AniProps.panelWidth,
        tween: Tween(
          begin: 50.0,
          end: _pannelWidth,
        ))
    ..addScene(begin: 0.seconds, end: 4.seconds).animate(AniProps.percent,
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ));

  void switchForm() {
    toggleDirection();
    _isLogin = !_isLogin;
  }

  void toggleDirection() {
    setState(() {
      // toggle between control instructions
      _customAnimationControl = (_customAnimationControl == CustomAnimationControl.play) ? CustomAnimationControl.playReverse : CustomAnimationControl.play;
    });
  }

  void animationListner({required double percent}) {
    if (percent >= 0.5) {
      _authState = AuthState.signup;
    } else {
      _authState = AuthState.login;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthStaggeredAnimationView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CustomAnimation<TimelineValue<AniProps>>(
              tween: _tween,
              control: _customAnimationControl,
              curve: Curves.ease,
              //developerMode: true,
              duration: _tween.duration,
              animationStatusListener: (status) {},
              builder: (context, child, value) {
                var radius = value.get<double>(AniProps.radius);
                var pannelWidth = value.get<double>(AniProps.panelWidth);
                var pannelHeight = value.get<double>(AniProps.panelHeight);
                var headerHeight = value.get<double>(AniProps.heightHeader);
                Color colorHeader = value.get(AniProps.colorHeader);
                animationListner(percent: value.get<double>(AniProps.percent));

                return InkWell(
                  onTap: () => switchForm(),
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                      child: Container(
                        width: pannelWidth,
                        height: pannelHeight,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: headerHeight,
                              color: colorHeader,
                              child: _authState == AuthState.login
                                  ? TextHeader(
                                      title: 'Login',
                                    )
                                  : TextHeader(
                                      title: 'Sign Up',
                                    ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(16),
                                child: SingleChildScrollView(
                                  child: Container(
                                    child: _authState == AuthState.login
                                        ? LoginForm(
                                            onSignUpPressed: () {
                                              switchForm();
                                            },
                                          )
                                        : SignUpForm(
                                            onLoginPressed: () {
                                              switchForm();
                                            },
                                          ),
                                  ),
                                )),
                          ],
                        ),
                      )),
                );
              }),
        ),
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ));
  }
}
