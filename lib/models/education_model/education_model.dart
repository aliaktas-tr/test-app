class EducationModel {
  String? mainTitle, mainDescription, mainImage;
  String? title1,
      title1Desc,
      titleImage,
      subTitle1,
      subTitle1Desc,
      subTitle1Desc2,
      subTitle1Desc3;
  String? title2,
      title2Desc,
      title2Image,
      subTitle2,
      subTitle2Desc,
      subTitle2Desc2,
      subTitle2Desc3;
  String? title3,
      title3Desc,
      title3Image,
      subTitle3,
      subTitle3Desc,
      subTitle3Desc2,
      subTitle3Desc3;

  EducationModel(
      {this.mainTitle,
      this.mainDescription,
      this.mainImage,
      this.title1,
      this.title1Desc,
      this.titleImage,
      this.subTitle1,
      this.subTitle1Desc,
      this.subTitle1Desc2,
      this.subTitle1Desc3,
      this.title2,
      this.title2Desc,
      this.title2Image,
      this.subTitle2,
      this.subTitle2Desc,
      this.subTitle2Desc2,
      this.subTitle2Desc3,
      this.title3,
      this.title3Desc,
      this.title3Image,
      this.subTitle3,
      this.subTitle3Desc,
      this.subTitle3Desc2,
      this.subTitle3Desc3});

  factory EducationModel.fromJson(Map<String,dynamic> json){
      return EducationModel(
          title1:json['title1']as String,
          title1Desc:json['title1Desc']as String,
          titleImage:json['titleImage']as String,
          subTitle1:json['subTitle1']as String,
          subTitle1Desc:json['subTitle1Desc']as String,
          subTitle1Desc2:json['subTitle1Desc2']as String,
          subTitle1Desc3:json['subTitle1Desc3']as String,
          title2:json['title2']as String,
          title2Desc:json['title2Desc']as String,
          title2Image:json['title2Image']as String,
          subTitle2:json['subTitle2']as String,
          subTitle2Desc:json['subTitle2Desc']as String,
          subTitle2Desc2:json['subTitle2Desc2']as String,
          subTitle2Desc3:json['subTitle2Desc3']as String,
           title3:json['title3']as String,
          title3Desc:json['title3Desc']as String,
          title3Image:json['title3Image']as String,
          subTitle3:json['subTitle3']as String,
          subTitle3Desc:json['subTitle3Desc']as String,
          subTitle3Desc2:json['subTitle3Desc2']as String,
          subTitle3Desc3:json['subTitle3Desc3']as String,
      );
  }

  Map<String, Object?> toJson() {
      return {
      'mainTitle':mainTitle,
      'mainDescription':mainDescription,
      'mainImage':mainImage,
      'title1':title1,
      'title1Desc':title1Desc,
      'titleImage':titleImage,
      'subTitle1':subTitle1,
      'subTitle1Desc':subTitle1Desc,
      'subTitle1Desc2':subTitle1Desc2,
      'subTitle1Desc3':subTitle1Desc3,
      'title2':title2,
      'title2Desc':title2Desc,
      'title2Image':title2Image,
      'subTitle2':subTitle2,
      'subTitle2Desc':subTitle2Desc,
      'subTitle2Desc2':subTitle2Desc2,
      'subTitle2Desc3':subTitle2Desc3,
      'title3':title3,
      'title3Desc':title3Desc,
      'title3Image':title3Image,
      'subTitle3':subTitle3,
      'subTitle3Desc':subTitle3Desc,
      'subTitle3Desc2':subTitle3Desc2,
      'subTitle3Desc3':subTitle3Desc3
      };
  }

}
