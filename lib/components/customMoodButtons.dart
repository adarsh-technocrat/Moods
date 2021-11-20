import 'package:flutter/material.dart';
import 'package:moods/constants/constants.dart';
import 'package:moods/provider/readJsonDataProvider.dart';
import 'package:provider/provider.dart';

class CustomMoodButtons extends StatefulWidget {
  const CustomMoodButtons({Key key}) : super(key: key);

  @override
  _CustomMoodButtonsState createState() => _CustomMoodButtonsState();
}

class _CustomMoodButtonsState extends State<CustomMoodButtons> {
  @override
  void initState() {
    final provider = Provider.of<ReadJsonDataProvider>(context, listen: false);
    provider.readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReadJsonDataProvider>(builder: (context, provider, child) {
      if (provider.items != null) {
        var items = provider.items.items;
        return Container(
          child: Row(
              children: List.generate(
                  items.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            print(items[index].title);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white.withOpacity(0.9),
                              side: BorderSide(
                                color: Constants.kBlueColor,
                                width: 1,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Text(
                                items[index].title,
                                style: TextStyle(color: Constants.kBlueColor),
                              ),
                            ),
                          ),
                        ),
                      ))),
        );
      }
      return Container();
    });
  }
}
