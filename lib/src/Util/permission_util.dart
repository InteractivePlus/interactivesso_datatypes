import 'dart:math';

class PermissionUtil{
  static X? mergeItemIfBothNonNull<X>(X? setting, X? permission, X Function(X setting, X permission) mergeFn){
    if(setting != null && permission != null){
      return mergeFn(setting, permission);
    }else{
      return null;
    }
  }

  static X? mergeItemIfRightNonNull<X>(X? setting, X settingDefault, X? permission, X Function(X setting, X permission) mergeFn){
    if(setting != null && permission != null){
      return mergeFn(setting, permission);
    }else if(permission != null){
      return mergeFn(settingDefault, permission);
    }else{
      return null;
    }
  }

  static X? mergeItemCloseToRight<X>(X? setting, X? permission, X Function(X setting, X permission) mergeFn){
    if(setting != null && permission != null){
      return mergeFn(setting, permission);
    }else if(permission != null){
      return permission;
    }else{
      return null;
    }
  }

  static bool mergeItemAnd(bool setting, bool permission) => setting && permission;

  static int mergeItemMin(int setting, int permission) => min(setting, permission);

  PermissionUtil._();
}