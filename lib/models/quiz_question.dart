class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final res = List.of(answers);
    res.shuffle();
    return res;
  }
}
