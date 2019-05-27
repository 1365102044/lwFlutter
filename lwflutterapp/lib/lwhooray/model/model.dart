import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Meta {
  Meta(this.status,this.msg);
  int status;
  String msg;
  factory Meta.fromJson(Map<String,dynamic> json) => _$MetaFromJson(json);
  Map<String,dynamic> toJson() => _$MetaToJson(this);
}

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Reslut{
  Reslut(this.meta,this.response);
  @JsonKey(name: 'meta')
  Meta meta;
  @JsonKey(name: 'response')
  MyResponse response;
  //不同的类使用不同的mixin即可
  factory Reslut.fromJson(Map<String, dynamic> json) => _$ReslutFromJson(json);
  Map<String, dynamic> toJson() => _$ReslutToJson(this);
}



@JsonSerializable()
class MyResponse {
  @JsonKey(name: 'has_more')
  bool hasMore;
  @JsonKey(name: 'last_key')
  var lastKey;
  MyColumn column;
  Article article;
  List<Feed> feeds;
  List<Author> authors;
  List<Author> subscribers;
  List<MyColumn> columns;
  List<MyBanner> banners;
  MyResponse(
      this.column,
      );
  factory MyResponse.fromJson(Map<String,dynamic> json) => _$MyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MyResponseToJson(this);
}

@JsonSerializable()
class Feed {
  String image;
  int type;
  @JsonKey(name: 'index_type')
  int indexType;
  Post post;
  @JsonKey(name: 'news_list')
  List<News> newsList;
  Feed(this.image,this.type,this.post,this.indexType,this.newsList);
  factory Feed.fromJson(Map<String,dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}

@JsonSerializable()
class News{
  String description;
  News(this.description);
  factory News.fromJson(Map<String,dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class Post {
  int id;
  int genre;
  Category category;
  @JsonKey(name: 'column')
  MyColumn column;
  String title;
  String description;
  @JsonKey(name: 'publish_time')
  int publishTime;
  String image;
  @JsonKey(name: 'start_time')
  int startTime;
  @JsonKey(name: 'comment_count')
  int commentCount;
  ///评论数
  @JsonKey(name: 'comment_status')
  bool commentStatus;
  ///收藏数
  @JsonKey(name: 'praise_count')
  int praiseCount;
  @JsonKey(name: 'super_tag')
  String superTag;
  @JsonKey(name: 'page_style')
  int pageStyle;
  @JsonKey(name: 'post_id')
  int postId;
  String appview;
  @JsonKey(name: 'file_length')
  String filmLength;
  String datatype;

  Post({this.id,
    this.genre,
    this.title,
    this.description,
    this.publishTime,
    this.image,
    this.startTime,
    this.commentCount,
    this.commentStatus,
    this.praiseCount,
    this.superTag,
    this.pageStyle,
    this.postId,
    this.appview,
    this.filmLength,
    this.datatype,
    this.category,
    this.column
  });
  factory Post.fromJson(Map<String,dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class Category {
  String title;
  int id;
  @JsonKey(name: 'image_lab')
  String imageLab;
  Category({this.title,this.id,this.imageLab});
  factory Category.fromJson(Map<String,dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class MyColumn {
  String name;
  int id;
  String icon;
  String image;
  String description;
  @JsonKey(name: 'subscriber_num')
  int subscriberNum;
  @JsonKey(name: 'content_provider')
  String contentProvider;
  int location;
  @JsonKey(name: 'show_type')
  int showType;
  MyColumn({this.name,this.id,this.icon,this.location,this.showType,this.description,this.subscriberNum});
  factory MyColumn.fromJson(Map<String,dynamic> json) => _$MyColumnFromJson(json);
  Map<String, dynamic> toJson() => _$MyColumnToJson(this);
}

@JsonSerializable()
class MyBanner {
  int type;
  String image;
  Post post;
  MyBanner({this.type,this.image,this.post});
  factory MyBanner.fromJson(Map<String,dynamic> json) => _$MyBannerFromJson(json);
  Map<String, dynamic> toJson() => _$MyBannerToJson(this);
}

@JsonSerializable()
class Article{
   int id;
   String body;
   List<String> js;
   List<String> css;
   List<String> image;
   Article({this.id,this.body,this.js,this.css,this.image});
  factory Article.fromJson(Map<String,dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Author{
  int id;
  String description;
  String avatar;
  String name;
  Author({this.id,this.description,this.avatar,this.name});
  factory Author.fromJson(Map<String,dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}


/**
 * 
 * 1.@JsonSerializable() 这是表示告诉编译器这个类是需要生成Model类的
 * 2,@JsonKey 由于服务器返回的部分数据名称在Dart语言中是不被允许的,
 * 比如has_more,Dart中命名不能出现下划线,所以就需要用到@JsonKey来告诉编译
 * 器这个参数对于json中的哪个字段
 * 
 * Json序列化
 * 1.首先在pubspec.yaml中导入
 * dependencies: json_annotation: ^2.0.0 dev_dependencies: build_runner: ^1.0.0 json_serializable: ^2.0.0
 * 
 * 2.先导入 model.dart 头文件 引入文件（才能使用命令生成.g.dart文件）
 * import 'package:json_annotation/json_annotation.dart'; part 'model.g.dart';
 * (model.g.dart等会儿会自动生成.)
 * 
 * 3.在控制到输入flutter packages pub run build_runner build指令后会自动生成一个moded.g.dart文件
 * 
 */