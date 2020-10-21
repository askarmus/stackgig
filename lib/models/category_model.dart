class TopicModel {
  String name;
  String imageUrl;
  int totalQuestion;
  int id;
  String blogTitle;
  String updatedOn;
  String blogUrl;
  String metaDescription;
  int totalView;
  String isActive;
  String friendlyTopic;
  String ogImageUrl;

  TopicModel(
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

  TopicModel.fromJson(Map<String, dynamic> json) {
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
}
