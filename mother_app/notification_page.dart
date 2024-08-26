

// import 'package:flutter/material.dart';


// class NotificationsPage extends StatelessWidget {
//   const NotificationsPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return 
//      Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title:const Text('Notifications Service '),
//       ),
//       body: Center(
//         // child: Text('data'),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 // FlutterBackgroundService().invoke("setAsForeground");
//               },
//               child:const Text('Start as Foreground Service'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // FlutterBackgroundService().invoke("setAsBackground");
//               },
//               child:const Text('Start as Background Service'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // FlutterBackgroundService().invoke("stopService");
//               },
//               child:const Text('Stop Service'),
//             ),
//           ],
//         ),
//       ),
//     );
    
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:flutter_childhood/model/notifications_model.dart';
// import 'package:flutter_childhood/service/mother_service/notifications_service.dart';


// class NotificationsPage extends StatefulWidget {
//   const NotificationsPage({super.key});

//   @override
//   _NotificationsPageState createState() => _NotificationsPageState();
// }

// class _NotificationsPageState extends State<NotificationsPage> {
//   NotificationService _notificationService=NotificationService();
//   late Future<List<NotificationsModel>> _notificationsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _notificationService = NotificationService();
//     _notificationsFuture =  _notificationService.fetchNotifications();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Notifications Service'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<NotificationsModel>>(
//           future: _notificationsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error fetching notifications: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Text('No notifications available.');
//             } else {
//               final notifications = snapshot.data!;
//               return ListView.builder(
//                 itemCount: notifications.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(notifications[index].verb ?? 'No title'),
//                     subtitle: Text(notifications[index].description ?? 'No description'),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// /////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/notification_bloc/notification_mother_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/service/mother_service/notifications_service.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationMotherBloc(NotificationService())..add(FetchNotificationsEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: const Text(
              "Notification Service",
              style: TextStyle(color: AppColor.fairuz),
            ),
            backgroundColor: AppColor.terqaz,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.fairuz,
              ),
            ),),
        body: Center(
          child: BlocBuilder<NotificationMotherBloc, NotificationMotherState>(
            builder: (context, state) {
              if (state is NotificationLoading) {
                return CircularProgressIndicator();
              } 
              else if (state is NotificationMotherEmptyState) {
                 return Text('No notifications available.');
                //  Text('Error fetching notifications: ${state.errorMessage}');
              } 
              else if (state is NotificationLoaded) {
                final notifications = state.notifications;
                // if (notifications.isEmpty) {
                //   return Text('No notifications available.');
                // } else {
                  return ListView.separated(
                    itemCount: notifications.length,
                    separatorBuilder: (context, index) => const Divider(color: AppColor.terqaz,), // Divider between items
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          notifications[index].verb ?? 'No title',
                          style:const TextStyle(color:AppColor.terqaz, fontWeight: FontWeight.bold), // Custom title color
                        ),
                        subtitle: Text(
                          notifications[index].description ?? 'No description',
                          style:const  TextStyle(color: Colors.grey), // Custom subtitle color
                        ),
                      );
                    },
                  );
                }
               else {
                return const Text('No notifications available.',style: TextStyle(fontSize: 18,color: AppColor.terqaz),);
              }
            },
          ),
        ),
      ),
    );
  }
}

// //////////////////////////////////////////////////////////////////////////////////////

