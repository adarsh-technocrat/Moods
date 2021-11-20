import 'package:flutter/material.dart';
import 'package:moods/components/AmbientNatureSound/ambienSoundNatureCard.dart';

class AmbientNatureSound extends StatefulWidget {
  const AmbientNatureSound({Key key}) : super(key: key);

  @override
  _AmbientNatureSoundState createState() => _AmbientNatureSoundState();
}

class _AmbientNatureSoundState extends State<AmbientNatureSound> {
  List<dynamic> selectedSound = [];

  List<dynamic> soundCardItem = [
    {"title": "Rain", "icon": "asstes/icons/rain.svg", "audio": "rain.wav"},
    {
      "title": "Lightning",
      "icon": "asstes/icons/lightning.svg",
      "audio": "thunder-storm.wav"
    },
    {
      "title": "Snow",
      "icon": "asstes/icons/snow.svg",
      "audio": "ES_Wind Leaves 2 - SFX Producer.mp3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AmbienSoundNatureCard(
      onSelectionChanged: (selectedList) {
        setState(() {
          selectedSound = selectedList;
        });
      },
      soundCardItem: soundCardItem,
    );
  }
}
