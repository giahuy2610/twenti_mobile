class NotificationModel {
  late int iDNoti;
  late int iDCus;
  late String createdOn;
  late int isSeen;
  late int isDeleted;
  late String title;
  late String content;
  late int type;
  late String? note;

  NotificationModel(
      {required this.iDNoti,
      required this.iDCus,
      required this.createdOn,
      required this.isSeen,
      required this.isDeleted,
      required this.title,
      required this.content,
      required this.type,
      this.note});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      iDNoti: json['IDNoti'],
      iDCus: json['IDCus'],
      createdOn: json['CreatedOn'],
      isSeen: json['IsSeen'],
      isDeleted: json['IsDeleted'],
      title: json['Title'],
      content: json['Content'],
      type: json['Type'],
      note: json['Note'],
    );
  }
}
