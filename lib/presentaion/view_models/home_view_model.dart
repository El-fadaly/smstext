import 'package:flutter/cupertino.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeViewModel extends ChangeNotifier {
  final SmsQuery query = SmsQuery();
  List<SmsMessage> messages = [];

  void getSms() async {
    print("getting sms");
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      messages = await query.querySms(
        kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
      );

      List<dynamic> words = [];
      for (var i = 0; i < messages.length; i++) {
        var list = messages[i].body?.split(" ");
        words.add(list);
        print("words  in $i  ${words[i]}");
        for (var word in words[i]) {
          if (isNumeric(word)) {}
        }
      }
    } else {
      await Permission.sms.request();
      getSms();
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(
          s,
        ) !=
        null;
  }
}

// messages.forEach(
// (element) {
// // print(element.body?.replaceAll(RegExp(r'[^0-9.]'), ' ') ?? "");
// dynamic nums =
// (element.body?.replaceAll(RegExp(r'[^0-9.]'), ' ') ?? "")
//     .split(" ");
//
// nums.removeWhere((element) => element == '');
//
// nums.forEach((element) {
// element = double.parse(element, (e) => 0.0);
// });
// nums.removeWhere((e) => e == '. ');
// nums.removeWhere((e) => e == " . ");
// nums.removeWhere((e) => e == ' .');
// print(nums);
// nums.forEach((element) {
// print(element.runtimeType);
// });
// },
// );
