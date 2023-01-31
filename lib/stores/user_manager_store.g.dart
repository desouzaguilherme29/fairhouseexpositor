// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserManagerStore on _UserManagerStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_UserManagerStore.isLoggedIn'))
          .value;

  late final _$userAtom =
      Atom(name: '_UserManagerStore.user', context: context);

  @override
  Usuario? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Usuario? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$setUserAsyncAction =
      AsyncAction('_UserManagerStore.setUser', context: context);

  @override
  Future setUser(Usuario? value) {
    return _$setUserAsyncAction.run(() => super.setUser(value));
  }

  late final _$logoutUserAsyncAction =
      AsyncAction('_UserManagerStore.logoutUser', context: context);

  @override
  Future logoutUser() {
    return _$logoutUserAsyncAction.run(() => super.logoutUser());
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
