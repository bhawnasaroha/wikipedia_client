class UtilFunctions {
  static String fixImageUrl(description) {
    String articleDescription = description;
    String br = "<br>";
    String imageUrlPrefix = "https://upload";
    String imageUrlPrefixToChange = "//upload";
    articleDescription = articleDescription.replaceAll("\\n", br);
    articleDescription = articleDescription.replaceAll("\\", "");
    articleDescription =
        articleDescription.replaceAll(imageUrlPrefixToChange, imageUrlPrefix);
    return articleDescription;
  }
}
