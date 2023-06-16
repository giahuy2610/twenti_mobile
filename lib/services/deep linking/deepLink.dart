import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

void CreateSharingDynamicLink(int idProduct) async {
  final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse("https://twentimobile.page.link/product/$idProduct"),
    uriPrefix: "https://twentimobile.page.link/product",
    androidParameters:
        const AndroidParameters(packageName: "com.example.twenti_mobile"),
    iosParameters: const IOSParameters(bundleId: "twenti_mobile"),
  );
  final dynamicLink =
      await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
  Share.share(dynamicLink.toString());
}
