if  @syn && !@syn.empty?
  json.synonyms @syn.each do |s|
    json.matched_word s.matched_word
    json.summary s.summary
    json.details s.details
    json.words s.words
    json.shloka s.shloka
  end
end