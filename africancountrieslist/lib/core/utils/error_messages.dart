class ErrorMessages {
  static String getUserFriendlyMessage(String error) {
    final errorLower = error.toLowerCase();
    
    if (errorLower.contains('failed host lookup') || 
        errorLower.contains('socket exception')) {
      return 'Unable to connect to the server. Please check your internet connection and try again.';
    }
    
    if (errorLower.contains('404')) {
      return 'The country information is not available at the moment. Please try again later.';
    }
    
    if (errorLower.contains('500')) {
      return 'The server is experiencing issues. Please try again later.';
    }
    
    if (errorLower.contains('502')) {
      return 'The service is temporarily unavailable. Please try again in a few minutes.';
    }

    if (errorLower.contains('connection closed') || 
        errorLower.contains('connection refused')) {
      return 'Connection to the server was interrupted. Please try again.';
    }

    // Default message for unknown errors
    return 'Something went wrong. Please try again later.';
  }
}
