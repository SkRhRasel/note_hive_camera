import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? imageUrl;
  
  Note({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
  });


}

// @Id(autoincrement = true)
// private Long id;
//
// @NotNull
// private String UserId;
//
// @NotNull
// private String ComeFrom;
//
// @NotNull
// private String ProjectId;
//
// @NotNull
// private String ProjectName;
//
// @NotNull
// private String ImageName;
//
// @NotNull
// private String ImageSize;
//
// @NotNull
// private String ImagePath;
// private String ImageLatValue;
// private String ImageLongValue;
// private String ImagePickUpLocation;
// private String ImagePickUpDate;
// private boolean IsSynchronized;