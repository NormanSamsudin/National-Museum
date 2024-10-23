import 'package:flutter/material.dart';
import 'package:mobile_application/controllers/activity_controller.dart';
import 'package:mobile_application/controllers/auth_controller.dart';
import 'package:mobile_application/models/activity.dart';
import 'package:mobile_application/views/screens/widget/activity_widget.dart';

class ActivityListView extends StatefulWidget {
  @override
  _ActivityListViewState createState() => _ActivityListViewState();
}

class _ActivityListViewState extends State<ActivityListView> {
  static const _pageSize = 5;
  final ScrollController _scrollController = ScrollController();
  final AuthController _authController = AuthController();

  List<ActivityModel> _activities =
      []; // Manually manage the list of activities
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchPage(_currentPage);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchPage(_currentPage); // Load next page when reaching the bottom
      }
    });

    _searchController.addListener(_onSearchChanged); // Listen to search changes
  }

  Future<void> _fetchPage(int pageKey) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newItems = await ActivityController.getActivityList(
        pageKey,
        _pageSize,
        searchQuery: _searchQuery,
      );
      setState(() {
        _isLoading = false;
        _activities.addAll(newItems); // Append new items to the existing list
        _currentPage += 1;
        if (newItems.length < _pageSize) {
          _hasMore = false; // No more pages to load
        }
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasMore = false;
      });
      // Handle the error, maybe show a message
    }
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _activities.clear(); // Reset the list when search query changes
      _currentPage = 0;
      _hasMore = true;
      _fetchPage(_currentPage);
    });
  }

  Future<void> _onRefresh() async {
    setState(() {
      _activities.clear(); // Clear the list when refreshing
      _currentPage = 0;
      _hasMore = true;
    });
    await _fetchPage(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 51,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const Spacer(),
              InkWell(
                  onTap: () async {
                    await _authController.signOutUsers(context: context);
                  },
                  child: const Icon(Icons.exit_to_app)),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 45, right: 15, bottom: 0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Search activities and events',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearchChanged,
                ),
              ),
              onSubmitted: (value) {
                _onSearchChanged();
              },
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 160, 202, 253),
          height: 690,
          child: Stack(
            children: [
              // Place the image first so it's at the back
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/curve.jpg',
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 300,
                left: 0,
                right: 0,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(-3.1415926535897932 / 0.2),
                  child: Image.asset(
                    'assets/images/element_curve_blue.png',
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Then place the Container with the ListView on top of the image
              Container(
                alignment: Alignment.topCenter,
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _activities.length +
                        (_hasMore
                            ? 1
                            : 0), // Show loading indicator if more items are available
                    itemBuilder: (context, index) {
                      if (index == _activities.length) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ActivityWidget(activity: _activities[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
