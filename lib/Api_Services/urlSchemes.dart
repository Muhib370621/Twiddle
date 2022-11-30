class UrlSchemes{
  static String baseUrlDev = "https://twidle-agent-api.herokuapp.com/api";
//~~~~~~~~~~~~~~~~~~~~~~~~~Real Estate Authentication Urls~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  static String userLogin = "/user/login";
  static String userSignUp = "/user";

//~~~~~~~~~~~~~~~~~~~~~~~~~Real Estate Get Urls~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  static String getRentProperties = "/property/filter/type?search=rent";
  static String getSalesProperties = "/property/filter/type?search=sale";
  static String getShortStayProperties = "/property/filter/type?search=Short Stay";
}