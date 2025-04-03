class TasksController < ApplicationController
    before_action :set_post, only: [:show, :destroy, :edit, :update]

    def index
        @tasks = Task.all
    end

    def show; end

    def new
        @task = Task.new
    end

    def destroy
        if @task.destroy
            redirect_to tasks_url
        else
            redirect_to @task
        end
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to @task
        else
            rende :new, status: :unprocessable_entity
    end
end

def edit; end

def update
    if @task.update(task_params)
        redirect_to task_path(@task)
    else
        rende :new, status: :unprocessable_entity
end
end

    private

    def set_post
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :date, :boolean)
    end

end