abstract class ParamStreamUseCase<Type, Params> {
  Stream<Type> execute(Params params);
}
