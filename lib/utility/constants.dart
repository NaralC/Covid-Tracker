import 'package:flutter/material.dart';

// Colors
const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);

// Text Style
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w300,
);

const kSubTextStyle = TextStyle(fontSize: 16, color: kTextLightColor);

const kTitleTextStyle = TextStyle(
  fontSize: 25,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
);

const kNumberTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w200,
);

final washHandsURL =
    'https://www.cdc.gov/handwashing/when-how-handwashing.html';
final washHandsImage = 'assets/icons/wash_hands.png';
final washHandsTitle = 'Wash Your Hands!\n';
final washHandsDescription = "Washing hands can keep you healthy and \n"
    "prevent the spread of respiratory and diarrheal \ninfections "
    "from one person to the next.";

final wearMaskURL =
    'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks';
final wearMaskImage = 'assets/icons/wear_mask.png';
final wearMaskTitle = 'Wear Your Mask!\n';
final wearMaskDescription = "Masks should be used as part of a strategy \n"
    "of measures to suppress transmission and \n"
    "save lives; ";

final String whoURL =
    'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub';
final whoImage = 'assets/icons/who_logo.png';
final whoTitle = 'Learn More From WHO!\n';
final whoDescription = "See a list of frequently asked questions\n"
    "comprehensively gathered in one place.";

final String hospitalURL =
    'https://www.bangkokhearthospital.com/en/content/prevention-of-covid-19-disease';
final hospitalImage = 'assets/icons/bangkok_hospital.png';
final hospitalTitle = 'Learn More Safety Measures!\n';
final hospitalDescription = "Catch up with the current global situation \n"
    "and how you can make valuable contributions \n"
    "to the world. ";
