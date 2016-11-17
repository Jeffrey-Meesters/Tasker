class TasksController < ApplicationController

def index

end

def show
@tasks = @cards.tasks.all
  @taks = task.find(params[:id])
end

def new
  @task = @boards.cards.build
end


def create
  task = @boards.cards.build(task_params)

  if task.save
    render status: 200, json: {
      message: "task successfully created",
      task: task
    }.to_json
  else
    render status: 422, json: {
      error: task.errors.full_messages
    }.to_json
  end
end

end
