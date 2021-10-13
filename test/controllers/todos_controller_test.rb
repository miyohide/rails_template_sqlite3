require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:valid_todo)
  end

  test "indexにGETでアクセスできること" do
    get todos_url
    assert_response :success
  end

  test "newにGETでアクセスできること" do
    get new_todo_url
    assert_response :success
  end

  test "正しい値を送信したら、Todoが作られること" do
    assert_difference('Todo.count') do
      post todos_url, params: { todo: { body: @todo.body, title: @todo.title } }
    end

    assert_redirected_to todo_url(Todo.last)
  end

  test "不適切な値を送信したら、Todoが作られないこと" do
    assert_no_difference('Todo.count') do
      post todos_url, params: { todo: { body: "", title: "" } }
    end
    # see. https://api.rubyonrails.org/classes/ActionDispatch/Assertions/ResponseAssertions.html
    assert_response 422
  end

  test "対象データにGETアクセスできること" do
    get todo_url(@todo)
    assert_response :success
  end

  test "editページにGETアクセスできること" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "正しい値を送信したら、Todoが更新されること" do
    patch todo_url(@todo), params: { todo: { body: @todo.body, title: @todo.title } }
    assert_redirected_to todo_url(@todo)
  end

  test "不正な値を送信したら、Todoが更新されないこと" do
    patch todo_url(@todo), params: { todo: { body: "", title: "" } }
    assert_response 422
  end

  test "対象データに対してDELETEアクセスしたらTodoが削除されること" do
    assert_difference('Todo.count', -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end
