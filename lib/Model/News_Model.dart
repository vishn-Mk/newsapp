class NewsModel {

  String? title;
  String? name;
  String? author;
  String? description;
  String? content;
  String? publishedAt;
  String? url;
  dynamic? image;



  NewsModel({this.title, this.name, this.description, this.content, this.publishedAt, this.image,this.author,this.url,});

  NewsModel.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    name = json['name'];
    description = json['description'];
    content = json['content'];
    publishedAt = json['publishedAt'];
    image = json['image'];
    author=json['author'];
    url=json['url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['name'] = this.name;
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['image'] = this.image;
    data['author'] = this.author;
    data['author']=this.url;

    return data;
  }
}
