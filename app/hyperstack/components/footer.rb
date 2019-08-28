# app/hyperstack/components/footer.rb
class Footer < HyperComponent
  include Hyperstack::Router::Helpers
  def link_item(path)
    # wrap the NavLink in a LI and
    # tell the NavLink to change the class to :selected when
    # the current (active) path equals the NavLink's path.
    LI { NavLink("/#{path}", active_class: :selected) { path.camelize } }
  end
  render(DIV, class: :footer) do   # add class footer
    SPAN(class: 'todo-count') do
      # pluralize returns the second param (item) properly
      # pluralized depending on the first param's value.
      "#{pluralize(Todo.active.count, 'item')} left"
    end
    UL(class: :filters) do         # wrap links in a UL element with class filters
      link_item(:all)
      link_item(:active)
      link_item(:completed)
    end
  end
end