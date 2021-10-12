require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "titleが0文字のとき、Todoインスタンスを作ることができないこと" do
    t = Todo.new(title: "", body: "body")
    assert_not t.save
    assert_includes(t.errors.full_messages, "Title is too short (minimum is 1 character)")
  end

  test "titleが101文字のとき、Todoインスタンスを作ることができないこと" do
    t = Todo.new(title: "a" * 101, body: "body")
    assert_not t.save
    assert_includes(t.errors.full_messages, "Title is too long (maximum is 100 characters)")
  end

  test "titleが1文字のとき、Todoインスタンスを作ることができること" do
    t = Todo.new(title: "a", body: "body")
    assert t.save
  end

  test "titleが100文字のとき、Todoインスタンスを作ることができること" do
    t = Todo.new(title: "a" * 100, body: "body")
    assert t.save
  end

  test "bodyが0文字のとき、Todoインスタンスを作ることができないこと" do
    t = Todo.new(title: "title", body: "")
    assert_not t.save
    assert_includes(t.errors.full_messages, "Body is too short (minimum is 1 character)")
  end

  test "bodyが501文字のとき、Todoインスタンスを作ることができないこと" do
    t = Todo.new(title: "title", body: "b" * 501)
    assert_not t.save
    assert_includes(t.errors.full_messages, "Body is too long (maximum is 500 characters)")
  end

  test "bodyが1文字のとき、Todoインスタンスを作ることができること" do
    t = Todo.new(title: "title", body: "b")
    assert t.save
  end

  test "bodyが500文字のとき、Todoインスタンスを作ることができること" do
    t = Todo.new(title: "title", body: "b" * 500)
    assert t.save
  end
end
