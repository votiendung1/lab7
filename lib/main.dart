import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

StoryBrain storyBrain = StoryBrain();

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  void updateStory(int choiceNumber) {
    setState(() {
      storyBrain.nextStory(choiceNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => updateStory(1),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () => updateStory(2),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
