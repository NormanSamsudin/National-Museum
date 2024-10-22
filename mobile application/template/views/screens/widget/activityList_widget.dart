// class ActivityListView extends StatefulWidget {
//   @override
//   _ActivityListViewState createState() => _ActivityListViewState();
// }

// class _ActivityListViewState extends State<ActivityListView> {
//   static const _pageSize = 20;

//   final PagingController<int, Activity> _pagingController =
//       PagingController(firstPageKey: 0);

//   @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//     super.initState();
//   }

//   Future<void> _fetchPage(int pageKey) async {
//     try {
//       final newItems = await ActivityController.getActivityList(pageKey, _pageSize);
//       final isLastPage = newItems.length < _pageSize;
//       if (isLastPage) {
//         _pagingController.appendLastPage(newItems);
//       } else {
//         final nextPageKey = pageKey + newItems.length;
//         _pagingController.appendPage(newItems, nextPageKey);
//       }
//     } catch (error) {
//       _pagingController.error = error;
//     }
//   }

//   @override
//   Widget build(BuildContext context) => 
//       PagedListView<int, Activity>(
//         pagingController: _pagingController,
//         builderDelegate: PagedChildBuilderDelegate<Activity>(
//           itemBuilder: (context, item, index) => ActivityListItem(
//             activity: item,
//           ),
//         ),
//       );

//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }
// }



class ActivityListView extends StatefulWidget {
  @override
  _ActivityListViewState createState() => _ActivityListViewState();
}

class _ActivityListViewState extends State<ActivityListView> {
  static const _pageSize = 20;

  final PagingController<int, Activity> _pagingController =
      PagingController(firstPageKey: 0);

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ActivityController.getActivityList(pageKey, _pageSize, searchQuery: _searchQuery);
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
    _searchQuery = _searchController.text;
    _pagingController.refresh(); // Reset the paging when search changes
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
          child: PagedListView<int, Activity>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Activity>(
              itemBuilder: (context, item, index) => ActivityListItem(
                activity: item,
              ),
              noItemsFoundIndicatorBuilder: (context) => Center(
                child: Text(
                  'No data available',
                  style: TextStyle(fontSize: 18),
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

