class TaskState < ClassyEnum::Base
  def tailwind_class
    (tailwind_classes + ["rounded-sm", "p-0.5", "text-xs", "border", "border-slate-100", "dark:text-gray-400", "dark:border-0"]).join(" ")
  end
end

class TaskState::Todo < TaskState
  def tailwind_classes
    ["bg-green-100 dark:bg-green-800"]
  end
end

class TaskState::InProgress < TaskState
  def tailwind_classes
    ["bg-yellow-100 dark:bg-green-800"]
  end
end

class TaskState::Complete < TaskState
  def tailwind_classes
    ["bg-true-gray-100 dark:bg-gray-800"]
  end
end
