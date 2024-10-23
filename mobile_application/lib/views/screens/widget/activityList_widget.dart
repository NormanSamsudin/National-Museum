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
      PagingController(firstPageKey: 0); // Preload when 2 items remain

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
        Container(
          // width: double.infinity,
          // decoration: BoxDecoration(
          //   color: Colors.yellow,
          //   borderRadius: BorderRadius.circular(10.0), // Rounded corners
          // ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15, top: 120, right: 15, bottom: 30),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Search activities and events',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Border rounding
                  borderSide: BorderSide.none, // No border
                ),
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
        ),

        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 160, 202, 253), // Blue bgColor: rgb(160,202,253)
                ),
                alignment: Alignment.topCenter,
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
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/element_curve_blue.png',
                  height: 100, // Set the height of the image
                  fit: BoxFit.contain, // Ensure the image does not cover the whole container
                ),
              ),
            ],
          ),
        ),

        // Expanded(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.fromARGB(255, 160, 202, 253), //Blue bgColor: rgb(160,202,253)
        //       // image: DecorationImage(
        //       //   image: AssetImage("assets/images/ets.jpeg"),
        //       //   fit: BoxFit.cover, // Optional
        //       // ),
        //     ),
        //     alignment: Alignment.topCenter,
        //     child: RefreshIndicator(
        //       onRefresh: _onRefresh, // Pull to refresh implementation
        //       child: PagedListView<int, ActivityModel>(
        //         pagingController: _pagingController,
        //         builderDelegate: PagedChildBuilderDelegate<ActivityModel>(
        //           itemBuilder: (context, item, index) => ActivityWidget(
        //             activity: item,
        //           ),
        //           noItemsFoundIndicatorBuilder: (context) => Center(
        //             child: Text(
        //               'No data available',
        //               style: TextStyle(fontSize: 18),
        //             ),
        //           ),
        //           newPageProgressIndicatorBuilder: (context) => Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //           newPageErrorIndicatorBuilder: (context) => Center(
        //             child: Text(
        //               'Error loading more items',
        //               style: TextStyle(fontSize: 18),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
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
