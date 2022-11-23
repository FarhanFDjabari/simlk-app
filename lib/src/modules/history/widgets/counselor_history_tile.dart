import 'package:flutter/material.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/extensions/date_time_extension.dart';
import 'package:sizer/sizer.dart';

class CounselorHistoryTile extends StatelessWidget {
  const CounselorHistoryTile({
    this.onTap,
    this.data,
    this.displayStatus,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final Konselor? data;
  final bool? displayStatus;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Resources.color.indigo500,
                    backgroundImage: NetworkImage(
                      data?.profileImageUrl ??
                          "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextNunito(
                        text: '${data?.name}',
                        size: 12.sp,
                        fontWeight: Weightenum.BOLD,
                      ),
                      TextNunito(
                        // text: '${data?.phoneNumber}/${data?.lineId}',
                        text: '08111122231/',
                        size: 10.sp,
                        fontWeight: Weightenum.BOLD,
                        isSelectable: true,
                      ),
                    ],
                  ),
                ],
              ),
              if (displayStatus == true)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Resources.color.indigo10,
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
                            color: Resources.color.indigo800,
                          ),
                        ),
                        const SizedBox(width: 5),
                        TextNunito(
                          text: 'Tersedia',
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
