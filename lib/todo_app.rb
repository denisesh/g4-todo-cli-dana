class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
    @projects = []
    @tasks = []
  end

  def run
    print_project_menu
    welcome_menu = true


    while welcome_menu
      input = gets.chomp
      if input == 'list'
      putting_project

      elsif input == 'create'
        create_puts
        create_gets_project_name
        create_add_project
        print_project_menu

      elsif input == 'delete'
        delete_puts_project
        delete_gets_project
        delete_manipulate_project

      elsif input == 'rename'
        rename_puts_project
        rename_gets_project
        if @projects.include?(@rename_project)
          puts "Please enter the new project name:\n"
          new_project_name = gets.chomp
          @projects.delete(@rename_project)
          @projects << new_project_name
        end

      elsif input == 'edit'
        puts "Which project would you like to edit?\n"
        puts "Projects:\n  *#{print_projects} "
        edit_project = gets.chomp
        if @projects.include?(edit_project)
          puts "Editing Project: #{print_projects} "
          puts "'list' to list tasks"
          puts "'create' to create a new task"
          puts "'edit' to edit a task"
          puts "'complete' to complete a task and remove it from the list"


          task_menu = true
          while task_menu
            task_input = gets.chomp
            if task_input == 'list'
              puts "  #{list_tasks}"
            elsif task_input == 'create'
              puts "Please enter the task you would like to add."
              new_task = gets.chomp
              @tasks << new_task
            elsif task_input == 'edit'
              puts "Please enter the task you would like to edit."
              edit_task = gets.chomp
              if @tasks.include?(edit_task)
                puts "Please enter the new task name:\n"
                new_task_name = gets.chomp
                @tasks.delete(edit_task)
                @tasks << new_task_name
              else
                puts "task not found: 'not here'"
              end
            elsif task_input == 'complete'
              puts "Which task have you completed?"
              puts "  #{list_tasks}"
              complete_task = gets.chomp
              if @tasks.include?(complete_task)
                @tasks.delete(complete_task)
                complete_task = "#{complete_task}: completed"
                @tasks << complete_task
              else
                puts "task not found: 'not here'"
              end
            elsif task_input == 'back'
              print_project_menu
              task_menu = false
            elsif task_input == 'quit'
              welcome_menu = false
              task_menu = false
            end
          end
        end

      elsif input == 'quit'
        welcome_menu = false
      end
    end
  end

  def list_tasks
    list_tasks =''
    if @tasks == []
      "none"
    else
      list_tasks = @tasks.each do |name|
         name
      end
      list_tasks.join
    end
  end

  def print_projects
    list_names = ''
    if @projects == []
      "none"
    else
      list_names = @projects.each do |name|
        name
      end
      list_names.join
    end
  end

  def real_puts message = ""
    $stdout.puts message
  end
end

################MYCODESTARTSHERE############
#printer
def print_project_menu
  puts "Welcome"
  puts "'list' to list projects"
  puts "'create' to create a new project"
  puts "'edit' to edit a project"
  puts "'rename' to rename a project"
  puts "'delete' to rename a project"
end

def putting_project
  #welcome menu puts
puts "Projects:\n  #{print_projects} "
end

def create_puts
  puts "Please enter the new project name:\n"
end

def create_gets_project_name
  @create_project = gets.chomp
end

def delete_puts_project
  puts "Please enter the project name to delete:\n"
end

def delete_gets_project
  @delete_project = gets.chomp
end

def rename_puts_project
  puts "Please enter the project name to rename:\n"
end

def rename_gets_project
  @rename_project = gets.chomp
end
#getter

def get_input
  gets.chomp
end

#data
def create_add_project
  @projects << @create_project
end

def delete_manipulate_project
  if @projects.include?(@delete_project)
    @projects.delete(@delete_project)
  end
end
