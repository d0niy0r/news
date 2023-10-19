class Repository {
  String title;
  String imageUrl;
  String subtitle;

  Repository(this.title, this.imageUrl, this.subtitle);

  static List<Repository> list = [
    Repository("CNN", "assets/image/1.jpg",
        "Biden offers message for KIm Jong Un as he prepares to wrap first leg of his Asia trip-Cnn"),
    Repository("Reuters", "assets/image/2.jpg",
        "Palestine supporters march in London against Israel action in Gaza - Reuters"),
    Repository("CNN", "assets/image/3.jpg",
        "Trump tells judge he will appeal gag order in federal election interference case - NBC News"),
    Repository("CNN", "assets/image/4.jpg",
        "Drug retailer Rite Aid files for bankruptcy amid rising debt, opioid litigation - Reuters"),
    Repository("CNN", "assets/image/1.jpg", ""),
  ];
}
