import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/main.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:timezone/timezone.dart' as tz;

Future<void> showNotification({required int outOfStockItemCount}) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '0',
    'Afnan',
    channelDescription: 'Channel Description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    colorized: true,
    color: MyColors.white,
  );

  const DarwinNotificationDetails iOSPlatformChannelSpecifics =
      DarwinNotificationDetails();

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    1,
    'Check the Out of Stock item',
    'There are $outOfStockItemCount item in the inventory that are out of stock, check it out',
    platformChannelSpecifics,
    payload: 'User clicks the notification',
  );
}

void scheduleWeeklyNotification(int outOfStockItemCount) async {
  log('Attempting to schedule notification...');
  flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Check the Out of Stock item',
    'There are $outOfStockItemCount item in the inventory that are out of stock, check it out',
    // _nextMondayScheduledDateTime(),
    tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2)),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        '1',
        'description',
        channelDescription: 'Channel Description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        colorized: true,
        color: MyColors.white,
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents: DateTimeComponents.time,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
  );
  log('Notification scheduling completed.');
}

// tz.TZDateTime _nextMondayScheduledDateTime() {
//   tz.TZDateTime scheduledDate =
//       tz.TZDateTime.now(tz.local).add(const Duration(days: 1));
//   while (scheduledDate.weekday != DateTime.wednesday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   log('Notification fun is worked');
//   return scheduledDate
//       .add(
//         const Duration(hours: 8, minutes: 6),
//       )
//       .subtract(
//           Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute));
// }

void checkOutOfStockItem() async {
  if (!kIsWeb) {
    await requestExactAlarmPermission();
    outOfStockListNotifiers.value = await getTheOutOfStockItems();

    if (outOfStockListNotifiers.value.isNotEmpty) {
      // scheduleWeeklyNotification(outOfStockListNotifiers.value.length);
      showNotification(
          outOfStockItemCount: outOfStockListNotifiers.value.length);
      log('out of stock item is there in the inventory');
    }
  }
}

Future<void> requestExactAlarmPermission() async {
  if (!kIsWeb) {
    if (await Permission.scheduleExactAlarm.isDenied) {
      // Request the permission
      PermissionStatus status = await Permission.scheduleExactAlarm.request();

      if (status.isGranted) {
        log('Exact alarm permission granted');
      } else {
        log('Exact alarm permission denied');
        // You might want to guide the user to settings
        // await openAppSettings(); // Optional: Open settings to allow user to manually enable
      }
      if (status.isDenied) {
        await openAppSettings();
      }
    } else {
      log('Exact alarm permission already granted');
    }
  }
}


// tz.TZDateTime _nextInstanceOfMondayNineAM() {
//   tz.TZDateTime scheduledDate = tz.TZDateTime.now(tz.local);
//   scheduledDate = scheduledDate.add(Duration(days: (DateTime.monday - scheduledDate.weekday + 7) % 7)); // Find next Monday
//   return scheduledDate.add(Duration(hours: 9)).subtract(Duration(minutes: scheduledDate.minute));
// }