json.array!(@labels) do |label|
  json.extract! label, :id, :name, :color, Label.COLOR_CLASSES[label.color]
end
