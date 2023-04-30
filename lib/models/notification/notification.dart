class NotificationItemModel {
  late DateTime receivedTime;
  late DateTime? readTime;
  late bool isRead;
  late String content;
  late String? routePath;
  late String? imagePath;

  bool get getIsRead => isRead;

  NotificationItemModel(
      {required this.content,
      imagePath,
      required this.receivedTime,
      this.routePath}) {
    this.isRead = false;
  }
}
