class ApiManager {
  // TODO: based url based on which environemt so manage the envs and use here just key relativer to your current env
  static const baseUrl = "http://localhost:3000";
  static const registerEndPoint = "/auth/register";
  static const loginEndPoint = "/auth/login";
  static const todoEndPoint = "/todos/";
  static const deleteManyTodosEndPoint = "/todos/delete-many";
  static const deleteAllTodosEndPoint = "/todos/delete-all";
}
