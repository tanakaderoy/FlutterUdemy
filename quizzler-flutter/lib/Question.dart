class Question {
  String _question;
  bool _answer;


  String get question => _question;

  set question(String question) {
    _question = question;
  }

  bool get answer => _answer;

  set answer(bool answer) {
    _answer = answer;
  }

  @override
  String toString() {
    return 'Question{question: $question, answer: $answer}';
  }

  Question(this._question, this._answer);


}