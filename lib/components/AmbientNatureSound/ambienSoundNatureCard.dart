import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moods/components/gradientAnimatedContainer.dart';
import 'package:moods/constants/constants.dart';
import 'package:uuid/uuid.dart';

class AmbienSoundNatureCard extends StatefulWidget {
  final List<dynamic> soundCardItem;
  final Function(List<dynamic>) onSelectionChanged;

  const AmbienSoundNatureCard(
      {Key key, this.soundCardItem, this.onSelectionChanged})
      : super(key: key);

  @override
  _AmbienSoundNatureCardState createState() => _AmbienSoundNatureCardState();
}

class _AmbienSoundNatureCardState extends State<AmbienSoundNatureCard> {
  List<dynamic> selectedChoices = [];

  var uuid = Uuid();

  AudioPlayer player;
  AudioCache audioCache = AudioCache(prefix: 'asstes/SoundEffects/');

  /// Compulsory
  playMusic(String filePath) async {
    player = await audioCache.loop(filePath);
  }

  /// Compulsory
  stopMusic() async {
    player?.stop();
  }

  @override
  void dispose() {
    player.release();
    player.dispose();
    audioCache.clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildSoundCard(context);
  }

  Widget buildSoundCard(BuildContext context) {
    List<Widget> card = [];

    widget.soundCardItem.forEach((item) {
      GradientAnimatedContainer choiceCard = GradientAnimatedContainer(
        isSelected: selectedChoices.contains(item),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () {
              setState(() {
                if (selectedChoices.contains(item)) {
                  selectedChoices.remove(item);
                  stopMusic();
                } else {
                  selectedChoices.add(item);
                  playMusic(item['audio']);
                }

                widget.onSelectionChanged(selectedChoices);
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: TextStyle(
                        color: Constants.kPrimaryColor,
                        fontSize: 22,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 15, top: 15),
                      child: Align(
                        child: SvgPicture.asset(
                          item['icon'],
                          height: 100,
                          color: Constants.kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      card.add(choiceCard);
    });

    return Column(children: card);
  }
}
