import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tou_caro_app/main.dart';
import '../screens/home_screen.dart';
import '../widgets/on_boarding_data.dart';
import '../app_styles.dart';
import '../size_configs.dart';
import '../widgets/widgets.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH;
    double sizeV = SizeConfig.blockSizeV;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: sizeV * 10,
                      ),
                      Text(
                        onboardingContents[index].title,
                        style: kTitle,
                      ),
                      SizedBox(
                        height: sizeV * 2,
                      ),
                      Container(
                        height: sizeV * 50,
                        child: Text(
                          onboardingContents[index].subTitle,
                          style: kBodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xFF000000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   /* currentPage == onboardingContents.length - 1
                        ? MyTextButton(
                            buttonName: 'Démarrer',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ));
                            },
                            bgColor: kPrimaryColor,
                          )
                        : */
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              if(currentPage < 3)
                              TextButton(
                                child: const Text('Annuler',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                onPressed: () {
                                  
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                },
                              ),
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              OnBoardNavBtn(
                                name: currentPage == 3 ? 'TERMINER' : 'SUIVANT',
                                onPressed: () {
                                  if(currentPage == 3 ) {
                                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                                  }
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              )
                            ],
                          ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
