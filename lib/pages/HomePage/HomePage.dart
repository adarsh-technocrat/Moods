import 'package:flutter/material.dart';
import 'package:moods/components/AmbientNatureSound/ambientNatureSound.dart';
import 'package:moods/components/BuyMeACoffeeComponent/buyMeACoffeeWidget.dart';
import 'package:moods/components/BuyMeACoffeeComponent/buyMeCoffeeThemeData.dart';
import 'package:moods/components/customMoodButtons.dart';
import 'package:moods/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Moodes",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Constants.kPrimaryColor,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              child: BuyMeACoffeeWidget(
                sponsorID: "AdarshKumar",
                theme: BlueTheme(),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Constants.kBlueColor,
                    width: 2,
                  )),
              child: Center(
                child: Icon(
                  Icons.shuffle,
                  color: Constants.kBlueColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asstes/images/backgroundImage.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Constants.kBackgroundFilterColor, BlendMode.exclusion)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CustomMoodButtons(), AmbientNatureSound()],
          ),
        ),
      ),
    );
  }
}
