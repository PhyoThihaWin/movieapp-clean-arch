abstract class ParamUseCase<Params, Type> {
  Future<Type> execute(Params params);
}
