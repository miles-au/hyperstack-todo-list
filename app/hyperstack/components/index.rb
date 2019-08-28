# app/hyperstack/components/index.rb
class Index < HyperComponent
  include Hyperstack::Router::Helpers
  render(SECTION, class: :main) do         # add class main
    UL(class: 'todo-list') do              # add class todo-list
      Todo.send(match.params[:scope]).each do |todo|
        TodoItem(todo: todo)
      end
    end
  end
end