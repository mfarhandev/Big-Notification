
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class BigNotificationScreen extends StatefulWidget {
  const BigNotificationScreen({super.key});

  @override
  State<BigNotificationScreen> createState() => _BigNotificationScreenState();
}

class _BigNotificationScreenState extends State<BigNotificationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Take Notification Permission From the User
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

  }


  triggerNotification(){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            // unique id
            id: 10,
            // channel key will be same like in the main file
            channelKey: 'basic_channel',
            title: 'Simple Notification',
            body: 'Simple Notification body',
            bigPicture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRipR3W6KA1cxjWGshGZMQ0tQH_DhQwb8l3Zw&usqp=CAU",
            notificationLayout: NotificationLayout.BigPicture,

        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Big Notification"),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: triggerNotification,
           child: Text("Trigger Notification"),
          ),
        )
      ),
    );
  }
}
