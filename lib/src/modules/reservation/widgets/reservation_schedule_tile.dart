import 'package:flutter/material.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/extensions/date_time_extension.dart';

class ReservationScheduleTile extends StatelessWidget {
  const ReservationScheduleTile({
    this.onTap,
    this.isStudentHistoryLayout,
    this.data,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final bool? isStudentHistoryLayout;
  final ReservationSchedule? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isStudentHistoryLayout == false)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Resources.color.indigo500,
                      backgroundImage: NetworkImage(
                        data?.student?.profileImageUrl ??
                            "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextNunito(
                      text: '${data?.student?.name}',
                      size: 15,
                      fontWeight: Weightenum.BOLD,
                    ),
                  ],
                ),
              if (isStudentHistoryLayout == false) const SizedBox(height: 5),
              TextNunito(
                text: DateTimeExtension(data?.reservationTime ?? DateTime.now())
                    .dayFullMonthYear,
                size: 18,
                fontWeight: Weightenum.REGULAR,
              ),
              TextNunito(
                text: '${data?.timeHours}',
                size: 16,
                fontWeight: Weightenum.REGULAR,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: data?.status == 1
                        ? Resources.color.indigo10
                        : data?.status == 2
                            ? Resources.color.stateWarning50
                            : data?.status == 3
                                ? Resources.color.indigo50
                                : Resources.color.statePositive50,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: data?.status == 1
                              ? Resources.color.indigo800
                              : data?.status == 2
                                  ? Resources.color.stateWarning
                                  : data?.status == 3
                                      ? Resources.color.indigo800
                                      : Resources.color.statePositive,
                        ),
                      ),
                      const SizedBox(width: 5),
                      TextNunito(
                        text: data?.status == 1
                            ? 'Diajukan'
                            : data?.status == 2
                                ? 'Dalam Proses'
                                : data?.status == 3
                                    ? 'Penanganan'
                                    : 'Selesai',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
