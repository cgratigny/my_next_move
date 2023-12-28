class MoveState < ClassyEnum::Base
  def tailwind_class
    (tailwind_classes + ["rounded-md", "p-1", "text-xs", "border", "border-slate-100", "dark:text-gray-800"]).join(" ")
  end
end

class MoveState::Open < MoveState
  def tailwind_classes
    ["bg-green-100"]
  end
end

class MoveState::Complete < MoveState
  def tailwind_classes
    ["bg-true-gray-100"]
  end
end
