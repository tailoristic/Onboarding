class SliderModel {
  String imgUrls;
  String title;
  String desc;

  SliderModel({
    this.imgUrls,
    this.title,
    this.desc,
  });

  void setAssetImgPath(String getImagePath) {
    imgUrls = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImagePath() {
    return imgUrls;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  //1 Data
  sliderModel.setAssetImgPath("assets/6145.jpg");
  sliderModel.setTitle("Welcome!");
  sliderModel.setDesc("Lets get started with your first OnBoarding Expirence ");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2 Data
  sliderModel.setAssetImgPath("assets/6145.jpg");
  sliderModel.setTitle("Welcome!");
  sliderModel.setDesc("Lets get started with your first OnBoarding Expirence ");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3 Data
  sliderModel.setAssetImgPath("assets/6145.jpg");
  sliderModel.setTitle("Get Started");
  sliderModel.setDesc("Find this tutorial useful! Leave a star on my repo");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}
