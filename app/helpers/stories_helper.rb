module StoriesHelper

  def truncate_letters(chars, text)
  	if text.length <= chars
      return text
    elsif text[chars] == " " # Si la posicion donde corta justo es terminando la palabra
  	   return text[0..chars-1] + "..."
  	else
      last_blank = text[0..chars-1].rindex(" ")
      return text[0..(last_blank-1)] + "..."
    end
  end
#puts "Hello"
#puts first_words(1, "Hola como estas po compadre")
end
