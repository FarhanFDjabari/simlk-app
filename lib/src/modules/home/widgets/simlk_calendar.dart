import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:table_calendar/table_calendar.dart';

class SIMLKCalendar extends StatelessWidget {
  const SIMLKCalendar({
    Key? key,
    required this.focusedDay,
    this.selectedDay,
    this.reservations = const [],
    this.onDaySelected,
  }) : super(key: key);

  final DateTime focusedDay;
  final DateTime? selectedDay;
  final List<ReservationSchedule> reservations;
  final Function(DateTime, DateTime)? onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        headerMargin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          gradient: Resources.color.gradient500to700,
          borderRadius: BorderRadius.circular(16),
        ),
        titleTextStyle: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Resources.color.neutral50,
        ),
        leftChevronIcon: Icon(
          Remix.arrow_left_s_line,
          color: Resources.color.neutral50,
        ),
        rightChevronIcon: Icon(
          Remix.arrow_right_s_line,
          color: Resources.color.neutral50,
        ),
      ),
      focusedDay: focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2050),
      calendarFormat: CalendarFormat.month,
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, day2) {
          for (var i = 0; i < reservations.length; i++) {
            var listDate = reservations[i];
            if (DateTime(day.year, day.month, day.day).isAtSameMomentAs(
                DateTime(
                    listDate.reservationTime?.year ?? 2022,
                    listDate.reservationTime?.month ?? 1,
                    listDate.reservationTime?.day ?? 1))) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Resources.color.stateWarning),
                ),
              );
            }
          }
          return null;
        },
      ),
      enabledDayPredicate: (date) {
        return date.weekday != DateTime.saturday &&
            date.weekday != DateTime.sunday;
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      onDaySelected: onDaySelected,
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultTextStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
        ),
        selectedDecoration: BoxDecoration(
          gradient: Resources.color.gradient500to700,
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
        selectedTextStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
          color: Resources.color.neutral50,
        ),
      ),
    );
  }
}
