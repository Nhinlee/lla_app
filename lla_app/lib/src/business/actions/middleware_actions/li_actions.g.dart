// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'li_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadLIItemAction extends UploadLIItemAction {
  @override
  final LearningItemEntity learningItem;
  @override
  final File file;
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$UploadLIItemAction(
          [void Function(UploadLIItemActionBuilder)? updates]) =>
      (new UploadLIItemActionBuilder()..update(updates))._build();

  _$UploadLIItemAction._(
      {required this.learningItem,
      required this.file,
      this.afterSuccessStatus,
      this.afterErrorStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        learningItem, r'UploadLIItemAction', 'learningItem');
    BuiltValueNullFieldError.checkNotNull(file, r'UploadLIItemAction', 'file');
  }

  @override
  UploadLIItemAction rebuild(
          void Function(UploadLIItemActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadLIItemActionBuilder toBuilder() =>
      new UploadLIItemActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadLIItemAction &&
        learningItem == other.learningItem &&
        file == other.file &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, learningItem.hashCode);
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadLIItemAction')
          ..add('learningItem', learningItem)
          ..add('file', file)
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class UploadLIItemActionBuilder
    implements
        Builder<UploadLIItemAction, UploadLIItemActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$UploadLIItemAction? _$v;

  LearningItemEntityBuilder? _learningItem;
  LearningItemEntityBuilder get learningItem =>
      _$this._learningItem ??= new LearningItemEntityBuilder();
  set learningItem(covariant LearningItemEntityBuilder? learningItem) =>
      _$this._learningItem = learningItem;

  File? _file;
  File? get file => _$this._file;
  set file(covariant File? file) => _$this._file = file;

  StatusBuilder? _afterSuccessStatus;
  StatusBuilder get afterSuccessStatus =>
      _$this._afterSuccessStatus ??= new StatusBuilder();
  set afterSuccessStatus(covariant StatusBuilder? afterSuccessStatus) =>
      _$this._afterSuccessStatus = afterSuccessStatus;

  StatusBuilder? _afterErrorStatus;
  StatusBuilder get afterErrorStatus =>
      _$this._afterErrorStatus ??= new StatusBuilder();
  set afterErrorStatus(covariant StatusBuilder? afterErrorStatus) =>
      _$this._afterErrorStatus = afterErrorStatus;

  UploadLIItemActionBuilder();

  UploadLIItemActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _learningItem = $v.learningItem.toBuilder();
      _file = $v.file;
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UploadLIItemAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadLIItemAction;
  }

  @override
  void update(void Function(UploadLIItemActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadLIItemAction build() => _build();

  _$UploadLIItemAction _build() {
    _$UploadLIItemAction _$result;
    try {
      _$result = _$v ??
          new _$UploadLIItemAction._(
              learningItem: learningItem.build(),
              file: BuiltValueNullFieldError.checkNotNull(
                  file, r'UploadLIItemAction', 'file'),
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'learningItem';
        learningItem.build();

        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UploadLIItemAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GetLIItemsAction extends GetLIItemsAction {
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$GetLIItemsAction(
          [void Function(GetLIItemsActionBuilder)? updates]) =>
      (new GetLIItemsActionBuilder()..update(updates))._build();

  _$GetLIItemsAction._({this.afterSuccessStatus, this.afterErrorStatus})
      : super._();

  @override
  GetLIItemsAction rebuild(void Function(GetLIItemsActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetLIItemsActionBuilder toBuilder() =>
      new GetLIItemsActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetLIItemsAction &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetLIItemsAction')
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class GetLIItemsActionBuilder
    implements
        Builder<GetLIItemsAction, GetLIItemsActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$GetLIItemsAction? _$v;

  StatusBuilder? _afterSuccessStatus;
  StatusBuilder get afterSuccessStatus =>
      _$this._afterSuccessStatus ??= new StatusBuilder();
  set afterSuccessStatus(covariant StatusBuilder? afterSuccessStatus) =>
      _$this._afterSuccessStatus = afterSuccessStatus;

  StatusBuilder? _afterErrorStatus;
  StatusBuilder get afterErrorStatus =>
      _$this._afterErrorStatus ??= new StatusBuilder();
  set afterErrorStatus(covariant StatusBuilder? afterErrorStatus) =>
      _$this._afterErrorStatus = afterErrorStatus;

  GetLIItemsActionBuilder();

  GetLIItemsActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GetLIItemsAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetLIItemsAction;
  }

  @override
  void update(void Function(GetLIItemsActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetLIItemsAction build() => _build();

  _$GetLIItemsAction _build() {
    _$GetLIItemsAction _$result;
    try {
      _$result = _$v ??
          new _$GetLIItemsAction._(
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetLIItemsAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UploadImageAndGenerateTitleAction
    extends UploadImageAndGenerateTitleAction {
  @override
  final File file;
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$UploadImageAndGenerateTitleAction(
          [void Function(UploadImageAndGenerateTitleActionBuilder)? updates]) =>
      (new UploadImageAndGenerateTitleActionBuilder()..update(updates))
          ._build();

  _$UploadImageAndGenerateTitleAction._(
      {required this.file, this.afterSuccessStatus, this.afterErrorStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        file, r'UploadImageAndGenerateTitleAction', 'file');
  }

  @override
  UploadImageAndGenerateTitleAction rebuild(
          void Function(UploadImageAndGenerateTitleActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadImageAndGenerateTitleActionBuilder toBuilder() =>
      new UploadImageAndGenerateTitleActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadImageAndGenerateTitleAction &&
        file == other.file &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadImageAndGenerateTitleAction')
          ..add('file', file)
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class UploadImageAndGenerateTitleActionBuilder
    implements
        Builder<UploadImageAndGenerateTitleAction,
            UploadImageAndGenerateTitleActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$UploadImageAndGenerateTitleAction? _$v;

  File? _file;
  File? get file => _$this._file;
  set file(covariant File? file) => _$this._file = file;

  StatusBuilder? _afterSuccessStatus;
  StatusBuilder get afterSuccessStatus =>
      _$this._afterSuccessStatus ??= new StatusBuilder();
  set afterSuccessStatus(covariant StatusBuilder? afterSuccessStatus) =>
      _$this._afterSuccessStatus = afterSuccessStatus;

  StatusBuilder? _afterErrorStatus;
  StatusBuilder get afterErrorStatus =>
      _$this._afterErrorStatus ??= new StatusBuilder();
  set afterErrorStatus(covariant StatusBuilder? afterErrorStatus) =>
      _$this._afterErrorStatus = afterErrorStatus;

  UploadImageAndGenerateTitleActionBuilder();

  UploadImageAndGenerateTitleActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _file = $v.file;
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UploadImageAndGenerateTitleAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadImageAndGenerateTitleAction;
  }

  @override
  void update(
      void Function(UploadImageAndGenerateTitleActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadImageAndGenerateTitleAction build() => _build();

  _$UploadImageAndGenerateTitleAction _build() {
    _$UploadImageAndGenerateTitleAction _$result;
    try {
      _$result = _$v ??
          new _$UploadImageAndGenerateTitleAction._(
              file: BuiltValueNullFieldError.checkNotNull(
                  file, r'UploadImageAndGenerateTitleAction', 'file'),
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UploadImageAndGenerateTitleAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GenerateEnglishSentencesAction extends GenerateEnglishSentencesAction {
  @override
  final String englishWord;
  @override
  final String imageName;
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$GenerateEnglishSentencesAction(
          [void Function(GenerateEnglishSentencesActionBuilder)? updates]) =>
      (new GenerateEnglishSentencesActionBuilder()..update(updates))._build();

  _$GenerateEnglishSentencesAction._(
      {required this.englishWord,
      required this.imageName,
      this.afterSuccessStatus,
      this.afterErrorStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        englishWord, r'GenerateEnglishSentencesAction', 'englishWord');
    BuiltValueNullFieldError.checkNotNull(
        imageName, r'GenerateEnglishSentencesAction', 'imageName');
  }

  @override
  GenerateEnglishSentencesAction rebuild(
          void Function(GenerateEnglishSentencesActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenerateEnglishSentencesActionBuilder toBuilder() =>
      new GenerateEnglishSentencesActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenerateEnglishSentencesAction &&
        englishWord == other.englishWord &&
        imageName == other.imageName &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, englishWord.hashCode);
    _$hash = $jc(_$hash, imageName.hashCode);
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenerateEnglishSentencesAction')
          ..add('englishWord', englishWord)
          ..add('imageName', imageName)
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class GenerateEnglishSentencesActionBuilder
    implements
        Builder<GenerateEnglishSentencesAction,
            GenerateEnglishSentencesActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$GenerateEnglishSentencesAction? _$v;

  String? _englishWord;
  String? get englishWord => _$this._englishWord;
  set englishWord(covariant String? englishWord) =>
      _$this._englishWord = englishWord;

  String? _imageName;
  String? get imageName => _$this._imageName;
  set imageName(covariant String? imageName) => _$this._imageName = imageName;

  StatusBuilder? _afterSuccessStatus;
  StatusBuilder get afterSuccessStatus =>
      _$this._afterSuccessStatus ??= new StatusBuilder();
  set afterSuccessStatus(covariant StatusBuilder? afterSuccessStatus) =>
      _$this._afterSuccessStatus = afterSuccessStatus;

  StatusBuilder? _afterErrorStatus;
  StatusBuilder get afterErrorStatus =>
      _$this._afterErrorStatus ??= new StatusBuilder();
  set afterErrorStatus(covariant StatusBuilder? afterErrorStatus) =>
      _$this._afterErrorStatus = afterErrorStatus;

  GenerateEnglishSentencesActionBuilder();

  GenerateEnglishSentencesActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _englishWord = $v.englishWord;
      _imageName = $v.imageName;
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GenerateEnglishSentencesAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenerateEnglishSentencesAction;
  }

  @override
  void update(void Function(GenerateEnglishSentencesActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenerateEnglishSentencesAction build() => _build();

  _$GenerateEnglishSentencesAction _build() {
    _$GenerateEnglishSentencesAction _$result;
    try {
      _$result = _$v ??
          new _$GenerateEnglishSentencesAction._(
              englishWord: BuiltValueNullFieldError.checkNotNull(englishWord,
                  r'GenerateEnglishSentencesAction', 'englishWord'),
              imageName: BuiltValueNullFieldError.checkNotNull(
                  imageName, r'GenerateEnglishSentencesAction', 'imageName'),
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GenerateEnglishSentencesAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
