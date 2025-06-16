class ProjectHelper {
  static Map<String, String> convertStringToMap(String data) {
    // Step 1: Remove the outer curly braces and split by ','
    String cleanedString = data.trim();
    if (cleanedString.startsWith('{') && cleanedString.endsWith('}')) {
      cleanedString = cleanedString.substring(1, cleanedString.length - 1).trim();
    }

    // Split by ', ' to separate the main components
    List<String> parts = cleanedString.split(', ').map((s) => s.trim()).toList();

    Map<String, String> parsedMap = {};

    // Process each part
    for (String part in parts) {
      // For 'content-disposition' which has multiple key-value pairs
      if (part.startsWith('content-disposition:')) {
        List<String> dispositionParts = part.substring('content-disposition:'.length).trim().split(';');
        parsedMap['content-disposition'] = dispositionParts[0].trim(); // 'form-data'

        for (int i = 1; i < dispositionParts.length; i++) {
          String subPart = dispositionParts[i].trim();
          if (subPart.contains('=')) {
            List<String> keyValue = subPart.split('=');
            String key = keyValue[0].trim();
            String value = keyValue[1].trim().replaceAll('"', ''); // Remove quotes from value
            parsedMap[key] = value;
          }
        }
      }
      // For other simple key-value pairs like 'content-type'
      else if (part.contains(':')) {
        int colonIndex = part.indexOf(':');
        String key = part.substring(0, colonIndex).trim();
        String value = part.substring(colonIndex + 1).trim();
        parsedMap[key] = value;
      }
    }

    print('Original String: $data');
    print('Parsed Map: $parsedMap');

    return parsedMap;
  }
}