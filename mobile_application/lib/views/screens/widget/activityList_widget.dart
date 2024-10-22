// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:mobile_application/controllers/activity_controller.dart';
// import 'package:mobile_application/models/activity.dart';
// import 'package:mobile_application/views/screens/widget/activity_widget.dart';

// class ActivityListView extends StatefulWidget {
//   @override
//   _ActivityListViewState createState() => _ActivityListViewState();
// }

// class _ActivityListViewState extends State<ActivityListView> {
//   static const _pageSize = 5;

//   final PagingController<int, ActivityModel> _pagingController =
//       PagingController(
//           firstPageKey: 0,
//           invisibleItemsThreshold: 2); // Preload when 2 items remain

//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';

//   @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//     _searchController.addListener(_onSearchChanged); // Listen to search changes
//     super.initState();
//   }

//   Future<void> _fetchPage(int pageKey) async {
//     try {
//       final newItems = await ActivityController.getActivityList(
//         pageKey,
//         _pageSize,
//         searchQuery: _searchQuery, // Pass the search query
//       );
//       final isLastPage = newItems.length < _pageSize;
//       if (isLastPage) {
//         if (newItems.isEmpty && pageKey == 0) {
//           // If no items are found on the first page, show "No data available"
//           _pagingController.appendLastPage([]);
//         } else {
//           _pagingController.appendLastPage(newItems);
//         }
//       } else {
//         final nextPageKey = pageKey + newItems.length;
//         _pagingController.appendPage(newItems, nextPageKey);
//       }
//     } catch (error) {
//       _pagingController.error = error;
//     }
//   }

//   void _onSearchChanged() {
//     setState(() {
//       _searchQuery = _searchController.text;
//       _pagingController.refresh(); // Reset the paging when search changes
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: _searchController,
//             decoration: InputDecoration(
//               labelText: 'Search activities',
//               border: OutlineInputBorder(),
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.search),
//                 onPressed: _onSearchChanged,
//               ),
//             ),
//             onSubmitted: (value) {
//               _onSearchChanged(); // Trigger search when Enter is pressed
//             },
//           ),
//         ),
//         Expanded(
//           child: PagedListView<int, ActivityModel>(
//             pagingController: _pagingController,

//             builderDelegate: PagedChildBuilderDelegate<ActivityModel>(

//               itemBuilder: (context, item, index) => ActivityWidget(
//                 activity: item,
//               ),
//               noItemsFoundIndicatorBuilder: (context) => Center(
//                 child: Text(
//                   'No data available',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//               newPageProgressIndicatorBuilder: (context) => Center(
//                 child: CircularProgressIndicator(),
//               ),
//               newPageErrorIndicatorBuilder: (context) => Center(
//                 child: Text(
//                   'Error loading more items',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _pagingController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile_application/controllers/activity_controller.dart';
import 'package:mobile_application/models/activity.dart';
import 'package:mobile_application/views/screens/widget/activity_widget.dart';

class ActivityListView extends StatefulWidget {
  @override
  _ActivityListViewState createState() => _ActivityListViewState();
}

class _ActivityListViewState extends State<ActivityListView> {
  static const _pageSize = 10;

  final PagingController<int, ActivityModel> _pagingController =
      PagingController(
          firstPageKey: 0); // Preload when 2 items remain

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      
      _fetchPage(pageKey); // Fetch the next page when needed
    });
    _searchController.addListener(_onSearchChanged); // Listen to search changes
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      debugPrint("fetching page");
      final newItems = await ActivityController.getActivityList(
        pageKey,
        _pageSize,
        searchQuery: _searchQuery, // Pass the search query
      );
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        if (newItems.isEmpty && pageKey == 0) {
          // If no items are found on the first page, show "No data available"
          _pagingController.appendLastPage([]);
        } else {
          _pagingController.appendLastPage(newItems);
        }
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _pagingController.refresh(); // Reset the paging when search changes
    });
  }

  Future<void> _onRefresh() async {
    _pagingController
        .refresh(); // Triggers a full reload when pulling to refresh
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search activities',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _onSearchChanged,
              ),
            ),
            onSubmitted: (value) {
              _onSearchChanged(); // Trigger search when Enter is pressed
            },
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh, // Pull to refresh implementation
            child: PagedListView<int, ActivityModel>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<ActivityModel>(
                itemBuilder: (context, item, index) => ActivityWidget(
                  activity: item,
                ),
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Text(
                    'No data available',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                newPageProgressIndicatorBuilder: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
                newPageErrorIndicatorBuilder: (context) => Center(
                  child: Text(
                    'Error loading more items',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
