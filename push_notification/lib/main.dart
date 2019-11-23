import 'package:flutter/material.dart';
import 'package:push_notification/src/pages/home_page.dart';
import 'package:push_notification/src/pages/mensaje_page.dart';
import 'package:push_notification/src/providers_push/push_notification_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  @override
  void initState() {
  
    super.initState();

    final pushPorvider = PushNotificationProvider();

    pushPorvider.initNotifications();
    pushPorvider.mensajes.listen((data){
      //Navigator.pushNamed(context, 'mensaje');
      print(data);
      navigatorkey.currentState.pushNamed('mensaje', arguments: data
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorkey,
      title: 'Push Local',
     
     initialRoute:'home',

     routes: {
       'home'      : (BuildContext context) => HomePage(),
       'mensaje'   : (BuildContext context) => MensajePage(),
     } ,
        
      
    );
  }
}