import 'package:flutter/material.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/schedule/widgets/custom_chip.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class SIMLKProfileDialog extends StatefulWidget {
  const SIMLKProfileDialog({
    Key? key,
    this.data,
    this.enableScheduleSet,
    this.onScheduleSet,
    this.dayList,
  }) : super(key: key);

  final Konselor? data;
  final bool? enableScheduleSet;
  final Function(List<int>?)? onScheduleSet;
  final List<int>? dayList;

  @override
  State<SIMLKProfileDialog> createState() => _SIMLKProfileDialogState();
}

class _SIMLKProfileDialogState extends State<SIMLKProfileDialog> {
  final _dayList = <int>[];

  @override
  void initState() {
    _dayList.addAll(widget.dayList ?? []);
    super.initState();
  }

  String getDayLabel(int index) {
    switch (index) {
      case 0:
        return 'Senin';
      case 1:
        return 'Selasa';
      case 2:
        return 'Rabu';
      case 3:
        return 'Kamis';
      case 4:
        return 'Jum\'at';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 80.w,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Resources.color.neutral50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                widget.data?.profileImageUrl ??
                    "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
              ),
            ),
            const SizedBox(height: 8),
            TextNunito(
              text: widget.data?.name,
              size: 18,
              fontWeight: Weightenum.REGULAR,
              color: Resources.color.neutral900,
            ),
            const SizedBox(height: 8),
            TextNunito(
              text: '195xxxxxxxxxxxx',
              maxLines: 1,
              size: 14,
              fontWeight: Weightenum.REGULAR,
              color: Resources.color.neutral900,
            ),
            const SizedBox(height: 8),
            TextNunito(
              text: widget.data?.email,
              maxLines: 2,
              size: 14,
              fontWeight: Weightenum.REGULAR,
              color: Resources.color.neutral900,
            ),
            const SizedBox(height: 8),
            TextNunito(
              text: '08xxxxxxxxx/idxxxx',
              maxLines: 2,
              size: 14,
              fontWeight: Weightenum.REGULAR,
              color: Resources.color.neutral900,
            ),
            const SizedBox(height: 16),
            TextNunito(
              text: 'Waktu Konseling',
              maxLines: 2,
              size: 14,
              fontWeight: Weightenum.REGULAR,
              color: Resources.color.neutral900,
            ),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5,
              children: List.generate(5, (index) {
                return CustomChip(
                  label: getDayLabel(index),
                  isSelected: _dayList.contains(index),
                  onSelected: widget.enableScheduleSet == true
                      ? (value) {
                          if (value) {
                            _dayList.add(index);
                          } else {
                            _dayList.remove(index);
                          }
                          setState(() {});
                        }
                      : (_) {},
                );
              }),
            ),
            if (widget.enableScheduleSet == true) const SizedBox(height: 16),
            if (widget.enableScheduleSet == true)
              PrimaryButton(
                width: 95.sp,
                height: 35.sp,
                label: 'Simpan',
                fontSize: 12.sp,
                elevation: 0,
                onPressed: () {
                  if (widget.onScheduleSet != null) {
                    widget.onScheduleSet!(_dayList);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
