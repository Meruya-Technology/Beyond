class NetworkUtil {
  static String removeIpLastSection(String ipAddress) {
    List<String> sections = ipAddress.split('.');
    if (sections.length == 4) {
      sections.removeLast();
      return sections.join('.');
    }
    return ipAddress; // Return original if not a proper IPv4 address
  }
}
