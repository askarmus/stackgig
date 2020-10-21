class AnswerModel {
  List<Answer> answer;
  String topic;
  int difficulty;
  int votes;
  int unvotes;
  String source;
  String sourceUrl;
  String type;
  bool checked;
  String title;
  bool isFavQuiz;

  AnswerModel(
      {this.answer,
      this.topic,
      this.difficulty,
      this.votes,
      this.unvotes,
      this.source,
      this.sourceUrl,
      this.type,
      this.checked,
      this.title,
      this.isFavQuiz});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    if (json['answer'] != null) {
      answer = new List<Answer>();
      json['answer'].forEach((v) {
        answer.add(new Answer.fromJson(v));
      });
    }
    topic = json['topic'];
    difficulty = json['difficulty'];
    votes = json['votes'];
    unvotes = json['unvotes'];
    source = json['source'];
    sourceUrl = json['sourceUrl'];
    type = json['type'];
    checked = json['checked'];
    title = json['title'];
    isFavQuiz = json['isFavQuiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answer != null) {
      data['answer'] = this.answer.map((v) => v.toJson()).toList();
    }
    data['topic'] = this.topic;
    data['difficulty'] = this.difficulty;
    data['votes'] = this.votes;
    data['unvotes'] = this.unvotes;
    data['source'] = this.source;
    data['sourceUrl'] = this.sourceUrl;
    data['type'] = this.type;
    data['checked'] = this.checked;
    data['title'] = this.title;
    data['isFavQuiz'] = this.isFavQuiz;
    return data;
  }
}

class Answer {
  String answer;
  bool isCorrect;
  int id;

  Answer({this.answer, this.isCorrect, this.id});

  Answer.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    isCorrect = json['isCorrect'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['isCorrect'] = this.isCorrect;
    data['id'] = this.id;
    return data;
  }
}
