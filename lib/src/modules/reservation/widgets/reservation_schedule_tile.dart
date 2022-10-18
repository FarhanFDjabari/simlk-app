import 'package:flutter/material.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';

class ReservationScheduleTile extends StatelessWidget {
  const ReservationScheduleTile({
    this.onTap,
    this.isStudentHistoryLayout,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final bool? isStudentHistoryLayout;

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
                    ),
                    const SizedBox(width: 10),
                    TextNunito(
                      text: 'Mahasiswa Satu',
                      size: 15,
                      fontWeight: Weightenum.BOLD,
                    ),
                  ],
                ),
              if (isStudentHistoryLayout == false) const SizedBox(height: 5),
              TextNunito(
                text: 'Senin, 14 Oktober 2022',
                size: 18,
                fontWeight: Weightenum.REGULAR,
              ),
              TextNunito(
                text: '14.00',
                size: 16,
                fontWeight: Weightenum.REGULAR,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Resources.color.indigo200,
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
                        text: 'Diajukan',
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
