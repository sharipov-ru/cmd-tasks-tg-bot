require './lib/commands/add_inbox_task'
require './lib/commands/show_inbox_tasks'
require './lib/commands/show_today_tasks'
require './lib/commands/show_week_tasks'
require './lib/commands/show_later_tasks'
require './lib/commands/move_task'
require './lib/commands/remove_task'

class CommandBuilder
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def build
    case input.text
    when '/start'
      Commands::Start.new(input)
    when '/stop'
      Commands::Stop.new(input)
    when '/inbox'
      Commands::ShowInboxTasks.new(input)
    when '/today'
      Commands::ShowTodayTasks.new(input)
    when '/week'
      Commands::ShowWeekTasks.new(input)
    when '/later'
      Commands::ShowLaterTasks.new(input)
    when /\/rm [a-z]{2}/
      Commands::RemoveTask.new(input)
    when /\/mvi [a-z]{2}/
      Commands::MoveTask.new(input, new_scope: 'inbox')
    when /\/mvt [a-z]{2}/
      Commands::MoveTask.new(input, new_scope: 'today')
    when /\/mvw [a-z]{2}/
      Commands::MoveTask.new(input, new_scope: 'week')
    when /\/mvl [a-z]{2}/
      Commands::MoveTask.new(input, new_scope: 'later')
    else
      Commands::AddInboxTask.new(input)
    end
  end
end
