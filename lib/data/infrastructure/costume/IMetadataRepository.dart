abstract class IMetadataRepository{
  Future<List<String>> getCategories(String institutionId);

  Future<List<String>> getTimePeriods(String institutionId);



  Future<List<String>> getColors(String institutionId);

  Future<List<String>> getThemes(String institutionId);

}