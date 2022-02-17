class AllNewsResponse {
  String? _status;
  int? _totalResults;
  List<Articles>? _articles;

  String? get status => _status;
  int get totalResults => _totalResults!;
  List<Articles> get articles => _articles!;

  AllNewsResponse({
      String? status, 
      int? totalResults, 
      List<Articles>? articles}){
    _status = status!;
    _totalResults = totalResults!;
    _articles = articles!;
}

  AllNewsResponse.fromJson(dynamic json) {
    _status = json["status"];
    _totalResults = json["totalResults"];
    if (json["articles"] != null) {
      _articles = [];
      json["articles"].forEach((v) {
        _articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["totalResults"] = _totalResults;
    if (_articles != null) {
      map["articles"] = _articles!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"","name":"PRNewswire"}
/// author : ""
/// title : "Global Electric Vehicle Market is estimated to reach US$ 72,798 Bn by 2050 driven by increasing demand for low-emission vehicles and government initiatives to accelerate EV deployment | CAGR of 21.99% during 2022-2050"
/// description : "NEW DELHI, Feb. 16, 2022 /PRNewswire/ -- The study published by Astute Analytica foresees a rise in revenue of the Global Electric Vehicle Market from US$ 229.8 Bn in 2021 to US$ 72,798 Bn by 2050. The market is registering a CAGR of 21.99% during the forecas…"
/// url : "https://www.prnewswire.com/news-releases/global-electric-vehicle-market-is-estimated-to-reach-us-72-798-bn-by-2050-driven-by-increasing-demand-for-low-emission-vehicles-and-government-initiatives-to-accelerate-ev-deployment--cagr-of-21-99-during-2022-2050--301483489.html"
/// urlToImage : "https://mma.prnewswire.com/media/1582155/Astute_Analytica_Logo.jpg?p=facebook"
/// publishedAt : "2022-02-16T11:30:00Z"
/// content : "NEW DELHI, Feb. 16, 2022 /PRNewswire/ -- The study published by Astute Analytica foresees a rise in revenue of the Global Electric Vehicle Market from US$ 229.8 Bn in 2021 to US$ 72,798 Bn by 2050. T… [+10266 chars]"

class Articles {
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Articles({
      Source? source, 
      String? author, 
      String? title, 
      String? description, 
      String? url, 
      String? urlToImage, 
      String? publishedAt, 
      String? content}){
    _source = source!;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  Articles.fromJson(dynamic json) {
    _source = (json["source"] != null ? Source.fromJson(json["source"]) : null)!;
    _author = json["author"];
    _title = json["title"];
    _description = json["description"];
    _url = json["url"];
    _urlToImage = json["urlToImage"];
    _publishedAt = json["publishedAt"];
    _content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_source != null) {
      map["source"] = _source!.toJson();
    }
    map["author"] = _author;
    map["title"] = _title;
    map["description"] = _description;
    map["url"] = _url;
    map["urlToImage"] = _urlToImage;
    map["publishedAt"] = _publishedAt;
    map["content"] = _content;
    return map;
  }

}

/// id : ""
/// name : "PRNewswire"

class Source {
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Source({
      String? id, 
      String? name}){
    _id = id;
    _name = name;
}

  Source.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

}