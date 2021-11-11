module SupportHash
  def self.rss_hash
    {
      old_format: "rss",
      title: "Новые уроки на Хекслете",
      description: "Практические уроки по программированию",
      link: "https://ru.hexlet.io/",
      items: [
        {
          title: "Введение в Spring / Java: Корпоративные приложения на Spring Boot",
          date: 1636466689,
          description: "Цель: Познакомиться с фреймворком Spring Boot",
          link: "https://ru.hexlet.io/courses/java-spring/lessons/intro-to-spring/theory_unit",
          id: "2197"
        },
        {
          title: "Tests / Java: Веб-технологии",
          date: 1636466492,
          description: "Цель: Научиться писать интеграционные тесты",
          link: "https://ru.hexlet.io/courses/java-web/lessons/tests/theory_unit",
          id: "2196"
        },
        {
          title: "Название урока / Основы тестирования программного обеспечения",
          date: 1636128776,
          description: "Цель: Описание урока",
          link: "https://ru.hexlet.io/courses/software-testing-basics/lessons/first_lesson/theory_unit",
          id: "2195"
        }
      ]
    }
  end

  def self.atom_hash
    {
      old_format: "atom",
      title: "Мой блог",
      id: "urn:uuid:60a76c80-d399-11d9-b91C-0003939e0af6",
      updated: 1071340202,
      author: "Иван Петров",
      description: "Самый лучший блог на свете",
      items: [
        {
          title: "Фотографии из Африки",
          date: 1636572602,
          description: "Я вернулся из Африки и выложил свои фотографии...",
          id: "urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a",
          link: "http://example.org/2003/12/13/atom01"
        },
        {
          title: "Фотографии из Дыры",
          date: 1636558202,
          description: "Я вернулся из какой-то дыры и выложил прекрасные фотографии...",
          id: "urn:uuid:1225c695-cfb7-4ebb-aaaa-80da344efa6b",
          link: "http://example.org/2003/12/13/atom02"
        }
      ]
    }
  end

  def self.sort_rss_hash
    [1636466689, 1636466492, 1636128776].sort
  end

  def self.sort_atom_hash
    [1636572602, 1636558202].sort
  end

  def self.reverse_rss_hash
    [1636466689, 1636466492, 1636128776].reverse
  end

  def self.reverse_atom_hash
    [1636572602, 1636558202].reverse
  end

  def self.items_rss_hash
    [1636466689, 1636466492, 1636128776]
  end

  def self.items_atom_hash
    [1636572602, 1636558202]
  end
end
