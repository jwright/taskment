require "task_sentiment"

class TasksController < ApplicationController
  def new
  end

  def create
    analyzer = TaskSentiment::Analyzer.new(params["phrase"])
    results = analyzer.analyze

    if results["error"]
      @results = results["error"]["message"]
    else
      @results = results["choices"]&.first&.[]("text")
    end

    render :new
  end
end
