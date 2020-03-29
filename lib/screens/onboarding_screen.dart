import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/auth_sign_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final List<Widget> onBoardingPages = [
    OnboardingPageA(),
    OnboardingPageB(),
    OnboardingPageC(),
    OnboardingPageD(),
  ];

  int page = 0;
  PageController controller = PageController(
    initialPage: 0,
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        SizedBox.expand(
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: onBoardingPages,
            onPageChanged: (num) {
              setState(() {
                page = num;
                print("<<<<<<<<<<<<<< $page");
              });
            },
          ),
        ),
        SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                            child: Text("Skip"),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AuthSignUpScreen.routeName);
                            }),
                        RaisedButton(
                          child: Text("Next"),
                          onPressed: () {
                            if ( page < onBoardingPages.length-1) {
                              print("<<<<<<<<<<<< $page <<<>> ${page+1}");
                              controller.animateToPage(page+1, duration: Duration(milliseconds: 600), curve: Curves.ease);
//                              controller.animateToPage(page+1);
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                      ]),
                ),
              ]),
        ),
      ]),
    );
  }
}

class OnboardingPageA extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 240,
                height: 240,
                child: Image.asset(
                  "assets/images/slide-payment.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Pay With Ease!",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Payment for utility is as quick and easy as it should be",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
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

class OnboardingPageB extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 240,
                height: 240,
                child: Image.asset(
                  "assets/images/slide-analysis.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Realtime Analysis!",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Understand your usage always and get optimization recommedations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
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

class OnboardingPageC extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 240,
                height: 240,
                child: Image.asset(
                  "assets/images/slide-community.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Recharge for anybody",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Pay for friends and family and manage multiple meters",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
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

class OnboardingPageD extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 240,
                height: 240,
                child: Image.asset(
                  "assets/images/slide-versatile.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Vast and Wide Coverage",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "You don't miss out on anything, we have all your needs covered",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
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
