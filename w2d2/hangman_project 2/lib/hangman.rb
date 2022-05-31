class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      true
    else
      false
    end
  end

  def get_matching_indices(char)
    word = @secret_word.split("")
    if @secret_word.include?(char)
      word.each_index.select {|i| word[i]== char}
    else
      return []
    end
  end

  def fill_indices(char, arr)
    arr.each {|i| @guess_word[i] = char}
  end
  
  def try_guess(char)
    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
      @attempted_chars << char
      
    

   indices = self.get_matching_indices(char)
    if indices.empty?
      @remaining_incorrect_guesses -= 1
    else self.fill_indices(char, indices)
    end

    return true
  end

  def ask_user_for_guess
    p "Enter a char:"

    guess = gets.chomp

    return self.try_guess(guess)

  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
