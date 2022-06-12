require './lib/command_builder'
require './lib/input'
require './lib/commands/add_inbox_task'
require './lib/commands/show_inbox_tasks'
require './lib/commands/show_today_tasks'
require './lib/commands/show_week_tasks'
require './lib/commands/show_later_tasks'
require './lib/commands/remove_task'
require './lib/commands/move_task'

describe CommandBuilder do
  let(:command_builder) { CommandBuilder.new(input) }

  describe '#build' do
    subject { command_builder.build }

    context 'when command is unknown' do
      let(:input) { Input.new(double(text: 'test')) }

      it 'creates add to inbox task command by default' do
        expect(subject).to be_kind_of(Commands::AddInboxTask)
      end
    end

    context 'when command is /inbox' do
      let(:input) { Input.new(double(text: '/inbox')) }

      it { is_expected.to be_kind_of(Commands::ShowInboxTasks) }
    end

    context 'when command is /today' do
      let(:input) { Input.new(double(text: '/today')) }

      it { is_expected.to be_kind_of(Commands::ShowTodayTasks) }
    end

    context 'when command is /week' do
      let(:input) { Input.new(double(text: '/week')) }

      it { is_expected.to be_kind_of(Commands::ShowWeekTasks) }
    end

    context 'when command is /later' do
      let(:input) { Input.new(double(text: '/later')) }

      it { is_expected.to be_kind_of(Commands::ShowLaterTasks) }
    end

    context 'when command matches to remove' do
      let(:input) { Input.new(double(text: '/rm sx')) }

      it { is_expected.to be_kind_of(Commands::RemoveTask) }
    end

    context 'when command matches to move task to inbox' do
      let(:input) { Input.new(double(text: '/mvi sx')) }

      it { is_expected.to be_kind_of(Commands::MoveTask) }
    end

    context 'when command matches to move task to today' do
      let(:input) { Input.new(double(text: '/mvt sx')) }

      it { is_expected.to be_kind_of(Commands::MoveTask) }
    end

    context 'when command matches to move task to week' do
      let(:input) { Input.new(double(text: '/mvw sx')) }

      it { is_expected.to be_kind_of(Commands::MoveTask) }
    end

    context 'when command matches to move task to later' do
      let(:input) { Input.new(double(text: '/mvl sx')) }

      it { is_expected.to be_kind_of(Commands::MoveTask) }
    end
  end
end
