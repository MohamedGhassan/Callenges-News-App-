class NewsMyModel {
  final int? id;
  final String? title;
  final String? image;
  final String? category;
  final String? channel;
  final String? hours;
  bool isBookmarked;

  NewsMyModel({
     this.id,
     this.title,
     this.image,
     this.category,
     this.channel,
     this.hours,
    this.isBookmarked = false
  });

  NewsMyModel copyWith({
    int? id,
    String? title,
    String? image,
    String? category,
    String? channel,
    String? hours,
    bool? isFavorite,
  }) {
    return NewsMyModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      category: category ?? this.category,
      channel: channel ?? this.channel,
      hours: hours ?? this.hours,
      isBookmarked: isFavorite ?? this.isBookmarked,
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'category': category,
      'channel': channel,
      'hours': hours,
      'isBookmarked': isBookmarked,
    };
  }
  factory NewsMyModel.fromJson(Map<String, dynamic> json) => NewsMyModel(
    title: json['title'] as String? ?? '',
    image: json['image'] as String? ?? '',
    category: json['category'] as String? ?? '',
    channel: json['channel'] as String? ?? '',
    hours: json['hours'] as String? ?? '',
    // isBookmarked: json['isBookmarked'] ,
  );
  @override
  List<Object?> get props {
    return [
      title,
      image,
      category,
      channel,
      hours,
      isBookmarked,
    ];
  }
}

List<NewsMyModel> news = [
  NewsMyModel(
      id: 1,
      title:
          'Russia is war in Ukraine',
      image:
          'https://dynaimage.cdn.cnn.com/cnn/digital-images/org/831269e3-bb65-4448-9695-03c71f75d0d7.jpg',
      category: 'Policy',
      hours: '6',
      channel: 'CNN'),
  NewsMyModel(
      id: 2,
      title:
          'Wrexham: An intoxicating tale of Hollywood glamor and sporting romance',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/230426152040-01-wrexham-promotion-feature.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp',
      category: 'Life',
      hours: '2',
      channel: 'CNN'),
  NewsMyModel(
      id: 3,
      title: 'Starship could be ready to launch again in ‘six to eight weeks,’ Elon Musk says',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/230428164220-08-spacex-starship-launch-0420.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp',
      category: 'Science',
      hours: '12',
      channel: 'CNN'),
  NewsMyModel(
      id: 4,
      title:
          'Italy wants to build the world’s longest suspension bridge. The Mafia and geography might make that difficult',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/230429085317-01-messina-bridge-project.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp',
      category: 'Economy',
      hours: '3',
      channel: 'CNN'),
  NewsMyModel(
      id: 5,
      title:
          '10 best cuisines in the world',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/170517150325-food-general.jpg?q=x_5,y_229,h_2478,w_4404,c_crop/h_720,w_1280/f_webp',
      category: 'Nature',
      hours: '5',
      channel: 'CNN'),
  NewsMyModel(
      id: 6,
      title:
      'Gwyneth Paltrow reflects on her past relationships with Brad Pitt and Ben Affleck',
      image:
      'https://media.cnn.com/api/v1/images/stellar/prod/230503085954-pitt-paltrow-affleck-split.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp',
      category: 'Movies',
      hours: '1',
      channel: 'CNN'),
  NewsMyModel(
      id: 7,
      title:
      'School shooting suspect killed security guard before schoolmates, police chief says',
      image:
      'https://dynaimage.cdn.cnn.com/cnn/digital-images/org/03bf177b-2fda-44e0-89d2-dd276613d10c.jpg',
      category: 'Crime',
      hours: '7',
      channel: 'CNN'),
  NewsMyModel(
      id: 8,
      title:
      'Sheila Bair to Jerome Powell: Stop trying to look so tough on inflation. It will backfire',
      image:
      'https://media.cnn.com/api/v1/images/stellar/prod/230502073419-sheila-bair-file-restricted-033023.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp',
      category: 'Policy',
      hours: '9',
      channel: 'CNN'),
];

