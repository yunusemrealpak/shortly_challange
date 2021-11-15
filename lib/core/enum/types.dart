enum ApplicationTypeEnum {
  VendorAndOneBranch,
  MultipleCompany,
  Pazar,
}

enum UpdateSCEnum {
  Increase,
  Descrease,
}

enum StateEnum {
  VendorAndOneBranch,
  MultipleCompany,
  Pazar,

  GetShoppingCard,

  SelectCompanyStartup,

  GetMainCategories,
  GetSubCategoriesState,
  GetProductsState,
  GetSubProducts,

  GetProduct,

  GetBasketState,
  UpdateBasketState,
  ResetBasketState,

  Contact,
  CompleteAddress,
  OrderDetails,
  Redirect,

  Authenticate,
  Register,
  VerifySmsCode,
  AutoLogin,
  Logout,

  GetOrders,
  SendOrder,

  GetAddresses,
  UpdateAddress,
  DeleteAddress,

  UpdateAccount,
}

enum LoginStateEnum {
  Authenticate,
  Register,
  VerifySmsCode,
}

enum ContactEnum {
  Whatsapp,
  Call,
}

enum ViewState {
  Busy,
  Idle,
}

enum ClientControlResponse {
  ClientChange,
}

enum AuthenticateResponse {
  NextRegister,
  NextVerify,
  NextHome,
  Error,
  ConnectionLost,
}

enum RegisterResponse {
  NextVerify,
  Error,
  ConnectionLost,
}

enum VerifyPhoneResponse {
  NextHome,
  DismatchCode,
  Error,
  ConnectionLost,
}
