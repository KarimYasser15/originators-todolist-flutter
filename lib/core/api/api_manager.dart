class ApiManager {
  // TODO: based url based on which environemt so manage the envs and use here just key relativer to your current env
  static const baseUrl = "http://localhost:3000/api/v1";
  static const registerEndPoint = "/auth/register";
  static const loginEndPoint = "/auth/login";
  static const todoEndPoint = "/todos/";
  static const deleteManyTodosEndPoint = "/todos/delete-many";
  static const deleteAllTodosEndPoint = "/todos/delete-all";
  static const restoreManyTodosEndPoint = "/todos/restore-many";
  static const restoreAllTodosEndPoint = "/todos/restore-all-todos";

  // //Abdelrahman
  // static const baseUrl = "todo-app-production-e92c.up.railway.app";
  // static const registerEndPoint = "/auth/register";
  // static const loginEndPoint = "/auth/login";
  // static const todoEndPoint = "/todos/";
  // static const createTodoEndPoint = "/todo/create-todo";
  // static const getTodoEndPoint = "/todo/get-todos";
  // // static const getTodoEndPoint = "/todo/get-todos";
  // static const deleteManyTodosEndPoint = "/todos/delete-many";
  // static const deleteAllTodosEndPoint = "/todos/delete-all";
  // static const restoreManyTodosEndPoint = "/todos/restore-many";
  // static const restoreAllTodosEndPoint = "/todos/restore-all-todos";
}
