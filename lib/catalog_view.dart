import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:staff/search_header.dart';

class ClothesRepository extends LoadingMoreBase<String> {
  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  @override
  bool get hasMore => (_hasMore && length < 30) || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    pageindex = 1;
    //force to refresh list when you don't want clear list before request
    //for the case, if your list already has 20 items.
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) {
    return Future.value(true);
  }
}

class CatalogView extends StatefulWidget {
  CatalogView();

  @override
  CatalogViewState createState() => CatalogViewState();
}

class CatalogViewState extends State<CatalogView> {
  ClothesRepository repository = ClothesRepository();

  CatalogViewState() {
    repository.add("sadasd");
    repository.add("sadasd");
    repository.add("sadasd");
    repository.add("sadasd");
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    // /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height) / 2;
    // final double itemWidth = size.width / 2;

    // return ListView.builder(
    //     padding: EdgeInsets.all(0),
    //     itemExtent: 100.0,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         color: index % 2 == 0 ? Colors.green : Colors.indigo,
    //       );
    //     });
    return CustomScrollView(
      physics: NoImplicitScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          delegate: SearchHeader(),
          pinned: true,
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 9.0, right: 9.0, top: 8.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.58,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Image.network(
                              "https://static.staff-clothes.com/uploads/media/image_product/0001/56/b379957beda34f03af94f243d08d7130.jpeg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "Кроссовки Staff black & navy & orange",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            child: Text(
                              "40, 41, 42, 43",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "260 грн.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      ]),
                );
              },
              childCount: 20,
            ),
          ),
        )
      ],
    );

    // return NestedScrollView(
    //   physics: const NeverScrollableScrollPhysics(),
    //   headerSliverBuilder: (context, innerBoxIsScrolled) {
    //     return [
    //       SliverPersistentHeader(
    //         delegate: SearchHeader(),
    //         pinned: true,
    //       ),
    //       // SliverPadding(
    //       //   padding: EdgeInsets.only(left: 9.0, right: 9.0, top: 8.0),
    //       //   sliver: SliverGrid(
    //       //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //       //       maxCrossAxisExtent: 200.0,
    //       //       mainAxisSpacing: 15.0,
    //       //       crossAxisSpacing: 10.0,
    //       //       childAspectRatio: 0.58,
    //       //     ),
    //       //     delegate: SliverChildBuilderDelegate(
    //       //       (BuildContext context, int index) {
    //       //         return Container(
    //       //           child: Column(
    //       //               crossAxisAlignment: CrossAxisAlignment.center,
    //       //               children: [
    //       //                 Flexible(
    //       //                   flex: 1,
    //       //                   child: Image.network(
    //       //                       "https://static.staff-clothes.com/uploads/media/image_product/0001/56/b379957beda34f03af94f243d08d7130.jpeg"),
    //       //                 ),
    //       //                 Padding(
    //       //                   padding: const EdgeInsets.symmetric(vertical: 4.0),
    //       //                   child: Text(
    //       //                     "Кроссовки Staff black & navy & orange",
    //       //                     style: TextStyle(
    //       //                         fontWeight: FontWeight.w300, fontSize: 12.0),
    //       //                   ),
    //       //                 ),
    //       //                 Align(
    //       //                   alignment: Alignment.centerLeft,
    //       //                   child: Padding(
    //       //                     padding:
    //       //                         const EdgeInsets.symmetric(vertical: 0.0),
    //       //                     child: Text(
    //       //                       "40, 41, 42, 43",
    //       //                       style: TextStyle(
    //       //                           fontWeight: FontWeight.w400,
    //       //                           fontSize: 12.0,
    //       //                           color: Colors.grey),
    //       //                     ),
    //       //                   ),
    //       //                 ),
    //       //                 Align(
    //       //                   alignment: Alignment.centerLeft,
    //       //                   child: Padding(
    //       //                     padding: const EdgeInsets.only(top: 4.0),
    //       //                     child: Text(
    //       //                       "260 грн.",
    //       //                       style: TextStyle(
    //       //                           fontWeight: FontWeight.w400,
    //       //                           fontSize: 14.0,
    //       //                           color: Colors.black),
    //       //                     ),
    //       //                   ),
    //       //                 )
    //       //               ]),
    //       //         );
    //       //       },
    //       //       childCount: 20,
    //       //     ),
    //       //   ),
    //       // )
    //     ];
    //   },
    //   body: ListView.builder(
    //       physics: const NeverScrollableScrollPhysics(),
    //       itemBuilder: (context, index) => Container(
    //             height: 100,
    //             color: index % 2 == 0 ? Colors.red : Colors.green,
    //           )),
    // );
  }
}

class NoImplicitScrollPhysics extends AlwaysScrollableScrollPhysics {
  const NoImplicitScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  bool get allowImplicitScrolling => false;

  @override
  NoImplicitScrollPhysics applyTo(ScrollPhysics ancestor) {
    return NoImplicitScrollPhysics(parent: buildParent(ancestor));
  }
}
