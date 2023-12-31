class RestApis {
  // static const String baseUrl = 'https://llapp-c4c193b5e787.herokuapp.com';
  static const String baseUrl = 'https://lla-app-pyssj.ondigitalocean.app';

  // LI
  static const String resumableUpload = '/generate_resumable_upload_url';
  static const String learningItems = '/learning_items';
  static const String generateLabel = '/learning_items/generate_label';
  static const String generateSentences = '/learning_items/generate_sentences';

  // Topic
  static const String topics = '/topics';
  static const String topicsWithTotalLI = '/topics/with_learning_items_count';

  // Flashcard
  static const String learningFlashcards = '/flashcards/learning';
  static const String completeFlashcards = '/flashcards/complete';

  // User
  static const String verifyAccessToken = '/lla';
  static const String login = '/login';
  static const String signUp = '/signup';
}

class ParamKeys {
  // static const String phoneNumber = 'phone_number';
}
