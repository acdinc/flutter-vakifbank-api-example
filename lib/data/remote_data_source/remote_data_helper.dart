class RemoteData {
  static const baseUrl = 'https://apigw.vakifbank.com.tr:8443';
  static const authenticationPath = '/auth/oauth/v2/token';
  static const bondListPath = '/bondBillEurobondProductList';
  static const bondCalculatorPath = '/bondBillEurobondCalculator';
}

class AuthRequest {
  static const clientId = 'client_id';
  static const clientSecret = 'client_secret';
  static const grantType = 'grant_type';
  static const scope = 'scope';
}

class BondRequest {
  static const productName = 'ProductName';
  static const transactionType = 'TransactionType';
  static const isin = 'ISIN';
  static const item = 'Item';
  static const amount = 'Amount';
}
