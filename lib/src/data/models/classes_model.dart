import 'dart:convert';

Classes classesFromJson(String str) => Classes.fromJson(json.decode(str));

String classesToJson(Classes data) => json.encode(data.toJson());

class Classes {
  Classes({
    this.color,
    this.starttime,
    this.endtime,
    this.lecturer,
    this.location,
    this.order,
    this.subject,
  });

  String color;
  String starttime;
  String endtime;
  String lecturer;
  String location;
  String order;
  String subject;

  Classes copyWith({
    String color,
    String starttime,
    String endtime,
    String lecturer,
    String location,
    String order,
    String subject,
  }) =>
      Classes(
        color: color ?? this.color,
        starttime: starttime ?? this.starttime,
        endtime: endtime ?? this.endtime,
        lecturer: lecturer ?? this.lecturer,
        location: location ?? this.location,
        order: order ?? this.order,
        subject: subject ?? this.subject,
      );

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
        color: json["color"] == null ? null : json["color"],
        starttime: json["starttime"] == null ? null : json["starttime"],
        endtime: json["endtime"] == null ? null : json["endtime"],
        lecturer: json["lecturer"] == null ? null : json["lecturer"],
        location: json["location"] == null ? null : json["location"],
        order: json["order"] == null ? null : json["order"],
        subject: json["subject"] == null ? null : json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "color": color == null ? null : color,
        "starttime": starttime == null ? null : starttime,
        "endtime": endtime == null ? null : endtime,
        "lecturer": lecturer == null ? null : lecturer,
        "location": location == null ? null : location,
        "order": order == null ? null : order,
        "subject": subject == null ? null : subject,
      };
}
