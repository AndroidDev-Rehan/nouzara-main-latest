// To parse this JSON data, do
//
//     final videosData = videosDataFromJson(jsonString);

import 'dart:convert';

List<VideosData> videosDataFromJson(String str) => List<VideosData>.from(json.decode(str).map((x) => VideosData.fromJson(x)));

String videosDataToJson(List<VideosData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideosData {
  VideosData({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.author,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.meta,
    this.jetpackVideopressGuid,
    this.jetpackVideopress,
    this.jetpackSharingEnabled,
    this.description,
    this.caption,
    this.altText,
    this.mediaType,
    this.mimeType,
    this.mediaDetails,
    this.post,
    this.sourceUrl,
    this.links,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Caption? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Caption? title;
  int? author;
  String? commentStatus;
  String? pingStatus;
  String? template;
  List<dynamic>? meta;
  String? jetpackVideopressGuid;
  JetpackVideopress? jetpackVideopress;
  bool? jetpackSharingEnabled;
  Caption? description;
  Caption? caption;
  String? altText;
  String? mediaType;
  String? mimeType;
  MediaDetails? mediaDetails;
  int? post;
  String? sourceUrl;
  Links? links;

  factory VideosData.fromJson(Map<String, dynamic> json) => VideosData(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    dateGmt: DateTime.parse(json["date_gmt"]),
    guid: Caption.fromJson(json["guid"]),
    modified: DateTime.parse(json["modified"]),
    modifiedGmt: DateTime.parse(json["modified_gmt"]),
    slug: json["slug"],
    status: json["status"],
    type: json["type"],
    link: json["link"],
    title: Caption.fromJson(json["title"]),
    author: json["author"],
    commentStatus: json["comment_status"],
    pingStatus: json["ping_status"],
    template: json["template"],
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    jetpackVideopressGuid: json["jetpack_videopress_guid"],
    jetpackVideopress: JetpackVideopress.fromJson(json["jetpack_videopress"]),
    jetpackSharingEnabled: json["jetpack_sharing_enabled"],
    description: Caption.fromJson(json["description"]),
    caption: Caption.fromJson(json["caption"]),
    altText: json["alt_text"],
    mediaType: json["media_type"],
    mimeType: json["mime_type"],
    mediaDetails: MediaDetails.fromJson(json["media_details"]),
    post: json["post"] == null ? null : json["post"],
    sourceUrl: json["source_url"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date!.toIso8601String(),
    "date_gmt": dateGmt!.toIso8601String(),
    "guid": guid!.toJson(),
    "modified": modified!.toIso8601String(),
    "modified_gmt": modifiedGmt!.toIso8601String(),
    "slug": slug,
    "status": status,
    "type": type,
    "link": link,
    "title": title!.toJson(),
    "author": author,
    "comment_status": commentStatus,
    "ping_status": pingStatus,
    "template": template,
    "meta": List<dynamic>.from(meta!.map((x) => x)),
    "jetpack_videopress_guid": jetpackVideopressGuid,
    "jetpack_videopress": jetpackVideopress!.toJson(),
    "jetpack_sharing_enabled": jetpackSharingEnabled,
    "description": description!.toJson(),
    "caption": caption!.toJson(),
    "alt_text": altText,
    "media_type": mediaType,
    "mime_type": mimeType,
    "media_details": mediaDetails!.toJson(),
    "post": post == null ? null : post,
    "source_url": sourceUrl,
    "_links": links!.toJson(),
  };
}

class Caption {
  Caption({
    this.rendered,
  });

  String? rendered;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class JetpackVideopress {
  JetpackVideopress({
    this.guid,
    this.rating,
    this.allowDownload,
    this.privacySetting,
  });

  dynamic guid;
  dynamic rating;
  int? allowDownload;
  int? privacySetting;

  factory JetpackVideopress.fromJson(Map<String, dynamic> json) => JetpackVideopress(
    guid: json["guid"],
    rating: json["rating"],
    allowDownload: json["allow_download"],
    privacySetting: json["privacy_setting"],
  );

  Map<String, dynamic> toJson() => {
    "guid": guid,
    "rating": rating,
    "allow_download": allowDownload,
    "privacy_setting": privacySetting,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
    replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": List<dynamic>.from(about!.map((x) => x.toJson())),
    "author": List<dynamic>.from(author!.map((x) => x.toJson())),
    "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
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

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}

class MediaDetails {
  MediaDetails({
    this.filesize,
    this.mimeType,
    this.length,
    this.lengthFormatted,
    this.width,
    this.height,
    this.fileformat,
    this.dataformat,
    this.audio,
    this.createdTimestamp,
    this.sizes,
  });

  int? filesize;
  String? mimeType;
  int? length;
  String? lengthFormatted;
  int? width;
  int? height;
  String? fileformat;
  String? dataformat;
  Audio? audio;
  int? createdTimestamp;
  Sizes? sizes;

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
    filesize: json["filesize"],
    mimeType: json["mime_type"],
    length: json["length"],
    lengthFormatted: json["length_formatted"],
    width: json["width"],
    height: json["height"],
    fileformat: json["fileformat"],
    dataformat: json["dataformat"],
    audio: Audio.fromJson(json["audio"]),
    createdTimestamp: json["created_timestamp"],
    sizes: Sizes.fromJson(json["sizes"]),
  );

  Map<String, dynamic> toJson() => {
    "filesize": filesize,
    "mime_type": mimeType,
    "length": length,
    "length_formatted": lengthFormatted,
    "width": width,
    "height": height,
    "fileformat": fileformat,
    "dataformat": dataformat,
    "audio": audio!.toJson(),
    "created_timestamp": createdTimestamp,
    "sizes": sizes!.toJson(),
  };
}

class Audio {
  Audio({
    this.dataformat,
    this.codec,
    this.sampleRate,
    this.channels,
    this.bitsPerSample,
    this.lossless,
    this.channelmode,
  });

  String? dataformat;
  String? codec;
  int? sampleRate;
  int? channels;
  int? bitsPerSample;
  bool? lossless;
  String? channelmode;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
    dataformat: json["dataformat"],
    codec: json["codec"],
    sampleRate: json["sample_rate"],
    channels: json["channels"],
    bitsPerSample: json["bits_per_sample"],
    lossless: json["lossless"],
    channelmode: json["channelmode"],
  );

  Map<String, dynamic> toJson() => {
    "dataformat": dataformat,
    "codec": codec,
    "sample_rate": sampleRate,
    "channels": channels,
    "bits_per_sample": bitsPerSample,
    "lossless": lossless,
    "channelmode": channelmode,
  };
}

class Sizes {
  Sizes();

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
  );

  Map<String, dynamic> toJson() => {
  };
}
