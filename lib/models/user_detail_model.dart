// To parse this JSON data, do
//
//     final userDetailModel = userDetailModelFromJson(jsonString);

import 'dart:convert';

UserDetailModel userDetailModelFromJson(String str) =>
    UserDetailModel.fromJson(json.decode(str));

String userDetailModelToJson(UserDetailModel data) =>
    json.encode(data.toJson());

class UserDetailModel {
  UserDetailModel({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.roles,
    this.registeredDate,
    this.capabilities,
    this.extraCapabilities,
    this.avatarUrls,
    this.meta,
    this.isSuperAdmin,
    this.woocommerceMeta,
    this.links,
  });

  int? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? url;
  String? description;
  String? link;
  String? locale;
  String? nickname;
  String? slug;
  List<String>? roles;
  DateTime? registeredDate;
  Capabilities? capabilities;
  ExtraCapabilities? extraCapabilities;
  Map<String, String>? avatarUrls;
  List<dynamic>? meta;
  bool? isSuperAdmin;
  WoocommerceMeta? woocommerceMeta;
  Links? links;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        locale: json["locale"],
        nickname: json["nickname"],
        slug: json["slug"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        registeredDate: DateTime.parse(json["registered_date"]),
        capabilities: Capabilities.fromJson(json["capabilities"]),
        extraCapabilities:
            ExtraCapabilities.fromJson(json["extra_capabilities"]),
        avatarUrls: Map.from(json["avatar_urls"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        isSuperAdmin: json["is_super_admin"],
        woocommerceMeta: WoocommerceMeta.fromJson(json["woocommerce_meta"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "url": url,
        "description": description,
        "link": link,
        "locale": locale,
        "nickname": nickname,
        "slug": slug,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "registered_date": registeredDate!.toIso8601String(),
        "capabilities": capabilities!.toJson(),
        "extra_capabilities": extraCapabilities!.toJson(),
        "avatar_urls": Map.from(avatarUrls!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": List<dynamic>.from(meta!.map((x) => x)),
        "is_super_admin": isSuperAdmin,
        "woocommerce_meta": woocommerceMeta!.toJson(),
        "_links": links!.toJson(),
      };
}

class Capabilities {
  Capabilities({
    this.read,
  });

  bool? read;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "read": read,
      };
}

class ExtraCapabilities {
  ExtraCapabilities({
    this.subscriber,
  });

  bool? subscriber;

  factory ExtraCapabilities.fromJson(Map<String, dynamic> json) =>
      ExtraCapabilities(
        subscriber: json["subscriber"],
      );

  Map<String, dynamic> toJson() => {
        "subscriber": subscriber,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection>? self;
  List<Collection>? collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
      };
}

class Collection {
  Collection({
    this.href,
  });

  String? href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

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

  factory WoocommerceMeta.fromJson(Map<String, dynamic> json) =>
      WoocommerceMeta(
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
