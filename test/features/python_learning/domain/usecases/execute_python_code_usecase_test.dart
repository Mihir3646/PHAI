import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:python_ffi/python_ffi.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/execute_python_code_usecase.dart';

class MockPythonFfi extends Mock implements PythonFfi {}

void main() {
  test('ExecutePythonCodeUseCase captures output', () async {
    final mock = MockPythonFfi();
    PythonFfi.instance = mock;
    when(() => mock.importModule('builtins')).thenReturn(MockPythonModule());
    when(() => mock.stdout).thenReturn('out');
    when(() => mock.stderr).thenReturn('');
    final usecase = ExecutePythonCodeUseCase();
    final result = await usecase('print(1)');
    expect(result.output, 'out');
  });
}

class MockPythonModule extends Mock implements PythonFfiModule {}
