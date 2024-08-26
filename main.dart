
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/child_UD_bloc/child_ud_prof_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/child_info_bloc/child_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_home_bloc/mother_home_bloc.dart';

import 'package:flutter_childhood/blocs/teacher_blocs/create_reeport_bloc/create_report_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/home_bloc/teacher_home_bloc.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/notification_controller.dart';

import 'view/screen/auth/startingrole.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(channelGroupKey:"basic_groub_key" ,channelKey:"basic_channel" ,channelName: "roaa ",channelDescription:"roaa ja" ),
      
    ],
    channelGroups: [
      NotificationChannelGroup(channelGroupKey:"basic_groub_key" , channelGroupName: "basic_group")
    ]
  );
  bool isAllowedToSendNotification=await AwesomeNotifications().isNotificationAllowed();

  if(!isAllowedToSendNotification){
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  await setup();
  // await initializeNotifications();
  // await initializeService();
    // getIt.get<SharedPreferences>().remove('teacher_token');
  //  getIt.get<SharedPreferences>().clear();
  // getIt.get<SharedPreferences>().remove('token');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChildBloc(),
        ),
        BlocProvider(
          create: (context) => MotherHomeBloc ()..add(GetAllMyKidsEvent()),
        ),
        //     BlocProvider(
        //   create: (context) => ViewreportBloc()..add(GetAllMyKidsReportsEvent()),
        // ),
         BlocProvider(
          create: (context) => ChildUdProfBloc ()
        ),
          BlocProvider(
          create: (context) => TeacherHomeBloc ()..add(GetAllTeacherKidsEvent() )
        ),
          BlocProvider(
          create: (context) => CreateReportBloc() 
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Startingrole(),
      ),
    );
  }
}

// Future<void> initializeNotifications() async {
//   const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
//   final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }


// Future<void> showNotification(String title, String body) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'updates_channel', 'Updates',
//     importance: Importance.max,
//     priority: Priority.high,
//     showWhen: false,
//   );
//   const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics, payload: 'item x');
// }

// Future<void> initializeService()async{
//   final service = FlutterBackgroundService();

//   await service.configure(
//     iosConfiguration: IosConfiguration(),
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       isForegroundMode: true
//     )
//   );
//   await service.startService();
// }


// @pragma('vm:entry-point')
// void onStart(ServiceInstance service)async{
//   if (service is  AndroidServiceInstance){
//     service.on('setAsForeground').listen((event){
//       service.setAsForegroundService();
//     });
// service.on('setAsBackground').listen((event){
//       service.setAsBackgroundService();
//     });

//     service.on('stopService').listen((event){
//       service.stopSelf();
//     });


//     Timer.periodic(const Duration(seconds: 5), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//        service.setForegroundNotificationInfo(
//         title: 'Flutter Background Service',
//         // content: 'Flutter Background Service is running in foreground mode',
//         content: 'Update at ${DateTime.now()}',
//        );
//       }
//     }
//   });

//    final NotificationService notificationService = NotificationService();
//         try {
//           final notifications = await notificationService.fetchNotifications();
//           for (var notification in notifications) {
//             await showNotification(notification.verb, notification.description);
//           }
//         } catch (e) {
//             print(e.toString());
//         }

//   }
// }

