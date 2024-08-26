
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/notification_bloc/notification_teacher_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/service/teacher_service/notification_teacher_service.dart';

class TeacherNotificationsPage extends StatefulWidget {
  const TeacherNotificationsPage({super.key});

  @override
  State<TeacherNotificationsPage> createState() => _TeacherNotificationsPageState();
}

class _TeacherNotificationsPageState extends State<TeacherNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationTeacherBloc(NotificationTeacherService())..add(FetchNotificationsTeacherEvent()),
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
          child: BlocBuilder<NotificationTeacherBloc,  NotificationTeacherState>(
            builder: (context, state) {
              if (state is NotificationLoadingState) {
                return  const CircularProgressIndicator();
              } 
            
              else if (state is NotificationIsLoaded) {
                final notifications = state.notifications;
              
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


