import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationsButtonPage extends StatefulWidget {
  const NotificationsButtonPage({Key? key}) : super(key: key);

  @override
  State<NotificationsButtonPage> createState() => _NotificationsButtonPageState();
}

class _NotificationsButtonPageState extends State<NotificationsButtonPage> {
  // void _requestService() {
  //   // Implement the service request logic here.
  //   // For example, you can use an API call or any other method to request the service.
  //   print('Service requested');
  // }

    

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
//           AwesomeNotifications().createNotification(
//   content: NotificationContent(
//       id: 10,
//       channelKey: 'basic_channel',
//       actionType: ActionType.Default,
//       title: 'Hello World!',
//       body: 'This is my first notification!',
//   )
// );

 AwesomeNotifications().createNotification(
                    content: NotificationContent(
                      id: 10,
                      channelKey: 'basic_channel',
                      actionType: ActionType.Default,
                      // title: notifications.verb,
                      // body: notifications.description,
                    ),
                  );


        },
        child: const Text('Request Service'),
      ),
    );
  }
}



// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_childhood/model/notifications_model.dart';
// import 'package:flutter_childhood/service/mother_service/notifications_service.dart';

// class NotificationsButtonPage extends StatefulWidget {
//   const NotificationsButtonPage({Key? key}) : super(key: key);

//   @override
//   _NotificationsButtonPageState createState() => _NotificationsButtonPageState();
// }

// class _NotificationsButtonPageState extends State<NotificationsButtonPage> {
//   late Future<List<NotificationsModel>> notifications;

//   @override
//   void initState() {
//     notifications = NotificationService().fetchNotifications();
//     super.initState();
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<NotificationsModel>>(
//       future: notifications,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No notifications available'));
//         } else {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final notification = snapshot.data![index];
//               return ListTile(
//                 title: Text(notification.verb?? 'No title'),
//                 subtitle: Text(notification.description ?? 'No body'),
//                 onTap: () {
//                   AwesomeNotifications().createNotification(
//                     content: NotificationContent(
//                       id: 10,
//                       channelKey: 'basic_channel',
//                       actionType: ActionType.Default,
//                       title: notification.verb,
//                       body: notification.description,
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }