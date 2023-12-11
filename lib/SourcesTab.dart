import 'package:flutter/material.dart';

import 'model/source_Response.dart';
import 'tab_item.dart';

class SourcesTab extends StatefulWidget {
  List<Source> sources;

  SourcesTab({required this.sources});

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:DefaultTabController(
        length:widget.sources.length,
          child: TabBar(
            isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex=index;
                setState(() {

                });
              },
              tabs: widget.sources.map((source)=> TabItem(
               source:source,
          isSelected:selectedIndex== widget.sources.indexOf(source),
              )).toList()
      )
    )
    );
  }
}
