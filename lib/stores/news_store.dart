import 'package:mobx/mobx.dart';
import 'package:mobx_news/repository/hn_api.dart';
import 'package:url_launcher/url_launcher.dart';

///run: flutter packages pub run build_runner watch
part 'news_store.g.dart';

enum FeedType { latest, top }

class NewsStore  = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  final _hnApi = HNApi();

  @observable
  ObservableFuture<List<FeedItem>>? latestItemsFuture;

  @observable
  ObservableFuture<List<FeedItem>>? topItemsFuture;

  @action
  Future fetchLatest() => latestItemsFuture = ObservableFuture(_hnApi.newest());

  @action
  Future fetchTop() => topItemsFuture = ObservableFuture(_hnApi.top());

  void loadNews(FeedType type) {
    if (type == FeedType.latest && latestItemsFuture == null) {
      fetchLatest();
    } else if (type == FeedType.top && topItemsFuture == null) {
      fetchTop();
    }
  }

  void openUrl(String? url) async {
    if (await canLaunch(url ?? '')) {
      await launch(url!);
    } else {
      print('Could not open $url');
    }
  }
}
