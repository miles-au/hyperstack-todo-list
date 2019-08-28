class TodoItem < HyperComponent
  param :todo
  render(LI, class: 'todo-item') do # add the todo-item class
    if @editing
      EditItem(class: :edit, todo: todo)  # add the edit class
      .on(:saved, :cancel) { mutate @editing = false }
    else
      INPUT(type: :checkbox, class: :toggle, checked: todo.completed) # add the toggle class
      .on(:change) { todo.update(completed: !todo.completed) }
      LABEL { todo.title }
      .on(:double_click) { mutate @editing = true }
      A(class: :destroy) # add the destroy class and remove the -X- placeholder
      .on(:click) { todo.destroy }
    end
  end
end
