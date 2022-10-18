import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simlk_app/src/modules/common/widgets/shimmers/list_item.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({Key? key}) : super(key: key);

  final Gradient gradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [Colors.grey, Colors.grey, Colors.white, Colors.grey, Colors.grey],
    stops: [0.0, 0.35, 0.5, 0.65, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: gradient,
      child: _buildPlaceListShimmer(),
    );
  }
}

List<int> _dummyPlace() {
  List<int> data = [];

  for (int i = 0; i < 9; i++) {
    data.add(i);
  }
  return data;
}

ListView _buildPlaceListShimmer() {
  return ListView.builder(
    itemCount: _dummyPlace().length,
    itemBuilder: (context, index) {
      return ListItem(
        index: index,
      );
    },
  );
}
