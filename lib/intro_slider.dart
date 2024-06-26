import 'package:flutter/material.dart';
import 'package:hear_it_through/conversion.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<ContentConfig> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      const ContentConfig(
        title: "Hi there!",
        styleTitle: TextStyle(
          color: Colors.indigo,
          fontFamily: 'Poppins',
          fontSize: 40.0,
          fontWeight: FontWeight.w700,
        ),
        description:
            "Hello, I'm Signify's\nvirtual translator of sign\nlanguage and I will help you.",
        styleDescription: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18.0,
          color: Colors.blue,
        ),
        pathImage: "images/432008031_FOLDED_HANDS_3D_LIGHT_SKIN_TONE_400px.gif",
      ),
    );
    slides.add(const ContentConfig(
      title: "About App",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description:
          "Signify uses NLP\nto translate speech to ISL\nand helps you learn and\nunderstand sign language.",
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        color: Colors.blue,
      ),
      pathImage: "images/istockphoto-1316073865-612x612.jpg",
    ));
    slides.add(const ContentConfig(
      title: "How It Works",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description:
          "The app uses Natural Language\nProcessing (NLP) to translate\nfrom English to ISL.\nIt means that input\nspeech will be converted\nto text and matching sign\nlanguage interpretation will\nbe shown.",
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        color: Colors.blue,
      ),
      pathImage: "images/istockphoto-1226921545-612x612.jpg",
    ));
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Conversion()));
  }

  void onSkipPress() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Conversion()));
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      ContentConfig currentSlide = slides[i];
      tabs.add(SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: const EdgeInsets.only(bottom: 100, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: CircleAvatar(
                  radius: 120.0,
                  backgroundImage: AssetImage(currentSlide.pathImage ?? " "),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                child: Text(
                  currentSlide.title ?? " ",
                  style: const TextStyle(
                    color: Colors.indigo,
                    fontFamily: 'Poppins',
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  currentSlide.description ?? " ",
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              )
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllTabs: Colors.white,
      renderSkipBtn: const Text("Skip",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          )),
      renderNextBtn: const Text("Next",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          )),
      renderDoneBtn: const Text("Done",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          )),
      doneButtonStyle: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue)),
      indicatorConfig: const IndicatorConfig(
        colorActiveIndicator: Colors.blue,
        sizeIndicator: 8.0,
        typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
      ),
      listCustomTabs: renderListCustomTabs(),
      onDonePress: onDonePress,
      onSkipPress: onSkipPress,
      scrollPhysics: const BouncingScrollPhysics(),
      // hideStatusBar: false,
    );
  }
}
