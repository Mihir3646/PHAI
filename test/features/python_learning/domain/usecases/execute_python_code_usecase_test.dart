import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:python_ffi/python_ffi.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/execute_python_code_usecase.dart';

class MockPythonFfi extends Mock implements PythonFfi {}
class MockPythonModule extends Mock implements PythonModule {}
class MockPythonFunction extends Mock implements PythonFunction {}

void main() {
  test('ExecutePythonCodeUseCase captures output', () async {
    final ffi = MockPythonFfi();
    final module = MockPythonModule();
    final func = MockPythonFunction();

    PythonFfi.instance = ffi;

    when(() => ffi.importModule('builtins', any())).thenReturn(module);
    when(() => module.getFunction('exec')).thenReturn(func);
    when(() => func.call(any())).thenReturn(null);
    when(() => module.getAttribute<String>('__out')).thenReturn('out');
    when(() => module.getAttribute<String>('__err')).thenReturn('');

    final usecase = ExecutePythonCodeUseCase();
    final result = await usecase('print(1)');

    expect(result.output, 'out');
  });
}
