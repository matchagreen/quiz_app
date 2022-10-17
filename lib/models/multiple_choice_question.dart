import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/results.dart';
import 'package:quiz_app/models/score.dart';


/// Contains the information for a question
/// where the user needs select one of the
/// provided alternatives.
class MultipleChoiceQuestion extends Question {
  final String _stem;
  final List _choices;
  final int _answer;
  /// User provided answer.
  int? userAnswer;

  /// Immutable list of strings detailing
  /// possible answers to the prompt. Only
  /// one of them is correct.
  List get choices => _choices;
  /// Correct answer.
  int get answer => _answer;

  /// Initializes the question. User answer
  /// must be provided afterwards.
  MultipleChoiceQuestion(this._stem, this._choices, this._answer);

  /// Returns a score of 0/1 or 1/1 depending
  /// whether or not the user answer matches
  /// the correct answer.
  @override
  QuestionResult evaluate() {
    var points = userAnswer == _answer ? 1 : 0;
    var score =  Score(points, 1);

    return QuestionResult(
      stem,
      choices[answer],
      userAnswer == null ? userAnswer : choices[userAnswer!],
      score
    );
  }
  
  /// The prompt to the question.
  @override
  String get stem => _stem;
}