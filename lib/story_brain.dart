import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
        storyTitle: 'Câu chuyện 1',
        choice1: 'Lựa chọn 1',
        choice2: 'Lựa chọn 2'),
    Story(
        storyTitle: 'Câu chuyện 2',
        choice1: 'Lựa chọn 1',
        choice2: 'Lựa chọn 2'),
    Story(
        storyTitle: 'Câu chuyện 3',
        choice1: 'Lựa chọn 1',
        choice2: 'Lựa chọn 2'),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (_storyNumber == 1) {
      _storyNumber = 2; // hoặc giá trị khác tùy vào logic câu chuyện
    } else if (_storyNumber == 2) {
      _storyNumber = 0; // Đặt lại về đầu hoặc logic khác
    }

    // Đảm bảo _storyNumber không vượt quá chỉ số cuối cùng của _storyData
    if (_storyNumber >= _storyData.length) {
      _storyNumber =
          _storyData.length - 1; // Hoặc đặt lại về 0 nếu muốn lặp lại
    }
  }

  bool buttonShouldBeVisible() {
    return _storyNumber < _storyData.length - 1;
  }
}
