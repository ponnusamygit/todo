json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :due_date, :user_id
  json.url task_url(task, format: :json)
end
