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

  static String findFullArticleLink(
      String articleDescription, String articleLink) {
    String fullArticleUrl = articleLink;
    int indexOfFull = articleDescription.indexOf('Full');
    if (indexOfFull > 0) {
      String descriptionFullUrlSearchSet =
          articleDescription.substring(0, indexOfFull);
      int indexOfHref = descriptionFullUrlSearchSet.lastIndexOf('href');
      String fullArticleUrlSearchSet = descriptionFullUrlSearchSet.substring(
          indexOfHref, descriptionFullUrlSearchSet.length);
      fullArticleUrl = "https://en.wikipedia.org" +
          fullArticleUrlSearchSet.substring(
            fullArticleUrlSearchSet.indexOf('"') + 1,
            fullArticleUrlSearchSet.indexOf(
              '"',
              fullArticleUrlSearchSet.indexOf('"') + 1,
            ),
          );
    }
    return fullArticleUrl;
  }
}
