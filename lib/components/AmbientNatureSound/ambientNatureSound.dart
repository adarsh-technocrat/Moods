import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';
import 'package:moods/components/AmbientNatureSound/ambienSoundNatureCard.dart';
import 'package:moods/components/gradientAnimatedContainer.dart';

class AmbientNatureSound extends StatefulWidget {
  const AmbientNatureSound({Key key}) : super(key: key);

  @override
  _AmbientNatureSoundState createState() => _AmbientNatureSoundState();
}

class _AmbientNatureSoundState extends State<AmbientNatureSound> {
  static bool isSelected = false;
  final player = AudioPlayer();
  Future<void> playAudio() async {
    var duration = await player.setAsset('asstes/Sound Effects/rain.wav');
    player.setLoopMode(LoopMode.all);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return GradientAnimatedContainer(
        isSelected: isSelected,
        child: AmbienSoundNatureCard(
          onPress: () {
            setState(() {
              isSelected = !isSelected;
              if (isSelected) {
                playAudio();
              } else {
                player.stop();
              }
            });
          },
        ));
  }
}
