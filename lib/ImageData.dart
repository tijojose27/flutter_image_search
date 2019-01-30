class ImageData{
  final int totalHits;
  final List<Hits> hits;

  ImageData({this.totalHits, this.hits});

  factory ImageData.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['hits'] as List;
    print("printing list.runtimeType "+list.runtimeType.toString());
    List<Hits> hitsList = list.map((i) => Hits.fromJson(i)).toList();

    return ImageData(
      totalHits: parsedJson['totalHits'],
      hits: hitsList
    );
  }
}

//class Hits {
//  final String largeImageURL;
//  final int webformatHeight;
//  final int webformatWidth;
//  final int likes;
//  final int imageWidth;
//  final int id;
//  final int userId;
//  final int views;
//  final int comments;
//  final String pageURL;
//  final int imageHeight;
//  final String webformatURL;
//  final String type;
//  final int previewHeight;
//  final String tags;
//  final int downloads;
//  final String user;
//  final int favorites;
//  final int imageSize;
//  final int previewWidth;
//  final String userImageURL;
//  final String previewURL;
//
//  Hits({this.largeImageURL, this.webformatHeight, this.webformatWidth, this.likes, this.imageWidth, this.id, this.userId, this.views, this.comments,
//          this.pageURL, this.imageHeight, this.webformatURL, this.type, this.previewHeight, this.tags, this.downloads, this.user, this.favorites, this.imageSize,
//          this.previewWidth, this.userImageURL, this.previewURL});
//
//  factory Hits.fromJson(Map<String, dynamic> parsedJson){
//    return Hits(
//      largeImageURL: parsedJson['largeImageURL'],
//
//    )
//  }
//}

class Hits {
  final String webformatURL;


  Hits({this.webformatURL});

  factory Hits.fromJson(Map<String, dynamic> parsedJson){
    return Hits(
      webformatURL: parsedJson['webformatURL']
    );
  }
}