module Refinery
  module Portfolio
    class Version
      MAJOR = 0
      MINOR = 9
      TINY = 7
      BUILD = 3

      STRING = [MAJOR, MINOR, TINY, BUILD].compact.join('.')
    end
  end
end