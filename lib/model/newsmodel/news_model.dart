class NewsModel {
    NewsModel({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    final String? status;
    static const String statusKey = "status";
    
    final int? totalResults;
    static const String totalResultsKey = "totalResults";
    
    final List<Article> articles;
    static const String articlesKey = "articles";
    

    factory NewsModel.fromJson(Map<String, dynamic> json){ 
        return NewsModel(
            status: json["status"],
            totalResults: json["totalResults"],
            articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles.map((x) => x.toJson()).toList(),
    };

}

class Article {
    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    final Source? source;
    static const String sourceKey = "source";
    
    final String? author;
    static const String authorKey = "author";
    
    final String? title;
    static const String titleKey = "title";
    
    final String? description;
    static const String descriptionKey = "description";
    
    final String? url;
    static const String urlKey = "url";
    
    final String? urlToImage;
    static const String urlToImageKey = "urlToImage";
    
    final DateTime? publishedAt;
    static const String publishedAtKey = "publishedAt";
    
    final String? content;
    static const String contentKey = "content";
    

    factory Article.fromJson(Map<String, dynamic> json){ 
        return Article(
            source: json["source"] == null ? null : Source.fromJson(json["source"]),
            author: json["author"],
            title: json["title"],
            description: json["description"],
            url: json["url"],
            urlToImage: json["urlToImage"],
            publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
            content: json["content"],
        );
    }

    Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
    };

}

class Source {
    Source({
        required this.id,
        required this.name,
    });

    final String? id;
    static const String idKey = "id";
    
    final String? name;
    static const String nameKey = "name";
    

    factory Source.fromJson(Map<String, dynamic> json){ 
        return Source(
            id: json["id"],
            name: json["name"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

}
