import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;
  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('===== FCM TOken =====');
      print(token);
     });

    _firebaseMessaging.configure(
      //local message
      onMessage: (info) async {
        print('======= On message======');
        print(info);
        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['comida'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
      //cuando esta en segundo plano
      onLaunch: (info) async {
        print('======= On launche======');
        print(info);

        final noti = info['data']['comida'];
        print(noti);
      },
      onResume: (info) async {
        print('======= On resume======');
        print(info);

        final noti = info['data']['comida'];
        _mensajesStreamController.sink.add(noti);
        // print(noti);
      },
    );
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
