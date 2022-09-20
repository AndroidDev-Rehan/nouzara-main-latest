// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.info,
    this.item,
    this.event,
    this.variable,
  });

  Info? info;
  List<Item>? item;
  List<Event>? event;
  List<Variable>? variable;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    info: Info.fromJson(json["info"]),
    item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
    variable: List<Variable>.from(json["variable"].map((x) => Variable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info!.toJson(),
    "item": List<dynamic>.from(item!.map((x) => x.toJson())),
    "event": List<dynamic>.from(event!.map((x) => x.toJson())),
    "variable": List<dynamic>.from(variable!.map((x) => x.toJson())),
  };
}

class Event {
  Event({
    this.listen,
    this.script,
  });

  String? listen;
  Script? script;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    listen: json["listen"],
    script: Script.fromJson(json["script"]),
  );

  Map<String, dynamic> toJson() => {
    "listen": listen,
    "script": script!.toJson(),
  };
}

class Script {
  Script({
    this.type,
    this.exec,
  });

  String? type;
  List<String>? exec;

  factory Script.fromJson(Map<String, dynamic> json) => Script(
    type: json["type"],
    exec: List<String>.from(json["exec"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "exec": List<dynamic>.from(exec!.map((x) => x)),
  };
}

class Info {
  Info({
    this.postmanId,
    this.name,
    this.schema,
  });

  String? postmanId;
  String? name;
  String? schema;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    postmanId: json["_postman_id"],
    name: json["name"],
    schema: json["schema"],
  );

  Map<String, dynamic> toJson() => {
    "_postman_id": postmanId,
    "name": name,
    "schema": schema,
  };
}

class Item {
  Item({
    this.name,
    this.request,
    this.response,
    this.protocolProfileBehavior,
  });

  String? name;
  Request? request;
  List<dynamic>? response;
  ProtocolProfileBehavior? protocolProfileBehavior;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    request: Request.fromJson(json["request"]),
    response: List<dynamic>.from(json["response"].map((x) => x)),
    protocolProfileBehavior: json["protocolProfileBehavior"] == null ? null : ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "request": request!.toJson(),
    "response": List<dynamic>.from(response!.map((x) => x)),
    "protocolProfileBehavior": protocolProfileBehavior == null ? null : protocolProfileBehavior!.toJson(),
  };
}

class ProtocolProfileBehavior {
  ProtocolProfileBehavior({
    this.disableBodyPruning,
  });

  bool? disableBodyPruning;

  factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) => ProtocolProfileBehavior(
    disableBodyPruning: json["disableBodyPruning"],
  );

  Map<String, dynamic> toJson() => {
    "disableBodyPruning": disableBodyPruning,
  };
}

class Request {
  Request({
    this.method,
    this.header,
    this.body,
    this.url,
    this.auth,
  });

  Method? method;
  List<dynamic>? header;
  Body? body;
  Url? url;
  Auth? auth;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    method: methodValues.map[json["method"]],
    header: List<dynamic>.from(json["header"].map((x) => x)),
    body: Body.fromJson(json["body"]),
    url: Url.fromJson(json["url"]),
    auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
  );

  Map<String, dynamic> toJson() => {
    "method": methodValues.reverse[method],
    "header": List<dynamic>.from(header!.map((x) => x)),
    "body": body!.toJson(),
    "url": url!.toJson(),
    "auth": auth == null ? null : auth!.toJson(),
  };
}

class Auth {
  Auth({
    this.type,
    this.bearer,
    this.oauth1,
  });

  AuthType? type;
  List<Formdatum>? bearer;
  List<Oauth1>? oauth1;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    type: authTypeValues.map[json["type"]],
    bearer: json["bearer"] == null ? null : List<Formdatum>.from(json["bearer"].map((x) => Formdatum.fromJson(x))),
    oauth1: json["oauth1"] == null ? null : List<Oauth1>.from(json["oauth1"].map((x) => Oauth1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": authTypeValues.reverse[type],
    "bearer": bearer == null ? null : List<dynamic>.from(bearer!.map((x) => x.toJson())),
    "oauth1": oauth1 == null ? null : List<dynamic>.from(oauth1!.map((x) => x.toJson())),
  };
}

class Formdatum {
  Formdatum({
    this.key,
    this.value,
    this.type,
    this.disabled,
  });

  String? key;
  String? value;
  FormdatumType? type;
  bool? disabled;

  factory Formdatum.fromJson(Map<String, dynamic> json) => Formdatum(
    key: json["key"],
    value: json["value"],
    type: formdatumTypeValues.map[json["type"]],
    disabled: json["disabled"] == null ? null : json["disabled"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "type": formdatumTypeValues.reverse[type],
    "disabled": disabled == null ? null : disabled,
  };
}

enum FormdatumType { STRING, TEXT }

final formdatumTypeValues = EnumValues({
  "string": FormdatumType.STRING,
  "text": FormdatumType.TEXT
});

class Oauth1 {
  Oauth1({
    this.key,
    this.value,
    this.type,
  });

  String? key;
  dynamic value;
  String? type;

  factory Oauth1.fromJson(Map<String, dynamic> json) => Oauth1(
    key: json["key"],
    value: json["value"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "type": type,
  };
}

enum AuthType { BEARER, OAUTH1 }

final authTypeValues = EnumValues({
  "bearer": AuthType.BEARER,
  "oauth1": AuthType.OAUTH1
});

class Body {
  Body({
    this.mode,
    this.formdata,
    this.raw,
    this.options,
  });

  Mode? mode;
  List<Formdatum>? formdata;
  String? raw;
  Options? options;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    mode: modeValues.map[json["mode"]],
    formdata: json["formdata"] == null ? null : List<Formdatum>.from(json["formdata"].map((x) => Formdatum.fromJson(x))),
    raw: json["raw"] == null ? null : json["raw"],
    options: json["options"] == null ? null : Options.fromJson(json["options"]),
  );

  Map<String, dynamic> toJson() => {
    "mode": modeValues.reverse[mode],
    "formdata": formdata == null ? null : List<dynamic>.from(formdata!.map((x) => x.toJson())),
    "raw": raw == null ? null : raw,
    "options": options == null ? null : options!.toJson(),
  };
}

enum Mode { FORMDATA, RAW }

final modeValues = EnumValues({
  "formdata": Mode.FORMDATA,
  "raw": Mode.RAW
});

class Options {
  Options({
    this.raw,
  });

  Raw? raw;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    raw: Raw.fromJson(json["raw"]),
  );

  Map<String, dynamic> toJson() => {
    "raw": raw!.toJson(),
  };
}

class Raw {
  Raw({
    this.language,
  });

  String? language;

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
  };
}

enum Method { POST, GET }

final methodValues = EnumValues({
  "GET": Method.GET,
  "POST": Method.POST
});

class Url {
  Url({
    this.raw,
    this.host,
    this.path,
    this.query,
    this.protocol,
  });

  String? raw;
  List<String>? host;
  List<String>? path;
  List<Variable>? query;
  String? protocol;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    raw: json["raw"],
    host: List<String>.from(json["host"].map((x) => x)),
    path: json["path"] == null ? null : List<String>.from(json["path"].map((x) => x)),
    query: json["query"] == null ? null : List<Variable>.from(json["query"].map((x) => Variable.fromJson(x))),
    protocol: json["protocol"] == null ? null : json["protocol"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "host": List<dynamic>.from(host!.map((x) => x)),
    "path": path == null ? null : List<dynamic>.from(path!.map((x) => x)),
    "query": query == null ? null : List<dynamic>.from(query!.map((x) => x.toJson())),
    "protocol": protocol == null ? null : protocol,
  };
}

class Variable {
  Variable({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}

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
