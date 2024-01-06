class NoteSource < ClassyEnum::Base
  def tailwind_class
    (tailwind_classes + [""]).join(" ")
  end
end

class NoteSource::User < NoteSource
  def tailwind_classes
    [""]
  end
end

class NoteSource::System < NoteSource
  def tailwind_classes
    ["italic", "text-slate-700"]
  end
end
