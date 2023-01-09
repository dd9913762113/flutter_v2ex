import 'package:flutter/material.dart';
// import 'package:flutter_v2ex/components/home/search_bar.dart';

class HomeStickyBar extends StatelessWidget {
  const HomeStickyBar({super.key, required this.tabs});
  final List<Map<dynamic, dynamic>> tabs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: Row(
        children: [
          Expanded(
            child: TabBar(
              // controller: _tabController,
              onTap: (index) {},
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).colorScheme.primary,
              labelStyle: Theme.of(context).textTheme.titleSmall,
              // label active颜色
              labelColor: Theme.of(context).colorScheme.primary,
              // label 默认颜色
              unselectedLabelColor:
                  Theme.of(context).colorScheme.inverseSurface,
              enableFeedback: true,
              padding: const EdgeInsets.only(bottom: 3),
              tabs: tabs.map((item) {
                return Tab(text: item['name']);
              }).toList(),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: const Icon(
              Icons.segment,
              color: Colors.black54,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight > minHeight ? maxHeight : minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}