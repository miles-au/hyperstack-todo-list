class Header < HyperComponent
  before_mount { @new_todo = Todo.new }
  render(HEADER, class: :header) do                   # add the 'header' class
    H1 { 'todos' }                                    # add the hero unit.
    EditItem(class: 'new-todo', todo: @new_todo)      # add 'new-todo' class
    .on(:saved) { mutate @new_todo = Todo.new }
  end
end