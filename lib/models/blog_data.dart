import 'dart:convert';


class Blog {
  final String? date, title, author, description, image, category;

  Blog({this.date, this.title, this.author, this.description, this.image, this.category});
}

List<Blog> blogPosts = [
  Blog(
    date: "2 hours ago",
    image: "assets/images/corporate2.jpg",
    category: "Lifestyle",
    title: "Building friendships and Love together",
    author:"Jhon",
    description:
    "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
  Blog(
    date: "23 September 2020",
    image: "assets/images/0.png",
    category: "Design",
    title: "How Ireland’s biggest bank executed a comp lete security redesign",
    author:"Fredy Fredy",
    description:
        "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
  Blog(
    date: "21 August  2020",
    image: "assets/images/1.png",
    category: "Web",
    title: "5 Examples of Web Motion Design That Really Catch Your Eye",
    author:"Abraham",
    description:
        "Web animation has become one of the most exciting web design trends in 2020. It breathes more life into a website and makes user interactions even more appealing and intriguing. Animation for websites allows introducing a brand in an exceptionally creative way in modern digital space. It helps create a lasting impression, make a company",
  ),
  Blog(
    date: "23 September 2020",
    image: "assets/images/2.png",
    category: "UI/UX",
    title: "The Principles of Dark UI Design",
    author:"Kate",
    description:
        "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
  Blog(
    date: "23 September 2020",
    image: "assets/images/corporate.jpg",
    category: "Digital Marketing",
    title: "The Era of Digital Marketing",
    author:"Putin",
    description:
    "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
];



////////////////////////////////// API Model below
// To parse this JSON data, do
//
//     final blogsData = blogsDataFromJson(jsonString);


// To parse this JSON data, do
//
//     final blogsData = blogsDataFromJson(jsonString);


List<BlogsData> blogsDataFromJson(String str) => List<BlogsData>.from(json.decode(str).map((x) => BlogsData.fromJson(x)));

String blogsDataToJson(List<BlogsData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogsData {
  BlogsData({
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
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.ystProminentWords,
    this.jetpackFeaturedMediaUrl,
    this.jetpackSharingEnabled,
    this.links,
    this.embedded,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  StatusEnum? status;
  BlogsDatumType? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  Status? commentStatus;
  Status? pingStatus;
  bool? sticky;
  String? template;
  Format? format;
  List<dynamic>? meta;
  List<int>? categories;
  List<int>? tags;
  List<int>? ystProminentWords;
  String? jetpackFeaturedMediaUrl;
  bool? jetpackSharingEnabled;
  BlogsDatumLinks? links;
  Embedded? embedded;

  factory BlogsData.fromJson(Map<String, dynamic> json) => BlogsData(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    dateGmt: DateTime.parse(json["date_gmt"]),
    guid: Guid.fromJson(json["guid"]),
    modified: DateTime.parse(json["modified"]),
    modifiedGmt: DateTime.parse(json["modified_gmt"]),
    slug: json["slug"],
    status: statusEnumValues.map[json["status"]],
    type: blogsDatumTypeValues.map[json["type"]],
    link: json["link"],
    title: Guid.fromJson(json["title"]),
    content: Content.fromJson(json["content"]),
    excerpt: Content.fromJson(json["excerpt"]),
    author: json["author"],
    featuredMedia: json["featured_media"],
    commentStatus: statusValues.map[json["comment_status"]],
    pingStatus: statusValues.map[json["ping_status"]],
    sticky: json["sticky"],
    template: json["template"],
    format: formatValues.map[json["format"]],
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    categories: List<int>.from(json["categories"].map((x) => x)),
    tags: List<int>.from(json["tags"].map((x) => x)),
    ystProminentWords: List<int>.from(json["yst_prominent_words"].map((x) => x)),
    jetpackFeaturedMediaUrl: json["jetpack_featured_media_url"],
    jetpackSharingEnabled: json["jetpack_sharing_enabled"],
    links: BlogsDatumLinks.fromJson(json["_links"]),
    embedded: Embedded.fromJson(json["_embedded"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date!.toIso8601String(),
    "date_gmt": dateGmt!.toIso8601String(),
    "guid": guid!.toJson(),
    "modified": modified!.toIso8601String(),
    "modified_gmt": modifiedGmt!.toIso8601String(),
    "slug": slug,
    "status": statusEnumValues.reverse[status],
    "type": blogsDatumTypeValues.reverse[type],
    "link": link,
    "title": title!.toJson(),
    "content": content!.toJson(),
    "excerpt": excerpt!.toJson(),
    "author": author,
    "featured_media": featuredMedia,
    "comment_status": statusValues.reverse[commentStatus],
    "ping_status": statusValues.reverse[pingStatus],
    "sticky": sticky,
    "template": template,
    "format": formatValues.reverse[format],
    "meta": List<dynamic>.from(meta!.map((x) => x)),
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "yst_prominent_words": List<dynamic>.from(ystProminentWords!.map((x) => x)),
    "jetpack_featured_media_url": jetpackFeaturedMediaUrl,
    "jetpack_sharing_enabled": jetpackSharingEnabled,
    "_links": links!.toJson(),
    "_embedded": embedded!.toJson(),
  };
}

enum Status { OPEN }

final statusValues = EnumValues({
  "open": Status.OPEN
});

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    rendered: json["rendered"],
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
    "protected": protected,
  };
}

class Embedded {
  Embedded({
    this.author,
    this.wpFeaturedmedia,
    this.wpTerm,
  });

  List<EmbeddedAuthor>? author;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  List<List<EmbeddedWpTerm>>? wpTerm;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
    author: List<EmbeddedAuthor>.from(json["author"].map((x) => EmbeddedAuthor.fromJson(x))),
    wpFeaturedmedia: List<WpFeaturedmedia>.from(json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
    wpTerm: List<List<EmbeddedWpTerm>>.from(json["wp:term"].map((x) => List<EmbeddedWpTerm>.from(x.map((x) => EmbeddedWpTerm.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "author": List<dynamic>.from(author!.map((x) => x.toJson())),
    "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
    "wp:term": List<dynamic>.from(wpTerm!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class EmbeddedAuthor {
  EmbeddedAuthor({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.isSuperAdmin,
    this.woocommerceMeta,
    this.links,
  });

  int? id;
  AuthorName? name;
  String? url;
  String? description;
  String? link;
  Slug? slug;
  Map<String, String>? avatarUrls;
  bool? isSuperAdmin;
  WoocommerceMeta? woocommerceMeta;
  AuthorLinks? links;

  factory EmbeddedAuthor.fromJson(Map<String, dynamic> json) => EmbeddedAuthor(
    id: json["id"],
    name: authorNameValues.map[json["name"]],
    url: json["url"],
    description: json["description"],
    link: json["link"],
    slug: slugValues.map[json["slug"]],
    avatarUrls: Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
    isSuperAdmin: json["is_super_admin"],
    woocommerceMeta: WoocommerceMeta.fromJson(json["woocommerce_meta"]),
    links: AuthorLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": authorNameValues.reverse[name],
    "url": url,
    "description": description,
    "link": link,
    "slug": slugValues.reverse[slug],
    "avatar_urls": Map.from(avatarUrls!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "is_super_admin": isSuperAdmin,
    "woocommerce_meta": woocommerceMeta!.toJson(),
    "_links": links!.toJson(),
  };
}

class AuthorLinks {
  AuthorLinks({
    this.self,
    this.collection,
  });

  List<About>? self;
  List<About>? collection;

  factory AuthorLinks.fromJson(Map<String, dynamic> json) => AuthorLinks(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
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

enum AuthorName { ONYITEX_JOSEPH, OBI_HEPHZIBAH_AHAOMAKAKU }

final authorNameValues = EnumValues({
  "Obi Hephzibah Ahaomakaku": AuthorName.OBI_HEPHZIBAH_AHAOMAKAKU,
  "Onyitex Joseph": AuthorName.ONYITEX_JOSEPH
});

enum Slug { ONYITEX, HEPHZIBAH }

final slugValues = EnumValues({
  "hephzibah": Slug.HEPHZIBAH,
  "onyitex": Slug.ONYITEX
});

class WoocommerceMeta {
  WoocommerceMeta({
    this.activityPanelInboxLastRead,
    this.activityPanelReviewsLastRead,
    this.categoriesReportColumns,
    this.couponsReportColumns,
    this.customersReportColumns,
    this.ordersReportColumns,
    this.productsReportColumns,
    this.revenueReportColumns,
    this.taxesReportColumns,
    this.variationsReportColumns,
    this.dashboardSections,
    this.dashboardChartType,
    this.dashboardChartInterval,
    this.dashboardLeaderboardRows,
    this.homepageLayout,
    this.homepageStats,
    this.taskListTrackedStartedTasks,
    this.helpPanelHighlightShown,
    this.androidAppBannerDismissed,
  });

  String? activityPanelInboxLastRead;
  String? activityPanelReviewsLastRead;
  String? categoriesReportColumns;
  String? couponsReportColumns;
  String? customersReportColumns;
  String? ordersReportColumns;
  String? productsReportColumns;
  String? revenueReportColumns;
  String? taxesReportColumns;
  String? variationsReportColumns;
  String? dashboardSections;
  String? dashboardChartType;
  String? dashboardChartInterval;
  String? dashboardLeaderboardRows;
  String? homepageLayout;
  String? homepageStats;
  String? taskListTrackedStartedTasks;
  String? helpPanelHighlightShown;
  String? androidAppBannerDismissed;

  factory WoocommerceMeta.fromJson(Map<String, dynamic> json) => WoocommerceMeta(
    activityPanelInboxLastRead: json["activity_panel_inbox_last_read"],
    activityPanelReviewsLastRead: json["activity_panel_reviews_last_read"],
    categoriesReportColumns: json["categories_report_columns"],
    couponsReportColumns: json["coupons_report_columns"],
    customersReportColumns: json["customers_report_columns"],
    ordersReportColumns: json["orders_report_columns"],
    productsReportColumns: json["products_report_columns"],
    revenueReportColumns: json["revenue_report_columns"],
    taxesReportColumns: json["taxes_report_columns"],
    variationsReportColumns: json["variations_report_columns"],
    dashboardSections: json["dashboard_sections"],
    dashboardChartType: json["dashboard_chart_type"],
    dashboardChartInterval: json["dashboard_chart_interval"],
    dashboardLeaderboardRows: json["dashboard_leaderboard_rows"],
    homepageLayout: json["homepage_layout"],
    homepageStats: json["homepage_stats"],
    taskListTrackedStartedTasks: json["task_list_tracked_started_tasks"],
    helpPanelHighlightShown: json["help_panel_highlight_shown"],
    androidAppBannerDismissed: json["android_app_banner_dismissed"],
  );

  Map<String, dynamic> toJson() => {
    "activity_panel_inbox_last_read": activityPanelInboxLastRead,
    "activity_panel_reviews_last_read": activityPanelReviewsLastRead,
    "categories_report_columns": categoriesReportColumns,
    "coupons_report_columns": couponsReportColumns,
    "customers_report_columns": customersReportColumns,
    "orders_report_columns": ordersReportColumns,
    "products_report_columns": productsReportColumns,
    "revenue_report_columns": revenueReportColumns,
    "taxes_report_columns": taxesReportColumns,
    "variations_report_columns": variationsReportColumns,
    "dashboard_sections": dashboardSections,
    "dashboard_chart_type": dashboardChartType,
    "dashboard_chart_interval": dashboardChartInterval,
    "dashboard_leaderboard_rows": dashboardLeaderboardRows,
    "homepage_layout": homepageLayout,
    "homepage_stats": homepageStats,
    "task_list_tracked_started_tasks": taskListTrackedStartedTasks,
    "help_panel_highlight_shown": helpPanelHighlightShown,
    "android_app_banner_dismissed": androidAppBannerDismissed,
  };
}

class WpFeaturedmedia {
  WpFeaturedmedia({
    this.id,
    this.date,
    this.slug,
    this.type,
    this.link,
    this.title,
    this.author,
    this.jetpackSharingEnabled,
    this.caption,
    this.altText,
    this.mediaType,
    this.mimeType,
    this.mediaDetails,
    this.sourceUrl,
    this.links,
  });

  int? id;
  DateTime? date;
  String? slug;
  WpFeaturedmediaType? type;
  String? link;
  Guid? title;
  int? author;
  bool? jetpackSharingEnabled;
  Guid? caption;
  String? altText;
  MediaType? mediaType;
  MimeType? mimeType;
  MediaDetails? mediaDetails;
  String? sourceUrl;
  WpFeaturedmediaLinks? links;

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) => WpFeaturedmedia(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    type: wpFeaturedmediaTypeValues.map[json["type"]],
    link: json["link"],
    title: Guid.fromJson(json["title"]),
    author: json["author"],
    jetpackSharingEnabled: json["jetpack_sharing_enabled"],
    caption: Guid.fromJson(json["caption"]),
    altText: json["alt_text"],
    mediaType: mediaTypeValues.map[json["media_type"]],
    mimeType: mimeTypeValues.map[json["mime_type"]],
    mediaDetails: MediaDetails.fromJson(json["media_details"]),
    sourceUrl: json["source_url"],
    links: WpFeaturedmediaLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date!.toIso8601String(),
    "slug": slug,
    "type": wpFeaturedmediaTypeValues.reverse[type],
    "link": link,
    "title": title!.toJson(),
    "author": author,
    "jetpack_sharing_enabled": jetpackSharingEnabled,
    "caption": caption!.toJson(),
    "alt_text": altText,
    "media_type": mediaTypeValues.reverse[mediaType],
    "mime_type": mimeTypeValues.reverse[mimeType],
    "media_details": mediaDetails!.toJson(),
    "source_url": sourceUrl,
    "_links": links!.toJson(),
  };
}

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class WpFeaturedmediaLinks {
  WpFeaturedmediaLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<ReplyElement>? author;
  List<ReplyElement>? replies;

  factory WpFeaturedmediaLinks.fromJson(Map<String, dynamic> json) => WpFeaturedmediaLinks(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    author: List<ReplyElement>.from(json["author"].map((x) => ReplyElement.fromJson(x))),
    replies: List<ReplyElement>.from(json["replies"].map((x) => ReplyElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": List<dynamic>.from(about!.map((x) => x.toJson())),
    "author": List<dynamic>.from(author!.map((x) => x.toJson())),
    "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
  };
}

class ReplyElement {
  ReplyElement({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String ?href;

  factory ReplyElement.fromJson(Map<String, dynamic> json) => ReplyElement(
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
    this.width,
    this.height,
    this.file,
    this.filesize,
    this.sizes,
    this.imageMeta,
  });

  int? width;
  int? height;
  String? file;
  int? filesize;
  Map<String, Size>? sizes;
  ImageMeta? imageMeta;

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
    width: json["width"],
    height: json["height"],
    file: json["file"],
    filesize: json["filesize"],
    sizes: Map.from(json["sizes"]).map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
    imageMeta: ImageMeta.fromJson(json["image_meta"]),
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "file": file,
    "filesize": filesize,
    "sizes": Map.from(sizes!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "image_meta": imageMeta!.toJson(),
  };
}

class ImageMeta {
  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  String? aperture;
  Credit? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
    aperture: json["aperture"],
    credit: creditValues.map[json["credit"]],
    camera: json["camera"],
    caption: json["caption"],
    createdTimestamp: json["created_timestamp"],
    copyright: json["copyright"],
    focalLength: json["focal_length"],
    iso: json["iso"],
    shutterSpeed: json["shutter_speed"],
    title: json["title"],
    orientation: json["orientation"],
    keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "aperture": aperture,
    "credit": creditValues.reverse[credit],
    "camera": camera,
    "caption": caption,
    "created_timestamp": createdTimestamp,
    "copyright": copyright,
    "focal_length": focalLength,
    "iso": iso,
    "shutter_speed": shutterSpeed,
    "title": title,
    "orientation": orientation,
    "keywords": List<dynamic>.from(keywords!.map((x) => x)),
  };
}

enum Credit { EMPTY, PICASA }

final creditValues = EnumValues({
  "": Credit.EMPTY,
  "Picasa": Credit.PICASA
});

class Size {
  Size({
    this.file,
    this.width,
    this.height,
    this.filesize,
    this.mimeType,
    this.sourceUrl,
    this.uncropped,
  });

  String? file;
  int? width;
  int? height;
  int? filesize;
  MimeType? mimeType;
  String? sourceUrl;
  bool? uncropped;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    file: json["file"],
    width: json["width"],
    height: json["height"],
    filesize: json["filesize"] == null ? null : json["filesize"],
    mimeType: mimeTypeValues.map[json["mime_type"]],
    sourceUrl: json["source_url"],
    uncropped: json["uncropped"] == null ? null : json["uncropped"],
  );

  Map<String, dynamic> toJson() => {
    "file": file,
    "width": width,
    "height": height,
    "filesize": filesize == null ? null : filesize,
    "mime_type": mimeTypeValues.reverse[mimeType],
    "source_url": sourceUrl,
    "uncropped": uncropped == null ? null : uncropped,
  };
}

enum MimeType { IMAGE_WEBP, IMAGE_JPEG, IMAGE_PNG }

final mimeTypeValues = EnumValues({
  "image/jpeg": MimeType.IMAGE_JPEG,
  "image/png": MimeType.IMAGE_PNG,
  "image/webp": MimeType.IMAGE_WEBP
});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({
  "image": MediaType.IMAGE
});

enum WpFeaturedmediaType { ATTACHMENT }

final wpFeaturedmediaTypeValues = EnumValues({
  "attachment": WpFeaturedmediaType.ATTACHMENT
});

class EmbeddedWpTerm {
  EmbeddedWpTerm({
    this.id,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.links,
  });

  int? id;
  String? link;
  String? name;
  String? slug;
  Taxonomy? taxonomy;
  WpTermLinks? links;

  factory EmbeddedWpTerm.fromJson(Map<String, dynamic> json) => EmbeddedWpTerm(
    id: json["id"],
    link: json["link"],
    name: json["name"],
    slug: json["slug"],
    taxonomy: taxonomyValues.map[json["taxonomy"]],
    links: WpTermLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "name": name,
    "slug": slug,
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "_links": links!.toJson(),
  };
}

class WpTermLinks {
  WpTermLinks({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<About>? wpPostType;
  List<Cury>? curies;

  factory WpTermLinks.fromJson(Map<String, dynamic> json) => WpTermLinks(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    wpPostType: List<About>.from(json["wp:post_type"].map((x) => About.fromJson(x))),
    curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": List<dynamic>.from(about!.map((x) => x.toJson())),
    "wp:post_type": List<dynamic>.from(wpPostType!.map((x) => x.toJson())),
    "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
  };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  CuryName? name;
  Href? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: curyNameValues.map[json["name"]],
    href: hrefValues.map[json["href"]],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": curyNameValues.reverse[name],
    "href": hrefValues.reverse[href],
    "templated": templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum CuryName { WP }

final curyNameValues = EnumValues({
  "wp": CuryName.WP
});

enum Taxonomy { CATEGORY, POST_TAG, YST_PROMINENT_WORDS }

final taxonomyValues = EnumValues({
  "category": Taxonomy.CATEGORY,
  "post_tag": Taxonomy.POST_TAG,
  "yst_prominent_words": Taxonomy.YST_PROMINENT_WORDS
});

enum Format { STANDARD }

final formatValues = EnumValues({
  "standard": Format.STANDARD
});

class BlogsDatumLinks {
  BlogsDatumLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<ReplyElement>? author;
  List<ReplyElement>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<ReplyElement>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<LinksWpTerm>? wpTerm;
  List<Cury>? curies;

  factory BlogsDatumLinks.fromJson(Map<String, dynamic> json) => BlogsDatumLinks(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    author: List<ReplyElement>.from(json["author"].map((x) => ReplyElement.fromJson(x))),
    replies: List<ReplyElement>.from(json["replies"].map((x) => ReplyElement.fromJson(x))),
    versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
    predecessorVersion: List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
    wpFeaturedmedia: List<ReplyElement>.from(json["wp:featuredmedia"].map((x) => ReplyElement.fromJson(x))),
    wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
    wpTerm: List<LinksWpTerm>.from(json["wp:term"].map((x) => LinksWpTerm.fromJson(x))),
    curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": List<dynamic>.from(about!.map((x) => x.toJson())),
    "author": List<dynamic>.from(author!.map((x) => x.toJson())),
    "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
    "version-history": List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
    "predecessor-version": List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
    "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
    "wp:attachment": List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
    "wp:term": List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
    "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
  };
}

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int? id;
  String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
    id: json["id"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "href": href,
  };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
    count: json["count"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "href": href,
  };
}

class LinksWpTerm {
  LinksWpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  factory LinksWpTerm.fromJson(Map<String, dynamic> json) => LinksWpTerm(
    taxonomy: taxonomyValues.map[json["taxonomy"]],
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "embeddable": embeddable,
    "href": href,
  };
}

enum StatusEnum { PUBLISH }

final statusEnumValues = EnumValues({
  "publish": StatusEnum.PUBLISH
});

enum BlogsDatumType { POST }

final blogsDatumTypeValues = EnumValues({
  "post": BlogsDatumType.POST
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
