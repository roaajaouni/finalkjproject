

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/notifications_model.dart';

import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService extends BaseService{
 

  Future  fetchNotifications() async {
    try {
      final response = await dio.get("${baseUrl}notificationsmom/",
       options:Options(
           headers: {
             'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
            //  'Authorization': 'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE3ODcwNTk3LCJpYXQiOjE3MTc3ODQxOTcsImp0aSI6ImUzNGMzNTg1YmUzZTQwZDNiNTBhN2MwOTRhN2YwN2Y2IiwidXNlcl9pZCI6NH0.iYGelJwOJdTxhJ_jEYYh-rDe2V_vVuuffXvVz7UNPok',
           },
        ),
      
      );

      
      if (response.statusCode == 200) {
        List<dynamic> body = response.data;
         print('Response data type: ${response.data.runtimeType}');
        print('Response data: ${response.data}');
        List<NotificationsModel> notifications = body.map((dynamic item) => NotificationsModel.fromMap(item)).toList();

        for (var notification in notifications) {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              // id: DateTime.now().millisecondsSinceEpoch.remainder(100000), 
              id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
              channelKey: 'basic_channel',
              actionType: ActionType.Default,
              title: notification.verb ?? 'No title',
              body: notification.description ?? 'No description',
            ),
          );
          return notifications;
        }
      }else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      throw Exception('Failed to load notifications: $e');
    }
   
  }
  
}
