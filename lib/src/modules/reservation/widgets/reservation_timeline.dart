import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';

class ReservationTimeline extends StatelessWidget {
  ReservationTimeline({
    Key? key,
    required this.processes,
    required this.processIndex,
  }) : super(key: key);

  final RxList<String> processes;
  final int processIndex;

  Color getColor(int index) {
    if (index == processIndex) {
      return inProgressColor;
    } else if (index < processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  final completeColor = Resources.color.indigo700;
  final inProgressColor = Resources.color.indigo300;
  final todoColor = Resources.color.neutral300;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Timeline.tileBuilder(
        primary: false,
        shrinkWrap: true,
        theme: TimelineThemeData(
          direction: Axis.vertical,
          connectorTheme: const ConnectorThemeData(
            space: 30.0,
            thickness: 5.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          contentsAlign: ContentsAlign.alternating,
          itemExtent: SizerUtil.width / processes.length,
          contentsBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextNunito(
                text: processes[index],
                size: 12.sp,
                fontWeight: Weightenum.REGULAR,
                color: getColor(index),
                align: TextAlign.center,
                maxLines: 3,
              ),
            );
          },
          indicatorBuilder: (_, index) {
            var color = todoColor;
            Widget child = Container();
            if (index == processIndex) {
              color = inProgressColor;
              child = const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else if (index < processIndex) {
              color = completeColor;
              child = const Icon(
                Remix.check_line,
                color: Colors.white,
                size: 15.0,
              );
            } else {
              color = todoColor;
            }
            if (index <= processIndex) {
              return DotIndicator(
                size: 30.0,
                color: color,
                child: child,
              );
            } else {
              return OutlinedDotIndicator(
                borderWidth: 4.0,
                color: color,
              );
            }
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              return DecoratedLineConnector(
                decoration: BoxDecoration(
                  color: getColor(index),
                ),
              );
            } else {
              return null;
            }
          },
          itemCount: processes.length,
        ),
      ),
    );
  }
}
