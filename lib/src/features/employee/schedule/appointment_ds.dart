// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:barbershop/src/model/schedule_model.dart';

class AppointmentDs extends CalendarDataSource {
  final List<ScheduleModel> schedules;

  AppointmentDs({
    required this.schedules,
  });

  @override
  List<dynamic>? get appointments {
    return schedules.map((e) {
      final ScheduleModel(
        date: DateTime(:year, :month, :day),
        :hour,
        :clientName
      ) = e;

      final startTime = DateTime(year, month, day, hour, 0, 0);
      final endTime = DateTime(year, month, day, hour + 1, 0, 0);

      return Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(
          const Duration(hours: 1),
        ),
      );
    }).toList();
  }
}
