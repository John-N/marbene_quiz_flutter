import 'package:get/get.dart';

import '../../../services/authentication_service.dart';
import '../../../services/database_service.dart';
import '../../question/model/question.dart';
import '../model/quiz.dart';

class QuizRepository {
  final _databaseService = Get.find<DatabaseService>();
  final _userId = Get.find<AuthenticationService>().user.uid;

  String get _quizPath => 'flamelink/quiz/$_userId/';

  Future<void> createQuiz(List<Question> questions) async {
    final assesments = _createAssessments(questions)
      ..shuffle(); // Shuffle assesments for variability
    final creationTimeStamp = DateTime.now().millisecondsSinceEpoch;
    final quiz = Quiz(
      id: creationTimeStamp,
      assessments: assesments,
    );
    await _databaseService.setData(_quizPath, creationTimeStamp, quiz.toMap());
  }

  Future<List<Quiz>> getAllPreviousQuiz() async {
    final snapshot = await _databaseService.getSnapshot(_quizPath);
    return Map<String, dynamic>.from(snapshot.value ?? {})
        ?.values
        ?.map((map) => Quiz.fromMap(Map<String, dynamic>.from(map)))
        ?.toList();
  }

  List<Assessment> _createAssessments(List<Question> questions) {
    return questions?.map((question) => question?.newAssessment)?.toList();
  }
}
