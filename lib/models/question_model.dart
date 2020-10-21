class QuestionModel {
  List<Questions> questions;
  Topic topic;

  QuestionModel({this.questions, this.topic});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
    topic = json['topic'] != null ? new Topic.fromJson(json['topic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    if (this.topic != null) {
      data['topic'] = this.topic.toJson();
    }
    return data;
  }
}

class Questions {
  String title;
  String topic;
  String sourceUrl;
  bool isPro;
  int id;
  String answer;
  String source;
  int votes;
  int unvotes;
  int difficulty;
  bool unLocked;
  bool isEdit;
  String type;
  int topicId;
  int orderId;
  bool isFavourite;

  Questions(
      {this.title,
      this.topic,
      this.sourceUrl,
      this.isPro,
      this.id,
      this.answer,
      this.source,
      this.votes,
      this.unvotes,
      this.difficulty,
      this.unLocked,
      this.isEdit,
      this.type,
      this.topicId,
      this.orderId,
      this.isFavourite});

  Questions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    topic = json['topic'];
    sourceUrl = json['sourceUrl'];
    isPro = json['isPro'];
    id = json['id'];
    answer = json['answer'];
    source = json['source'];
    votes = json['votes'];
    unvotes = json['unvotes'];
    difficulty = json['difficulty'];
    unLocked = json['unLocked'];
    isEdit = json['isEdit'];
    type = json['type'];
    topicId = json['topicId'];
    orderId = json['orderId'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['topic'] = this.topic;
    data['sourceUrl'] = this.sourceUrl;
    data['isPro'] = this.isPro;
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['source'] = this.source;
    data['votes'] = this.votes;
    data['unvotes'] = this.unvotes;
    data['difficulty'] = this.difficulty;
    data['unLocked'] = this.unLocked;
    data['isEdit'] = this.isEdit;
    data['type'] = this.type;
    data['topicId'] = this.topicId;
    data['orderId'] = this.orderId;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}

class Topic {
  String name;
  String imageUrl;
  int totalQuestion;
  int id;
  Null blogTitle;
  String updatedOn;
  Null blogUrl;
  Null metaDescription;
  int totalView;
  Null isActive;
  String friendlyTopic;
  String ogImageUrl;

  Topic(
      {this.name,
      this.imageUrl,
      this.totalQuestion,
      this.id,
      this.blogTitle,
      this.updatedOn,
      this.blogUrl,
      this.metaDescription,
      this.totalView,
      this.isActive,
      this.friendlyTopic,
      this.ogImageUrl});

  Topic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    totalQuestion = json['totalQuestion'];
    id = json['id'];
    blogTitle = json['blogTitle'];
    updatedOn = json['updatedOn'];
    blogUrl = json['blogUrl'];
    metaDescription = json['metaDescription'];
    totalView = json['totalView'];
    isActive = json['isActive'];
    friendlyTopic = json['friendlyTopic'];
    ogImageUrl = json['ogImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['totalQuestion'] = this.totalQuestion;
    data['id'] = this.id;
    data['blogTitle'] = this.blogTitle;
    data['updatedOn'] = this.updatedOn;
    data['blogUrl'] = this.blogUrl;
    data['metaDescription'] = this.metaDescription;
    data['totalView'] = this.totalView;
    data['isActive'] = this.isActive;
    data['friendlyTopic'] = this.friendlyTopic;
    data['ogImageUrl'] = this.ogImageUrl;
    return data;
  }
}
