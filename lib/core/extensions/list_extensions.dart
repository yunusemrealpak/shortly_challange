extension ListExtensions<T> on List<T> {
  Map<T, E> toMap<E>(E Function(T) f) => {for (var key in this) key: f(key)};

  List<T> get byRemovingDuplicates => [
        ...{...this}
      ];
}
