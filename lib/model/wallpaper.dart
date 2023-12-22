class Wallpaper {
  String? authorName;
  String? authorEmail;
  String? wallpaperName;
  String? wallpaperUrl;

  Wallpaper(
      {required this.authorName,
      required this.authorEmail,
      required this.wallpaperName,
      required this.wallpaperUrl});

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
        authorName: json['authorName'],
        authorEmail: json['authorEmail'],
        wallpaperName: json['wallpaperName'],
        wallpaperUrl: json['wallpaperUrl']);
  }
}
