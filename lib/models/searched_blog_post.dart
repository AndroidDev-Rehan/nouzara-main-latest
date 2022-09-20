// To parse this JSON data, do
//
//     final searchBlogPost = searchBlogPostFromJson(jsonString);

import 'dart:convert';

List<SearchBlogPost> searchBlogPostFromJson(String str) => List<SearchBlogPost>.from(json.decode(str).map((x) => SearchBlogPost.fromJson(x)));

String searchBlogPostToJson(List<SearchBlogPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchBlogPost {
  SearchBlogPost({
    this.id,
    this.title,
    this.url,
    this.type,
    this.subtype,
    this.links,
  });

  int? id;
  String? title;
  String? url;
  Type? type;
  Type? subtype;
  Links? links;

  factory SearchBlogPost.fromJson(Map<String, dynamic> json) => SearchBlogPost(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    type: typeValues.map[json["type"]],
    subtype: typeValues.map[json["subtype"]],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "type": typeValues.reverse[type],
    "subtype": typeValues.reverse[subtype],
    "_links": links!.toJson(),
  };
}

class Links {
  Links({
    this.self,
    this.about,
    this.collection,
  });

  List<Self>? self;
  List<About>? about;
  List<About>? collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Self>.from(json["self"].map((x) => Self.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
    "about": List<dynamic>.from(about!.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
  };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Self {
  Self({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Self.fromJson(Map<String, dynamic> json) => Self(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}

enum Type { POST }

final typeValues = EnumValues({
  "post": Type.POST
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
