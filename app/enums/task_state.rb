class TaskState < ClassyEnum::Base
  def tailwind_class
    (tailwind_classes + ["rounded-md", "p-1", "text-xs", "border", "border-slate-100", "dark:text-gray-800"]).join(" ")
  end
end

class TaskState::Todo < TaskState
  def tailwind_classes
    ["bg-green-100"]
  end
end

class TaskState::InProgress < TaskState
  def tailwind_classes
    ["bg-yellow-100"]
  end
end

class TaskState::Complete < TaskState
  def tailwind_classes
    ["bg-true-gray-100"]
  end
end
