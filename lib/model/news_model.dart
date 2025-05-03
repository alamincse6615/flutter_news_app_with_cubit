class NewsModelData {
  String? status;
  int? totalResults;
  List<NewsModel>? results;
  int? nextPage;

  NewsModelData({this.status, this.totalResults, this.results, this.nextPage});

  NewsModelData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <NewsModel>[];
      json['results'].forEach((v) {
        results!.add(NewsModel.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class NewsModel {
  String? id;
  String? name;
  String? url;
  String? icon;
  int? priority;
  String? description;
  List<String>? category;
  List<String>? language;
  List<String>? country;
  int? totalArticle;
  String? lastFetch;

  NewsModel(
      {this.id,
        this.name,
        this.url,
        this.icon,
        this.priority,
        this.description,
        this.category,
        this.language,
        this.country,
        this.totalArticle,
        this.lastFetch});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??json['article_id'];
    name = json['name']??json['title'];
    url = json['url']??json['link'];
    icon = json['icon']??json['image_url'];
    priority = json['priority'];
    description = json['description'];
    try{
      category = json['category'].cast<String>();
      language = json['language'].cast<String>();
      country = json['country'].cast<String>();
    }catch(e){
      print(e.toString());
    }
    totalArticle = json['total_article'];
    lastFetch = json['last_fetch']??json['pubDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['icon'] = icon;
    data['priority'] = priority;
    data['description'] = description;
    data['category'] = category;
    data['language'] = language;
    data['country'] = country;
    data['total_article'] = totalArticle;
    data['last_fetch'] = lastFetch;
    return data;
  }
}
